cask "satyrn" do
  arch arm: "arm64", intel: "x64"

  version "0.0.57"
  sha256 arm:   "f3d8fce10766d6821fb78e4864dcc1651f094e1b163c7ae2a4b6fadc4627585c",
         intel: "36c1a7df5823ea1f295528729d1b6851c1aa66550c85f409b442ff591a894239"

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
