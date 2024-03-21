cask "execs" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.5"
  sha256 arm:   "b6dbd0b822deedd2513a7065b8b507d8b6bcc870f12432bf7194fe57ea621082",
         intel: "8dd2aec923d35bd6ab65180942689d533ec539b8636db25f10d097d7e25c2778"

  url "https://github.com/daeho-ro/execs/releases/download/v#{version}/execs_#{version}_darwin_#{arch}"
  name "execs"
  desc "Execute shell command on the ECS Fargate"
  homepage "https://github.com/daeho-ro/"

  binary "execs_#{version}_darwin_#{arch}", target: "execs"

  # No zap stanza required
end
