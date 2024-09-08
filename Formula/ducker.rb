class Ducker < Formula
  desc "Terminal app for managing docker containers, inspired by K9s"
  homepage "https://github.com/robertpsoane/ducker"
  url "https://github.com/robertpsoane/ducker/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "26f9ac5e96fe0bbed3ac61640046cc2cac242f86081bf9ae9d4e195877bd7704"
  license "MIT"
  head "https://github.com/robertpsoane/ducker.git", branch: "master"

  bottle do
    root_url "https://github.com/draftbrew/homebrew-tap/releases/download/ducker-0.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "15ed42b1f246dbf3d37f2295851cf1618aa51d1b2591df1a5c7af9e147d1e80f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "ducker #{version}", shell_output("#{bin}/ducker --version")
  end
end
