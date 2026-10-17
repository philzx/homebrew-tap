cask "keydimmer" do
  version "1.3.0"
  sha256 "43b24204d0d92e0ff55175a3ebee92603bb4ad5653a2a79960feee486013ac9d"

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
