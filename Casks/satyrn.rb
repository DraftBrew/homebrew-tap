cask "satyrn" do
  arch arm: "arm64", intel: "x64"

  version "0.0.71"
  sha256 arm:   "aa969ac22d6c568d98a935a52d966b931fd73bd6bfef939b89c737eeea423130",
         intel: "76f2ff9bf65840f86d300b54609d8f6225bfc8d337207eeef5e583f543c6a87b"

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
