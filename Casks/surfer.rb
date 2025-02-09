cask "surfer" do
  arch arm: "-arm64", intel: ""

  version "1.0.3"
  sha256 arm:   "ca02541e15af250cfee51393c3677ab68d7365df8d1b596a682a8fd52b2fdeb6",
         intel: "3050a935eba5d8410025cb4badd6e59a0a338fa0ca4f6c7e41fd8fad0b4ea2db"

  url "https://github.com/CEREBRUS-MAXIMUS/Surfer-Data/releases/download/v#{version}/Surfer-#{version}#{arch}.dmg",
      verified: "github.com/CEREBRUS-MAXIMUS/Surfer-Data/"
  name "surfer"
  desc "Digital footprint exporter"
  homepage "https://surfsup.ai/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :high_sierra"

  app "Surfer.app"

  zap trash: [
    "~/Library/Application Support/Surfer",
    "~/Library/Logs/Surfer",
    "~/Library/Preferences/StraightOuttaHarbour.CEREBRUS-MAXIMUS.surfer.plist",
    "~/Library/Saved Application State/StraightOuttaHarbour.CEREBRUS-MAXIMUS.surfer.savedState",
  ]
end
