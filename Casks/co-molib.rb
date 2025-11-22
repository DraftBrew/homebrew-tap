cask "co-molib" do
  version "1.2.84"
  sha256 "3215bfe656d4b484e71d89aafbbb5b15b9744eec78f0bb62dea777f6d835eb59"

  url "https://github.com/swmaeStrong/Pawcus-Public/releases/download/v#{version}/Co-molib.dmg",
      verified: "github.com/swmaeStrong/Pawcus-Public/"
  name "Co-molib"
  desc "Developer productivity timer and app usage tracker"
  homepage "https://www.co-molib.com/"

  depends_on macos: ">= :sonoma"

  app "Comolib.app"

  zap trash: [
    "~/Library/Application Support/Pawcus",
    "~/Library/Preferences/com.pawcus.Pawcus.plist",
    "~/Library/Saved Application State/com.pawcus.Pawcus.savedState",
  ]
end
