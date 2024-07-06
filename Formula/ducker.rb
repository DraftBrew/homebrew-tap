class Ducker < Formula
  desc "Slightly quackers Docker TUI based on k9s"
  homepage "https://github.com/robertpsoane/ducker"
  url "https://github.com/robertpsoane/ducker/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "599c2e94c0d162e7f3508beaf064e6bd1a35b233409c6b74a4c71a8c9ba99dd6"
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
