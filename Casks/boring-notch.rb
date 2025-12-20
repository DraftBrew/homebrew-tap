cask "boring-notch" do
  version "2.7.3"
  sha256 "23786382548d33c59b309db558e513a92e3f95b63d611544dcddf5d196e46698"

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
