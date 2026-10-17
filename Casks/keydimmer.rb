cask "keydimmer" do
  version "1.1.0"
  sha256 "45be3877c59fce2da314460e3cc13c6495f2651dcb1db1d989d28fd038f9d20f"

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
