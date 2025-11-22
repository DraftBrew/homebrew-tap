class NcloudCli < Formula
  desc "Command-line interface for Naver Cloud Platform"
  homepage "https://cli.ncloud-docs.com/docs/guide"
  url "https://www.ncloud.com/api/support/download/files/cli/CLI_1.1.27_20251120.zip"
  version "1.1.27-20251120"
  sha256 "87043a13e081c0f63d47a2aba6d351985b6497cced637bca09ff35041212638f"
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
