cask "qstudio" do
  version "5.01"
  sha256 "86d0dd9bba334972957633db40ad83fab6702556fa87f806ba0d28ad3296ae62"

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
