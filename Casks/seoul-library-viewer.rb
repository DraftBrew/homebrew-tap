cask "seoul-library-viewer" do
  version "3.0.12"
  sha256 :no_check

  url "https://elib.seoul.go.kr/Resources/viewer/SEOUL_Viewer_MAC.dmg"
  name "Seoul Library Viewer"
  desc "Viewer for Seoul Library resources"
  homepage "https://elib.seoul.go.kr/"

  livecheck do
    url :url
    strategy :extract_plist
  end

  depends_on macos: ">= :monterey"

  app "서울도서관 전자책 뷰어.app"

  zap trash: [
    "~/Library/Application Scripts/kr.co.eco.ebookviewer3.seoul.mac",
    "~/Library/Containers/kr.co.eco.ebookviewer3.seoul.mac",
  ]
end
