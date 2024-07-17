cask "notepadnext" do
  version "0.8"
  sha256 "544c64b6f04c6efb33ef3b7d375ca39fcfafa10dd65c9439e13af6d16181d590"

  url "https://github.com/dail8859/NotepadNext/releases/download/v#{version}/NotepadNext-v#{version}.dmg"
  name "notepad-next"
  desc "Cross-platform, reimplementation of Notepad++"
  homepage "https://github.com/dail8859/NotepadNext"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Notepadnext.app"
  binary "#{appdir}/Notepadnext.app/Contents/MacOS/NotepadNext"

  # No zap stanza required
end
