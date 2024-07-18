cask "satyrn" do
  arch arm: "arm64", intel: "x64"

  version "0.0.48"
  sha256 arm:   "1c85f758534d5d57b28c1380a74331bb4eb5e5c27ef177a06c806dca79f8f302",
         intel: "960117d141b65016354f9fb9b3efadec969d72184047bbb976a3f55837738bb7"

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
