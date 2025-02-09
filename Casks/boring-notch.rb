cask "boring-notch" do
  version "2.5,jellyfin.snoring"
  sha256 "97780877acdbecc6701fc5970478c708f36417b3c28c2fda3db07732645fdce0"

  url "https://github.com/TheBoredTeam/boring.notch/releases/download/#{version.csv.second}/JellyfinSnoring.dmg",
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
