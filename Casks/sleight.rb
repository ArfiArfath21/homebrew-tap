cask "sleight" do
  version "0.1.0"
  sha256 "aef9375c4fb054ee4b6f476312e1b2abf017118a321d7876ca9dd7d62934a799"

  url "https://github.com/ArfiArfath21/sleight/releases/download/v#{version}/Sleight.dmg"
  name "Sleight"
  desc "Camera hand gestures: recognised by Sleight, assigned by you"
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
