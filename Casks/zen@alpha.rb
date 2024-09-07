cask "zen@alpha" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.0-a.37"
  sha256 arm:   "0cf18406f61225c53ca20391b37dcdcbfd3dd80bf758639b56962e38085e529d",
         intel: "4de8907641989639ee159681cd131a22a20fcf414373543a62ee0f9df2739845"

  url "https://github.com/zen-browser/desktop/releases/download/#{version}/zen.macos-#{arch}.dmg"
  name "zen"
  desc "Firefox based browser with a focus on privacy and customization"
  homepage "https://github.com/zen-browser/desktop/"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+[._-](?:alpha|beta|rc|a)[._-]?\d*)$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  depends_on macos: ">= :catalina"

  app "Zen Browser.app"

  zap trash: [
    "~/Library/Application Support/zen",
    "~/Library/Caches/zen",
    "~/Library/Preferences/org.mozilla.com.zen.browser.plist",
    "~/Library/Saved Application State/org.mozilla.com.zen.browser.savedState",
  ]

  caveats <<~EOS
    The application is not signed.
  EOS
end
