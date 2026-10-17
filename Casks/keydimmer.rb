cask "keydimmer" do
  version "1.1.1"
  sha256 "77a0a4c8a1f05bcedacc57226fa7c18fad75dc6250e426d769d6b1ec814b66cf"

  url "https://github.com/philzx/keydimmer/releases/download/v#{version}/KeyDimmer-#{version}.zip"
  name "KeyDimmer"
  desc "Holds the keyboard backlight below the dimmest level macOS allows"
  homepage "https://github.com/philzx/keydimmer"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "KeyDimmer.app"

  # KeyDimmer isn't notarised; without this every install and upgrade is blocked by Gatekeeper.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/KeyDimmer.app"]
  end

  zap trash: "~/Library/Preferences/app.keydimmer.KeyDimmer.plist"
end
