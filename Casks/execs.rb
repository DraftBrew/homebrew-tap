cask "execs" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.4"
  sha256 arm:   "8eb445d8bb260131a638ab859a07f8664e2add8b48f90edebf8abbba2706af2f",
         intel: "134daa2a524ce5d0350f24d2c82aae6a6d21cd36330c258dc9aa494e5b5b8234"

  url "https://github.com/daeho-ro/execs/releases/download/v#{version}/execs_#{version}_darwin_#{arch}"
  name "execs"
  desc "Execute shell command on the ECS Fargate"
  homepage "https://github.com/daeho-ro/"

  binary "execs_#{version}_darwin_#{arch}", target: "execs"

  # No zap stanza required
end
