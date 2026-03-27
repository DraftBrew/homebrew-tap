class NcloudCli < Formula
  desc "Command-line interface for Naver Cloud Platform"
  homepage "https://cli.ncloud-docs.com/docs/guide"
  url "https://www.ncloud.com/api/support/download/files/cli/CLI_1.1.28_20260122.zip"
  version "1.1.28-20260122"
  sha256 "847836db4460c043be9c9b00c4bc76f2aac7a30fb8853f4646c078147b672638"
  license :cannot_represent

  livecheck do
    url "https://cli.ncloud-docs.com/docs/guide-clichange"
    regex(/CLI[._-]v?(\d+(?:\.\d+)+)[._-](\d{8}).zip/i)
    strategy :page_match do |page, regex|
      page.scan(regex).map { |match| "#{match[0]}-#{match[1]}" }
    end
  end

  depends_on "openjdk"

  def install
    jar_name = "ncloud-api-cli-#{version}-SNAPSHOT-jar-with-dependencies.jar"
    libexec.install "cli_linux/lib/#{jar_name}"
    bin.write_jar_script libexec/jar_name, "ncloud"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ncloud --version")
    assert_match "credentials are not set yet.", shell_output("#{bin}/ncloud vpc", 1)
  end
end
