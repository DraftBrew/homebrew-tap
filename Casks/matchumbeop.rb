cask "matchumbeop" do
  version "1.0"
  sha256 "917526e0e9d5376ab5c774fc291cc2423f79fa426595e2e5452b6b3c61433a64"

  url "https://github.com/ssut/Matchumbeop/releases/download/v#{version}/Matchumbeop-#{version}.dmg"
  name "matchumbeop"
  desc "Korean Spell Checker for macOS"
  homepage "https://github.com/ssut/Matchumbeop"

  depends_on macos: ">= :sonoma"

  app "Matchumbeop.app"

  zap trash: [
    "~/Library/Application Support/me.ssut.matchumbeop",
    "~/Library/Caches/me.ssut.matchumbeop",
    "~/Library/HTTPStorages/me.ssut.matchumbeop",
    "~/Library/HTTPStorages/me.ssut.matchumbeop.binarycookies",
    "~/Library/Preferences/me.ssut.matchumbeop.plist",
  ]
end
