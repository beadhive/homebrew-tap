# beadhive/homebrew-tap — task runner.

# List all available recipes.
default:
    @just --list

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
# Usage: just promote 0.2.0
promote version:
    python3 scripts/promote-pypi-version.py {{version}}
    @echo "==> Rebuilding + testing locally..."
    -brew uninstall --force beadhive/tap/beadhive
    brew install --build-from-source beadhive/tap/beadhive
    brew test beadhive/tap/beadhive
    brew audit --formula beadhive/tap/beadhive
    @echo "==> All checks passed. Review the diff, then:"
    @echo "    git add Formula/beadhive.rb && git commit -m 'beadhive {{version}}' && git push"
