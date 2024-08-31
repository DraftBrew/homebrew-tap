cask "zen@alpha" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.0-a.33"
  sha256 arm: "1b88d9d3f43a4c1b728ac12c8fc14af57f18aab44b588b12153b41520a23ee9b",
         intel: "0ef0f0a337272e0d2aa225a8e67e7de5ae50666d740095e0a68c56db66fbec8c"

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
