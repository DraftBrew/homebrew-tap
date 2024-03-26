cask "execs" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.7"
  sha256 arm:   "0a6cb35fc025718881a716838246e631cd55687f950f251709a2c10100c0181b",
         intel: "0169055cf01d5eca887d596237360bbe4518b997d8114f2d41083ff4db65e830"

  url "https://github.com/daeho-ro/execs/releases/download/v#{version}/execs_#{version}_darwin_#{arch}"
  name "execs"
  desc "Execute shell command on the ECS Fargate"
  homepage "https://github.com/daeho-ro/"

  binary "execs_#{version}_darwin_#{arch}", target: "execs"

  # No zap stanza required
end
