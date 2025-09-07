cask "pomocore" do
  version "1.2.51"
  sha256 "98dce7b134bde8bbcea1557e76fac5d61d87d70080122af8865fd955af3b0968"

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
