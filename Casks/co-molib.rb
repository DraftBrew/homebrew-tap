cask "co-molib" do
  version "1.2.91"
  sha256 "545e339850c93890bba894003129574c369b6d1ddf52cb47dcaa19463cbeeb5c"

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
