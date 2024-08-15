class Ducker < Formula
  desc "Terminal app for managing docker containers, inspired by K9s"
  homepage "https://github.com/robertpsoane/ducker"
  url "https://github.com/robertpsoane/ducker/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "cce79c829be9dfd2015016281e9468dfcd903c2edb46d12fe39ad08db72abf3a"
  license "MIT"
  head "https://github.com/robertpsoane/ducker.git", branch: "master"

  bottle do
    root_url "https://github.com/draftbrew/homebrew-tap/releases/download/ducker-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "3ec0feb46e0b9a0fbf87aa5c45c2bf95d7d2b3f613cfca776f69e90e5b5fa692"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "ducker #{version}", shell_output("#{bin}/ducker --version")
  end
end
