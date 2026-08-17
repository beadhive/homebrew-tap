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

For the desktop app cask, see "Installing beadhive-app" below.

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
release assets on a private repo, indistinguishably from a missing asset. This is also why
`Casks/beadhive-app.rb`'s `url` points at *this* repo's releases rather than beadhive-app's:
beadhive-app is private, so its own release assets would 404 the same way.

## Promoting a new beadhive-app version

beadhive-app releases are cut manually, from a Mac (`just release <version>` in
`beadhive-app`), which builds the universal DMG and uploads it as a release asset on *this*
repo (see the mechanism note under "Bottling" above). Once that's landed, promote it to this
tap's cask:

```sh
just promote-cask 0.2.0
```

This verifies the release asset is really there (not just "the tag was pushed"), downloads it
to compute a real `sha256`, updates `Casks/beadhive-app.rb`'s `version`/`sha256`, reinstalls
locally, and runs `brew audit --cask`. It does not commit or push — review the diff yourself,
then:

```sh
git add Casks/beadhive-app.rb && git commit -m "beadhive-app 0.2.0" && git push
```

## Installing beadhive-app

```sh
brew install --cask beadhive/tap/beadhive-app
xattr -dr com.apple.quarantine /Applications/Beadhive.app
```

beadhive-app ships ad-hoc signed, not notarized (`bh-infra-5n0.5`: stay unsigned for now, it's
pre-alpha). A cask-installed copy is quarantined, so the first launch gets Gatekeeper's harsher
"Beadhive is damaged and can't be opened" dialog — which doesn't name its actual cause — rather
than the milder "developer cannot be verified" dialog a locally built copy would show. The
`xattr` step above strips that quarantine flag so the app launches.

There is no cask-level or `brew`-level opt-out for this: `HOMEBREW_CASK_OPTS='--no-quarantine'`
used to work but Homebrew deprecated and then removed that flag (`Homebrew/brew#20755`), so
setting it is now a silent no-op and the cask will still be quarantined. `brew upgrade --cask`
re-quarantines every time too, so re-run the `xattr` command after every upgrade, not just the
first install.

## Documentation

`brew help`, `man brew`, or [Homebrew's documentation](https://docs.brew.sh).
