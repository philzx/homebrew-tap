cask "keydimmer" do
  version "1.0.0"
  sha256 "874ccc107084dc98ae5244a3bffd17cd3666e5d39a7ec7b98af4cc42699e2127"

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
