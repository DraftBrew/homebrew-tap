cask "execs" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.8"
  sha256 arm:   "5628091f679a1d3e139428cf2c67e3f600dd84edc7f3c79f5e5f48b981872303",
         intel: "72b328bbc4a6184fe5e483fde4952801e6cbcf6daaba2c3a8e49c513a3bdffcc"

  url "https://github.com/daeho-ro/execs/releases/download/v#{version}/execs_#{version}_darwin_#{arch}"
  name "execs"
  desc "Execute shell command on the ECS Fargate"
  homepage "https://github.com/daeho-ro/"

  binary "execs_#{version}_darwin_#{arch}", target: "execs"

  # No zap stanza required
end
