# beadhive/homebrew-tap

## How do I install these formulae?

```sh
brew install beadhive/tap/beadhive
```

Or `brew tap beadhive/tap` and then `brew install beadhive`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "beadhive/tap"
brew "beadhive"
```

## Releasing a new version

`beadhive` releases are cut manually (tag push in `beadhive/beadhive` triggers its own PyPI
Trusted Publisher workflow). Once that's landed, promote it to this tap:

```sh
just promote 0.2.0
```

This verifies the version is actually live + installable on PyPI (not just "the tag was
pushed"), updates `Formula/beadhive.rb`'s `url`/`sha256`, rebuilds from source locally, and
runs `brew test` + `brew audit`. It does not commit or push — review the diff yourself, then:

```sh
git add Formula/beadhive.rb && git commit -m "beadhive 0.2.0" && git push
```

If `beadhive`'s own dependencies changed in the release, the `resource` blocks (transitive
deps) need regenerating too — see `scripts/pypi-bootstrap.sh`'s sibling process in
`beadhive/infra`, or re-run the sdist-resolution approach used to author them originally
(`pip install --dry-run --report=...` against the new version, then look up each resolved
package's sdist via `https://pypi.org/pypi/<name>/<version>/json`).

## Bottling

`.github/workflows/tests.yml` builds + bottles every PR automatically (read-only, so it's
unaffected by the note below). `.github/workflows/publish.yml` (`brew pr-pull`, which would
insert the `bottle do ... end` block and push to `main`) is **not currently wired up** — the
`beadhive` GitHub org enforces read-only default workflow permissions, which is a hard ceiling
no repo can override upward, so `GITHUB_TOKEN` can't push. Until that's revisited (a PAT-backed
secret would restore full automation without touching org policy), bottling is manual:

```sh
just bottle
```

This builds a bottle for the current formula version, hosts it as a GitHub Release asset on
this repo, inserts the `bottle do ... end` block, and reinstalls to verify the bottle
downloads and works. Run it after `just promote` has landed and been pushed. Does not commit —
review the diff yourself, then `git add Formula/beadhive.rb && git commit -m "bottle: beadhive
0.2.0" && git push`.

**This repo must be public** for the bottle to actually be fetchable — GitHub 404s
unauthenticated requests (including plain `brew install` and any external `brew tap`) against
release assets on a private repo, indistinguishably from a missing asset. Until this repo is
flipped public, only accounts with repo access (i.e., you, via your own `git`/`gh` credentials)
can install from this tap at all, bottle or not.

## Documentation

`brew help`, `man brew`, or [Homebrew's documentation](https://docs.brew.sh).
