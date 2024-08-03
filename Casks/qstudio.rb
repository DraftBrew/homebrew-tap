cask "qstudio" do
  version "3.06"
  sha256 "49dda3a00e68c545becf073bcc6a18a5f0cd315feb58465c48d24a00b6b726ae"

  url "https://github.com/timeseries/qstudio/releases/download/#{version}/qstudio.jar",
      verified: "github.com/timeseries/qstudio/"
  name "qstudio"
  desc "Free SQL Analysis Tool"
  homepage "https://www.timestored.com/qstudio/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # shim script (https://github.com/Homebrew/homebrew-cask/issues/18809)
  shimscript = "#{staged_path}/qstudio.wrapper.sh"
  binary shimscript, target: "qstudio"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      cd "$(dirname "$(readlink -n "${0}")")" && \
        java -jar 'qstudio.jar' "$@"
    EOS
  end

  zap trash: [
    "~/Library/Preferences/com.timestored.qstudio.plist",
    "~/qStudio",
  ]

  caveats do
    depends_on_java "8+"
  end
end
