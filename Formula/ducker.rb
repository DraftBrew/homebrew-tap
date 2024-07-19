class Ducker < Formula
  desc "Terminal app for managing docker containers, inspired by K9s"
  homepage "https://github.com/robertpsoane/ducker"
  url "https://github.com/robertpsoane/ducker/archive/refs/tags/v0.0.7.tar.gz"
  sha256 "6eeea69435bb40835500b127a3b8795bff423ffa44a112e054d208544c984fde"
  license "MIT"
  head "https://github.com/robertpsoane/ducker.git", branch: "master"

  bottle do
    root_url "https://github.com/draftbrew/homebrew-tap/releases/download/ducker-0.0.7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c11429b7344fdfb9cf1c7953253be8be2b126f452b53e010723f259fd42455df"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "ducker #{version}", shell_output("#{bin}/ducker --version")
  end
end
