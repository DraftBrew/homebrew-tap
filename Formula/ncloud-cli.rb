class NcloudCli < Formula
  desc "Command-line interface for Naver Cloud Platform"
  homepage "https://cli.ncloud-docs.com/docs/guide"
  url "https://www.ncloud.com/api/support/download/files/cli/CLI_1.1.25_20250717.zip"
  version "1.1.25"
  sha256 "be98ac0d20382c3563c02c9776dea16d6c4c1bbb4f8f3927359602d5c4f033ba"
  license "GPL-3.0-or-later"

  livecheck do
    url "https://cli.ncloud-docs.com/docs/guide-clichange"
    regex(/CLI[._-]v?(\d+(?:\.\d+)+)[._-]\d+.zip/i)
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
