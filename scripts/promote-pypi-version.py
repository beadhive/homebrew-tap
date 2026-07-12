#!/usr/bin/env python3
"""Promote a published PyPI `beadhive` release to Formula/beadhive.rb.

Verifies the version is actually live and installable on PyPI (not just
"the tag was pushed" — confirms the publish workflow really landed a good
package), then rewrites the formula's top-level `url`/`sha256` to point at
it. Does NOT touch the `resource` blocks (transitive deps) — only re-run
those (see README) if beadhive's own dependencies changed in this release.

If <version> is omitted, uses whatever PyPI currently reports as the project's
latest stable release (its `info.version` field — excludes yanked/pre-releases).

Usage: scripts/promote-pypi-version.py [version]
"""
import json
import re
import subprocess
import sys
import urllib.request


def die(msg):
    print(f"ERROR: {msg}", file=sys.stderr)
    sys.exit(1)


def main():
    if len(sys.argv) > 2:
        die("usage: promote-pypi-version.py [version]")
    version = sys.argv[1] if len(sys.argv) == 2 else None

    if version is None:
        print("==> No version given — looking up latest stable release on PyPI...")
        with urllib.request.urlopen("https://pypi.org/pypi/beadhive/json", timeout=15) as resp:
            data = json.load(resp)
        version = data["info"]["version"]
        print(f"    latest stable: {version}")
    else:
        print(f"==> Checking beadhive=={version} is live on PyPI...")
        try:
            with urllib.request.urlopen(
                f"https://pypi.org/pypi/beadhive/{version}/json", timeout=15
            ) as resp:
                data = json.load(resp)
        except urllib.error.HTTPError as e:
            if e.code == 404:
                die(f"beadhive=={version} is not on PyPI yet (404). Did the release workflow finish?")
            raise

    sdist = next((u for u in data["urls"] if u["packagetype"] == "sdist"), None)
    if sdist is None:
        die(f"beadhive=={version} has no sdist on PyPI")
    url = sdist["url"]
    sha256 = sdist["digests"]["sha256"]
    print(f"    found sdist: {url}")

    print(f"==> Verifying beadhive=={version} actually resolves + installs (pip dry-run)...")
    result = subprocess.run(
        [
            sys.executable, "-m", "pip", "install", "--dry-run",
            "--disable-pip-version-check", "--ignore-installed",
            # --dry-run means nothing is actually installed; safe to bypass
            # PEP 668's externally-managed-environment guard for this check.
            "--break-system-packages",
            f"beadhive=={version}",
        ],
        capture_output=True, text=True,
    )
    if result.returncode != 0:
        die(
            f"pip could not resolve beadhive=={version} — treat the PyPI publish as unstable.\n"
            f"{result.stderr}"
        )
    print("    pip dry-run install succeeded")

    print("==> Updating Formula/beadhive.rb...")
    formula_path = "Formula/beadhive.rb"
    with open(formula_path) as f:
        content = f.read()

    # Anchor on exactly 2-space indent (^  url "..."$) so this only touches the
    # top-level package url/sha256, not the 4-space-indented resource blocks'
    # url/sha256 lines for transitive deps.
    new_content, n_url = re.subn(
        r'^  url "[^"]+"$',
        f'  url "{url}"',
        content,
        count=1,
        flags=re.MULTILINE,
    )
    new_content, n_sha = re.subn(
        r'^  sha256 "[a-f0-9]+"$',
        f'  sha256 "{sha256}"',
        new_content,
        count=1,
        flags=re.MULTILINE,
    )
    if n_url == 0 or n_sha == 0:
        die("no url/sha256 substitution happened — formula format may have changed")

    with open(formula_path, "w") as f:
        f.write(new_content)

    print(f"==> Formula updated to beadhive {version}. Review the diff, then commit + push.")


if __name__ == "__main__":
    main()
