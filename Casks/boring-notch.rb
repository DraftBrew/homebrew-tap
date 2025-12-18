cask "boring-notch" do
  version "2.7.2"
  sha256 "da0af83c617c6b67aae7479a7c3e886d19657adbac607d3b103cd147c5bfd0aa"

  url "https://github.com/TheBoredTeam/boring.notch/releases/download/v#{version}/boringNotch.dmg",
      verified: "github.com/TheBoredTeam/boring.notch/"
  name "TheBoringNotch"
  desc "Transform Space: Not so boring Notch"
  homepage "https://theboring.name/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "boringNotch.app"

  zap trash: [
    "~/Library/Application Scripts/theboringteam.boringnotch",
    "~/Library/Containers/theboringteam.boringnotch",
  ]

  caveats <<~EOS
    The application is not signed. Run

      brew install --no-quarantine draftbrew/tap/boring-notch
  EOS
end
