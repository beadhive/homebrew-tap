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

## Bottling

PRs against a formula trigger `.github/workflows/tests.yml`, which builds and bottles it on
each supported platform and uploads the bottles as workflow artifacts. Once the PR is green, a
maintainer publishes the bottles by running the `brew pr-pull` workflow
(`.github/workflows/publish.yml`) — via `gh workflow run publish.yml -f pull_request=<PR#>`, or
manually from the Actions tab — which pulls the built bottles, inserts the `bottle do ... end`
block into the formula, and pushes the commit to `main`. After that, `brew install
beadhive/tap/beadhive` downloads a prebuilt bottle instead of compiling from source.

## Documentation

`brew help`, `man brew`, or [Homebrew's documentation](https://docs.brew.sh).
