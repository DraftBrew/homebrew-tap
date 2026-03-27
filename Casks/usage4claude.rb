cask "usage4claude" do
  version "2.6.0"
  sha256 "5a9dc9fed1c3fba079bcf166a15fe25d84be25d22fc3e00f168491bb04e56450"

  url "https://github.com/f-is-h/Usage4Claude/releases/download/v#{version}/Usage4Claude-v#{version}.dmg"
  name "Usage4Claude"
  desc "Monitor your Claude AI 5-hour/7-day usage quota in real-time on the menubar"
  homepage "https://github.com/f-is-h/Usage4Claude"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Usage4Claude.app"

  zap trash: [
    "~/Library/Application Scripts/xyz.fi5h.Usage4Claude",
    "~/Library/Containers/xyz.fi5h.Usage4Claude",
  ]

  caveats <<~EOS
    The application is not signed. Run

      brew install --no-quarantine draftbrew/tap/usage4claude
  EOS
end
