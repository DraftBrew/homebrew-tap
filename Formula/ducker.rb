class Ducker < Formula
  desc "Slightly quackers Docker TUI based on k9s"
  homepage "https://github.com/robertpsoane/ducker"
  url "https://github.com/robertpsoane/ducker/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "54b23d515e219d14b6f7f02c47889ba2696084594db30637f13afcfe89eb5824"
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
