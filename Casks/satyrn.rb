cask "satyrn" do
  arch arm: "arm64", intel: "x64"

  version "0.0.52"
  sha256 arm:   "1b95d2dcc1a7d81bb49ee4d48bbe458c3ca467ef5b14d88849312bf0dc91260e",
         intel: "ccf6c79354d382cf51388a9998b696df74a1f65fed1fd35e4eb2d6e02ddbbd6d"

  url "https://d2a69lt3a0puqr.cloudfront.net/satyrn-#{version}-#{arch}.dmg",
      verified: "d2a69lt3a0puqr.cloudfront.net/"
  name "satyrn"
  desc "Modern Jupyter client"
  homepage "https://satyrn.app/"

  livecheck do
    url "https://satyrn.app/download"
    regex(/satyrn-v?(\d+(?:\.\d+)+)-#{arch}.dmg/i)
  end

  app "satyrn.app"

  zap trash: [
    "~/Library/Application Support/satyrn",
    "~/Library/Preferences/com.satyrn.app.plist",
    "~/Library/Saved Application State/com.satyrn.app.savedState",
  ]
end
