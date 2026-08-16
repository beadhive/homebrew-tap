cask "beadhive-app" do
  # PLACEHOLDER, populated by `just promote-cask`. No beadhive-app-* release
  # exists on this repo yet (release.sh landed via bh-app-pic but has not
  # been run for real) -- run `just release <version>` in beadhive-app, then
  # `just promote-cask` here, before this cask is actually installable.
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  # Asset lives on THIS repo's releases, not beadhive-app's: beadhive-app is
  # private, and GitHub 404s unauthenticated requests for release assets on
  # private repos -- indistinguishably from a missing asset -- which is
  # exactly how `brew install` fetches (see scripts/release.sh in
  # beadhive-app and this repo's README).
  url "https://github.com/beadhive/homebrew-tap/releases/download/beadhive-app-#{version}/Beadhive_#{version}_universal.dmg"
  name "Beadhive"
  desc "Desktop app for the Beadhive local factory"
  homepage "https://beadhive.ai/"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^beadhive-app-(\d+(?:\.\d+)+)$/i)
  end

  # auto_updates deliberately left unset (false). It would make `brew
  # upgrade` skip this cask unless run with --greedy -- correct only once
  # the Tauri updater (bh-app-tqc) ships versions; before that it would
  # silently never update an alpha tester.
  depends_on macos: :big_sur

  app "Beadhive.app"

  zap trash: [
    "~/Library/Application Support/ai.beadhive.app",
    "~/Library/Caches/ai.beadhive.app",
    "~/Library/Preferences/ai.beadhive.app.plist",
    "~/Library/Saved Application State/ai.beadhive.app.savedState",
    "~/Library/WebKit/ai.beadhive.app",
  ]

  caveats do
    <<~EOS
      beadhive-app ships ad-hoc signed, not notarized (bh-infra-5n0.5: stay
      unsigned for now). A cask-installed copy is quarantined, so the first
      launch gets Gatekeeper's harsher "Beadhive is damaged and can't be
      opened" dialog -- which doesn't name its actual cause -- rather than
      the milder "developer cannot be verified" you'd see from a locally
      built copy.

      To install anyway, add this to your shell profile rather than passing
      a one-shot flag: Homebrew re-quarantines on every `brew upgrade
      --cask`, so a flag on this install alone would leave you back at the
      same dialog next upgrade. This export is GLOBAL -- it affects every
      cask you install, not just this one:

        export HOMEBREW_CASK_OPTS='--no-quarantine'
    EOS
  end
end
