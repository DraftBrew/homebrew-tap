cask "satyrn" do
  arch arm: "arm64", intel: "x64"

  version "0.0.67"
  sha256 arm:   "992a92a7f8398c71605fc7c7c7961a0fd6763a2f612de62e67f694f0703f45d1",
         intel: "0a797cc52996a6719c3599ab53a7c2c9281d55076a7dab7afed45649a378ac40"

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
