cask "relagit" do
  arch arm: "arm64", intel: "x64"

  version "0.16.10"
  sha256 arm:   "300a2189c795a4d6b8288b523880e853499d7bf50ba95d9d60807968f410aebb",
         intel: "426be23bb09bea8880858ebb00fe9fe52227b72c7b43421f45760d39afd8fcea"

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

  caveats <<~EOS
    The application is not signed. Run

      brew install --no-quarantine draftbrew/tap/relagit
  EOS
end
