cask "cloister" do
  version "1.0.0"
  sha256 "64de0769ef460a5554e6a7e0916f645c8a2cfab78facb72a4bd36eb47f960c2a"

  url "https://github.com/ArfiArfath21/cloister/releases/download/v#{version}/Cloister.dmg"
  name "Cloister"
  desc "Focus timer that locks keyboard, mouse and apps until the session ends"
  homepage "https://github.com/ArfiArfath21/cloister"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Cloister.app"

  # Cloister isn't notarized, so clear the download quarantine flag
  # to let it open without a Gatekeeper prompt.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-d", "com.apple.quarantine", "{{appdir}}/Cloister.app"],
        must_succeed: false
  end

  zap trash: "~/Library/Preferences/com.arfiarfath21.cloister.plist"
end
