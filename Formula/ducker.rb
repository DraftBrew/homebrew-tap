class Ducker < Formula
  desc "Slightly quackers Docker TUI based on k9s"
  homepage "https://github.com/robertpsoane/ducker"
  url "https://github.com/robertpsoane/ducker/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "4e90fca874d295a4c52e2e9c434a36de809ceedcbef4db428858092393f7eb07"
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
