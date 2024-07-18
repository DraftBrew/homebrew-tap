class Ducker < Formula
  desc "Slightly quackers Docker TUI based on k9s"
  homepage "https://github.com/robertpsoane/ducker"
  url "https://github.com/robertpsoane/ducker/archive/refs/tags/v0.0.7.tar.gz"
  sha256 "6eeea69435bb40835500b127a3b8795bff423ffa44a112e054d208544c984fde"
  license "MIT"
  head "https://github.com/robertpsoane/ducker.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "ducker #{version}", shell_output("#{bin}/ducker --version")
  end
end
