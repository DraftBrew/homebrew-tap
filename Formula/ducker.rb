class Ducker < Formula
  desc "Terminal app for managing docker containers, inspired by K9s"
  homepage "https://github.com/robertpsoane/ducker"
  url "https://github.com/robertpsoane/ducker/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "2e368e2ba2b1df5f33c112caef2da5788c06c3b181e0b382f94b1b97478160cd"
  license "MIT"
  head "https://github.com/robertpsoane/ducker.git", branch: "master"

  bottle do
    root_url "https://github.com/draftbrew/homebrew-tap/releases/download/ducker-0.1.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "be8db5ff09501b5483803f283d64bc1c59e76139642b953d2092733106f64cfe"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "ducker #{version}", shell_output("#{bin}/ducker --version")
  end
end
