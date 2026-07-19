# beadhive/homebrew-tap — task runner.

# List all available recipes.
default:
    @just --list

# Homebrew's actual tap clone (~/Library/Taps/beadhive/homebrew-tap) is a
# separate `git clone` of this repo's origin/main — NOT this checkout. Edit
# Formula/beadhive.rb here and `brew install`/`test`/`audit`/`bottle` will
# silently run against the stale origin copy instead. Force it to be a
# symlink back to this checkout so local verification is ever testing what
# we're about to commit. Safe to blow away and relink: it's just a cache.
_link-tap:
    #!/usr/bin/env bash
    set -euo pipefail
    REPO_DIR="{{justfile_directory()}}"
    TAP_DIR="$(brew --repository beadhive/tap 2>/dev/null || echo "$(brew --repository)/Library/Taps/beadhive/homebrew-tap")"
    if [ -L "$TAP_DIR" ] && [ "$(readlink "$TAP_DIR")" = "$REPO_DIR" ]; then
        exit 0
    fi
    echo "==> Linking Homebrew tap ($TAP_DIR) -> $REPO_DIR"
    rm -rf "$TAP_DIR"
    mkdir -p "$(dirname "$TAP_DIR")"
    ln -s "$REPO_DIR" "$TAP_DIR"

# Promote a manually-cut PyPI release of `beadhive` to this tap's formula.
# Run this AFTER cutting the release in beadhive/beadhive (tag push -> PyPI
# publish) — it verifies the version is really live + installable on PyPI
# (not just "the tag was pushed"), updates Formula/beadhive.rb, then rebuilds
# + tests locally. Does NOT commit or push — review the diff yourself first.
#
# Only bumps the top-level url/sha256. If beadhive's own dependencies
# changed in this release, resource blocks need regenerating separately
# (see README's "Bottling" section for the pip --report based process).
#
# version is optional — omit it to auto-detect PyPI's current latest stable
# release. Usage: just promote / just promote 0.2.0
promote version="": _link-tap
    python3 scripts/promote-pypi-version.py {{version}}
    @echo "==> Rebuilding + testing locally..."
    -brew uninstall --force beadhive/tap/beadhive
    brew install --build-from-source beadhive/tap/beadhive
    brew test beadhive/tap/beadhive
    brew audit --formula beadhive/tap/beadhive
    @echo "==> All checks passed. Review the diff (git diff Formula/beadhive.rb), then commit + push."

# Lint GitHub workflows (actionlint, if installed) and the formula
# (`brew style` + `brew audit --strict`). Does not require the tap to be
# built/installed first.
lint: _link-tap
    #!/usr/bin/env bash
    set -euo pipefail
    if command -v actionlint >/dev/null 2>&1; then
        echo "==> actionlint"
        # -ignore: matrix-object-into-container (tests.yml:20) is a known
        # false positive (rhysd/actionlint#77) — same idiom homebrew-core's
        # own tests.yml uses to give only the Linux job --privileged.
        actionlint -ignore 'object, array, and null values should not be evaluated in template'
    else
        echo "==> actionlint not installed, skipping (brew install actionlint)"
    fi
    echo "==> brew style"
    brew style beadhive/tap/beadhive
    echo "==> brew audit --strict"
    brew audit --formula --strict beadhive/tap/beadhive

# Build a local Homebrew bottle for the CURRENT formula version and insert
# its `bottle do ... end` block. Hosts the bottle as a GitHub Release asset
# on this repo (CI-based publishing via publish.yml is blocked by org
# policy — see README). Run this AFTER `just promote` has landed and been
# pushed, so the release tag matches what's actually on `main`.
#
# NOTE: this repo must be PUBLIC for the resulting bottle URL to be
# downloadable by `brew install` (unauthenticated) or by any external
# consumer's `brew tap` at all — a private repo 404s on both.
#
# Two real gotchas this recipe works around (found the hard way):
#   1. `brew bottle` names the local file `name--version...` (double dash),
#      but for a generic root_url host (not GitHub Packages/ghcr.io),
#      `brew install` requests `name-version...` (single dash) — the file
#      must be renamed before uploading or every install 404s.
#   2. `--no-rebuild` avoids an unexplained `rebuild 1` / `.bottle.1.tar.gz`
#      suffix on a formula's first-ever bottle.
#
# Does NOT commit — review the diff yourself first.
bottle: _link-tap
    #!/usr/bin/env bash
    set -euo pipefail
    VERSION=$(brew ruby -e 'puts Formula["beadhive"].version' 2>/dev/null | tail -1)
    TAG="beadhive-${VERSION}"
    ROOT_URL="https://github.com/beadhive/homebrew-tap/releases/download/${TAG}"
    echo "==> Building bottle for beadhive ${VERSION}..."
    brew uninstall --force beadhive/tap/beadhive 2>/dev/null || true
    brew install --build-bottle beadhive/tap/beadhive
    rm -f beadhive-*.bottle*.tar.gz beadhive-*.bottle*.json
    brew bottle --json --no-rebuild --root-url="${ROOT_URL}" beadhive/tap/beadhive
    DOUBLE_DASH_FILE=$(ls beadhive--"${VERSION}".*.bottle.tar.gz)
    JSON_FILE=$(ls beadhive--"${VERSION}".*.bottle.json)
    # Rename to the single-dash form brew install actually requests (gotcha 1).
    SINGLE_DASH_FILE="${DOUBLE_DASH_FILE/beadhive--/beadhive-}"
    cp "$DOUBLE_DASH_FILE" "$SINGLE_DASH_FILE"
    echo "==> Ensuring GitHub release ${TAG} exists..."
    gh release view "${TAG}" --repo beadhive/homebrew-tap >/dev/null 2>&1 || \
      gh release create "${TAG}" --repo beadhive/homebrew-tap \
        --title "beadhive ${VERSION} (bottle)" --notes "Homebrew bottle for beadhive ${VERSION}."
    echo "==> Uploading ${SINGLE_DASH_FILE}..."
    gh release upload "${TAG}" "${SINGLE_DASH_FILE}" --repo beadhive/homebrew-tap --clobber
    echo "==> Inserting bottle DSL into Formula/beadhive.rb..."
    brew bottle --merge --write --no-commit "$(pwd)/${JSON_FILE}"
    rm -f "$DOUBLE_DASH_FILE" "$SINGLE_DASH_FILE" "$JSON_FILE"
    echo "==> Verifying: reinstalling from the bottle..."
    brew uninstall --force beadhive/tap/beadhive
    brew install beadhive/tap/beadhive
    brew test beadhive/tap/beadhive
    echo "==> Done. Review the diff (git diff Formula/beadhive.rb), then commit + push."
