cask "relagit" do
  arch arm: "arm64", intel: "x64"

  version "0.16.9"
  sha256 arm:   "de3f62fb1a0990a98e7ca6f70bbcf1e90fe5672897a91c099800e81152ac5854",
         intel: "5aa3f08a0214c7610b5c7056a7d39e6b328890c09e1dc294bc42b8fc0861a4b2"

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
