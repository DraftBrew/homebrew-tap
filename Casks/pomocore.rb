cask "pomocore" do
  version "1.1.6"
  sha256 "52461019bae6414d4af97f1e7a172b2231815dcc295452a61ba628b1341fcb55"

  url "https://github.com/swmaeStrong/Pawcus-Public/releases/download/v#{version}/Pomocore.dmg",
      verified: "github.com/swmaeStrong/Pawcus-Public/"
  name "Pomocore"
  desc "Developer productivity timer and app usage tracker"
  homepage "https://www.pomocore.com/"

  depends_on macos: ">= :sonoma"

  app "Pomocore.app"

  zap trash: [
    "~/Library/Application Support/Pawcus",
    "~/Library/Preferences/com.pawcus.Pawcus.plist",
    "~/Library/Saved Application State/com.pawcus.Pawcus.savedState",
  ]
end
