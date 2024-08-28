cask "surfer" do
  arch arm: "-arm64", intel: ""

  version "1.0.2"
  sha256 arm:   "7d2ea0a47c11cfa6c7a9b914b6055347c055ab9e79e7569d0fa08f03f5dc58a7",
         intel: "9371e9d52bdfdc7d504e33dd8bba77cc316762003ead1f9dd50e02c5baa9b791"

  url "https://github.com/CEREBRUS-MAXIMUS/Surfer-Data/releases/download/v#{version}/Surfer-#{version}#{arch}.dmg",
      verified: "github.com/CEREBRUS-MAXIMUS/Surfer-Data/"
  name "surfer"
  desc "Digital footprint exporter"
  homepage "https://surfsup.ai/"

  depends_on macos: ">= :high_sierra"

  app "Surfer.app"

  zap trash: [
    "~/Library/Application Support/Surfer",
    "~/Library/Logs/Surfer",
    "~/Library/Preferences/StraightOuttaHarbour.CEREBRUS-MAXIMUS.surfer.plist",
    "~/Library/Saved Application State/StraightOuttaHarbour.CEREBRUS-MAXIMUS.surfer.savedState",
  ]
end
