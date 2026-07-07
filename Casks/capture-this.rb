cask "capture-this" do
  version "0.3.2"
  sha256 "0fb566971afba03308541509d148df70ca1e89ad869e6a34ad178d85ddc0196c"

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
