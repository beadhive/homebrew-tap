cask "beadhive-app" do
  # version/sha256 populated by `just promote-cask` from the real
  # beadhive-app-0.1.0 release (bh-infra-5n0.7).
  version "0.1.2"
  sha256 "1e7a8db86c14a65a4054f51045b80e4fa731f1088dae571fe8eeffe61f3e3c2a"

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

      `HOMEBREW_CASK_OPTS='--no-quarantine'` no longer works: Homebrew
      deprecated and then removed that flag (Homebrew/brew#20755, gone as
      of brew's `ba25213c81`) -- setting it is now a silent no-op and this
      cask will still be quarantined. There is no cask-level opt-out;
      strip the attribute yourself after every install/upgrade instead:

        xattr -dr com.apple.quarantine /Applications/Beadhive.app

      `brew upgrade --cask` re-quarantines every time, so this needs
      re-running after each upgrade, not just the first install.
    EOS
  end
end
