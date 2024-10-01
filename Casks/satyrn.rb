cask "satyrn" do
  arch arm: "arm64", intel: "x64"

  version "0.0.73"
  sha256 arm:   "60b8732934a2cdab545f5a31ff9283c7980df2f61e34d0a586106ef75bf5dd40",
         intel: "d1a817ced7cdced1032634175ab19e2ae50782a6da6c5a9c41eafac94e8aba3c"

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
