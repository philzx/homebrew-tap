cask "keydimmer" do
  version "1.2.1"
  sha256 "7316f0e41b703bec7be67711b0cc57354131418b8d72b580b5ecdfc7c4996ac7"

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
