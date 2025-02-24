cask "relagit" do
  arch arm: "arm64", intel: "x64"

  version "0.16.8"
  sha256 arm:   "ca1645c8e9e3407642c7a28d645f9ce3149b586616ef49bf37b86444b4db9288",
         intel: "25b2614314f63f5ac4d7c3b3152f771e3133664899fa2169f0a388d59fd798c6"

  url "https://github.com/relagit/relagit/releases/download/v#{version}/RelaGit-mac-#{arch}.dmg",
      verified: "github.com/relagit/relagit/"
  name "RelaGit"
  desc "Elegant solution to graphical version control"
  homepage "https://rela.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "RelaGit.app"

  zap trash: [
    "~/.relagit",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.relagit.app.sfl*",
    "~/Library/Application Support/relagit",
    "~/Library/Preferences/com.relagit.app.plist",
  ]
end
