cask "sleight" do
  version "0.2.0"
  sha256 "d29a05e6d0cfa428ad3fe7516d98624924acfba83617084efbdfc5b8e6119441"

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
