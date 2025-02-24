cask "boring-notch" do
  version "2.6,wolf.painting"
  sha256 "1a58ec27e5de30faf107fdf8b77575b1c39ace69e77b1330fc4ed6562bf2badc"

  url "https://github.com/TheBoredTeam/boring.notch/releases/download/#{version.csv.second}/WolfPainting.dmg",
      verified: "github.com/TheBoredTeam/boring.notch/"
  name "TheBoringNotch"
  desc "Transform Space: Not so boring Notch"
  homepage "https://theboring.name/"

  livecheck do
    url :url
    regex(/v?(\d+(?:\.\d+)+)/i)
    strategy :github_latest do |json, regex|
      match = json["body"]&.match(regex)
      tag = json["tag_name"]

      "#{match[1]},#{tag}"
    end
  end

  app "boringNotch.app"

  zap trash: [
    "~/Library/Application Scripts/theboringteam.boringnotch",
    "~/Library/Containers/theboringteam.boringnotch",
  ]

  caveats <<~EOS
    The application is not signed.
  EOS
end
