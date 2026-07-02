cask "capture-this" do
  version "0.2.0"
  sha256 "2a0ada44c377c60361b4d0566e320a06344664fb3d3c84ff35ac97475c12d9b2"

  url "https://github.com/meck93/capture-this/releases/download/v#{version}/CaptureThis.dmg"
  name "CaptureThis"
  desc "Native macOS menu bar app for screen recording"
  homepage "https://github.com/meck93/capture-this"

  depends_on macos: :sequoia
  depends_on arch: :arm64

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CaptureThis.app"],
                   sudo: false
  end

  app "CaptureThis.app"

  zap trash: [
    "~/Library/Application Support/CaptureThis",
    "~/Library/Caches/com.capturethis.CaptureThis",
    "~/Library/Preferences/com.capturethis.CaptureThis.plist",
  ]
end
