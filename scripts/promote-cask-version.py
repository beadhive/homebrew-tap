#!/usr/bin/env python3
"""Promote a `just release`-cut beadhive-app version to Casks/beadhive-app.rb.

beadhive-app's release.sh (in the beadhive-app repo) builds the DMG and
uploads it to THIS repo's releases -- beadhive-app is private, and GitHub
404s unauthenticated requests for release assets on private repos, which is
exactly how `brew install` fetches. So this script looks here, not there.

Verifies the release + its DMG asset are really present (not just "the tag
was pushed"), downloads the DMG to compute a real sha256, then rewrites the
cask's top-level `version`/`sha256`. Does not touch anything else -- url,
livecheck, and zap all interpolate off `version` already.

If <version> is omitted, uses whichever `beadhive-app-*` release this repo's
GitHub Releases API reports as most recent.

Usage: scripts/promote-cask-version.py [version]
"""
import hashlib
import json
import re
import sys
import urllib.error
import urllib.request
from typing import NoReturn

REPO = "beadhive/homebrew-tap"
TAG_PREFIX = "beadhive-app-"
DMG_NAME_TEMPLATE = "Beadhive_{version}_universal.dmg"


def die(msg) -> NoReturn:
    print(f"ERROR: {msg}", file=sys.stderr)
    sys.exit(1)


def api_get(path):
    req = urllib.request.Request(
        f"https://api.github.com{path}",
        headers={"Accept": "application/vnd.github+json"},
    )
    with urllib.request.urlopen(req, timeout=15) as resp:
        return json.load(resp)


def find_release(version):
    if version is not None:
        tag = f"{TAG_PREFIX}{version}"
        try:
            return version, api_get(f"/repos/{REPO}/releases/tags/{tag}")
        except urllib.error.HTTPError as e:
            if e.code == 404:
                die(
                    f"no '{tag}' release on {REPO} yet -- cut it first with "
                    f"'just release {version}' in beadhive-app"
                )
            raise

    print(f"==> No version given -- looking up the latest {TAG_PREFIX}* release on {REPO}...")
    for release in api_get(f"/repos/{REPO}/releases"):
        if release["tag_name"].startswith(TAG_PREFIX):
            found_version = release["tag_name"][len(TAG_PREFIX):]
            print(f"    latest: {release['tag_name']}")
            return found_version, release
    die(
        f"no '{TAG_PREFIX}*' release exists on {REPO} yet -- cut one first "
        f"with 'just release <version>' in beadhive-app"
    )


def main():
    if len(sys.argv) > 2:
        die("usage: promote-cask-version.py [version]")
    version = sys.argv[1] if len(sys.argv) == 2 else None

    version, release = find_release(version)

    dmg_name = DMG_NAME_TEMPLATE.format(version=version)
    asset = next((a for a in release["assets"] if a["name"] == dmg_name), None)
    if asset is None:
        found = [a["name"] for a in release["assets"]]
        die(f"release '{release['tag_name']}' on {REPO} has no '{dmg_name}' asset (found: {found})")

    print(f"==> Downloading {dmg_name} to compute sha256...")
    digest = hashlib.sha256()
    with urllib.request.urlopen(asset["browser_download_url"], timeout=60) as resp:
        for chunk in iter(lambda: resp.read(1 << 16), b""):
            digest.update(chunk)
    sha256 = digest.hexdigest()
    print(f"    sha256: {sha256}")

    print("==> Updating Casks/beadhive-app.rb...")
    cask_path = "Casks/beadhive-app.rb"
    with open(cask_path) as f:
        content = f.read()

    # Anchor on exactly 2-space indent (^  version "..."$ / ^  sha256 "..."$)
    # so this only touches the top-level attributes, not anything nested
    # inside livecheck/caveats blocks.
    new_content, n_version = re.subn(
        r'^  version "[^"]+"$',
        f'  version "{version}"',
        content,
        count=1,
        flags=re.MULTILINE,
    )
    new_content, n_sha = re.subn(
        r'^  sha256 "[a-fA-F0-9]+"$',
        f'  sha256 "{sha256}"',
        new_content,
        count=1,
        flags=re.MULTILINE,
    )
    if n_version == 0 or n_sha == 0:
        die("no version/sha256 substitution happened -- cask format may have changed")

    with open(cask_path, "w") as f:
        f.write(new_content)

    print(f"==> Cask updated to beadhive-app {version}. Review the diff, then commit + push.")


if __name__ == "__main__":
    main()
