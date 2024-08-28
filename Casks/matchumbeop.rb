cask "matchumbeop" do
  version "1.1.0"
  sha256 "6b53ed28edb580581a2ab39300c4960a943e7533c5b7eccd1ad8e1c38d21af37"

  url "https://github.com/ssut/Matchumbeop/releases/download/v#{version}/Matchumbeop-#{version}.dmg"
  name "matchumbeop"
  desc "Korean Spell Checker"
  homepage "https://github.com/ssut/Matchumbeop"

  depends_on macos: ">= :ventura"

  app "Matchumbeop.app"

  zap trash: [
    "~/Library/Application Support/me.ssut.matchumbeop",
    "~/Library/Caches/me.ssut.matchumbeop",
    "~/Library/HTTPStorages/me.ssut.matchumbeop",
    "~/Library/HTTPStorages/me.ssut.matchumbeop.binarycookies",
    "~/Library/Preferences/me.ssut.matchumbeop.plist",
  ]
end
