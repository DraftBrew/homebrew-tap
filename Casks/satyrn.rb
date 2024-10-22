cask "satyrn" do
  arch arm: "arm64", intel: "x64"

  version "0.0.80"
  sha256 arm:   "ef05fa62be66ca963bbe9c96a67dad603b9f106e5bbad479b6d7f5281682dd5e",
         intel: "6a319a0dbfc6518485f4e94528709d23de0e228ef59b3637df5ebfec5c0f0911"

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
