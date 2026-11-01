cask "sleight" do
  version "0.3.0"
  sha256 "d3e643f2290575d2895c7e991d944d621831d885a5c885f2f6bf1a9b7a38451d"

  url "https://github.com/ArfiArfath21/sleight/releases/download/v#{version}/Sleight.dmg"
  name "Sleight"
  desc "Control your Mac with hand gestures and on-device voice commands"
  homepage "https://github.com/ArfiArfath21/sleight"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "Sleight.app"

  # Sleight isn't notarized, so clear the download quarantine flag
  # to let it open without a Gatekeeper prompt.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-d", "com.apple.quarantine", "{{appdir}}/Sleight.app"],
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Sleight",
    "~/Library/Preferences/com.arfiarfath21.sleight.plist",
  ]
end
