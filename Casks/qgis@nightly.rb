cask "qgis@nightly" do
  version "3.99.0"
  sha256 :no_check

  url "https://nightly.link/opengisch/qgis-notarize/workflows/notarize/main/QGIS-master.zip",
      verified: "nightly.link/opengisch/qgis-notarize/"
  name "QGIS Nightly"
  desc "Geographic Information System"
  homepage "https://www.qgis.org/"

  livecheck do
    url :url
    strategy :extract_plist do |items|
      items["org.qgis.qgis3"]&.short_version
    end
  end

  depends_on macos: ">= :big_sur"

  rename "QGIS-master-*.app", "QGIS-nightly.app"

  app "QGIS-nightly.app"

  zap trash: [
    "~/Library/Application Support/QGIS",
    "~/Library/Caches/QGIS",
  ]
end
