class Ducker < Formula
  desc "Terminal app for managing docker containers, inspired by K9s"
  homepage "https://github.com/robertpsoane/ducker"
  url "https://github.com/robertpsoane/ducker/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "57dc95d59820f79579086b1f28bd03575157568e5dbd8a4d5e3f39cfcbf716ad"
  license "MIT"
  head "https://github.com/robertpsoane/ducker.git", branch: "master"

  bottle do
    root_url "https://github.com/draftbrew/homebrew-tap/releases/download/ducker-0.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "be85bed467cdac03ecf7feda8752d822d8a16c0245d4fcbb97ca558d941f1062"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "ducker #{version}", shell_output("#{bin}/ducker --version")
  end
end
