cask "wireguard-statusbar" do
  version "1.26,122"
  sha256 "d0c14cb58579b400f775f33b0d1705d797deb1b9655e2ba93f36fd2458b1214d"

  url "https://github.com/aequitas/macos-menubar-wireguard/releases/download/#{version.csv.first}/WireGuardStatusbar-#{version.csv.first}-#{version.csv.second}.dmg"
  name "WireGuardStatusbar"
  desc "Menubar icon for WireGuard/wg-quick"
  homepage "https://github.com/aequitas/macos-menubar-wireguard"

  livecheck do
    url :url
    regex(/WireGuardStatusbar[._-]v?(\d+(?:\.\d+)+)[._-](\d+)\.dmg/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"] || release["prerelease"]

        release["assets"]&.map do |asset|
          match = asset["name"]&.match(regex)
          next if match.blank?

          "#{match[1]},#{match[2]}"
        end
      end.flatten
    end
  end

  depends_on formula: "wireguard-tools"

  app "WireGuardStatusbar.app"

  zap trash: [
    "/Library/LaunchDaemons/WireGuardStatusbarHelper.plist",
    "/Library/PrivilegedHelperTools/WireGuardStatusbarHelper",
    "~/Library/Preferences/WireGuardStatusbar.plist",
  ]

  caveats <<~EOS
    The application is not signed.
  EOS
end
