cask "execs" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.9"
  sha256 arm:   "fb27ac36d0320c4581192b40fad0f7948efc9c09dbd72234384ca74c312490d6",
         intel: "81dbf19e5c2a9822b23be40a59a04f9733b309f8d8ff91adf0d4a65880297dce"

  url "https://github.com/daeho-ro/execs/releases/download/v#{version}/execs_#{version}_darwin_#{arch}"
  name "execs"
  desc "Execute shell command on the ECS Fargate"
  homepage "https://github.com/daeho-ro/"

  binary "execs_#{version}_darwin_#{arch}", target: "execs"

  # No zap stanza required
end
