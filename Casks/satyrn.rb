cask "satyrn" do
  arch arm: "arm64", intel: "x64"

  version "0.0.59"
  sha256 arm:   "b5052dd38fd1c8d3074dc52d5a67bd41b78ce7fff401c86465189930db3ee468",
         intel: "b7c172cca9b4205256f1fc8155ab8afb9270ede3650076f64b7d40756a083c46"

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
