cask "satyrn" do
  arch arm: "arm64", intel: "x64"

  version "0.0.68"
  sha256 arm:   "c8fd319640b0141a1488901cf61e756e332a07823608283a685a60a2e2e3f0d7",
         intel: "1009bdc876a9e5b7543ec54a5b796e83e58ff56a0de2be2d68e7d6135cb2f551"

  url "https://d2a69lt3a0puqr.cloudfront.net/satyrn-#{version}-#{arch}.dmg",
      verified: "d2a69lt3a0puqr.cloudfront.net/"
  name "satyrn"
  desc "Modern Jupyter client"
  homepage "https://satyrn.app/"

  livecheck do
    url "https://satyrn.app/download-link"
    regex(/satyrn-v?(\d+(?:\.\d+)+)-#{arch}.dmg/i)
  end

  app "satyrn.app"

  zap trash: [
    "~/Library/Application Support/satyrn",
    "~/Library/Preferences/com.satyrn.app.plist",
    "~/Library/Saved Application State/com.satyrn.app.savedState",
  ]
end
