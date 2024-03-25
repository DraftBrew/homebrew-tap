cask "execs" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.6"
  sha256 arm:   "621e627dbbfd8f752fdbb1eeeeb94cb15001ccd2ad9bdbdb40ce9fbd7642961c",
         intel: "dba882bbed84f7017dd05392dc31996a869344525a4ed27e5ab68274c23c26ba"

  url "https://github.com/daeho-ro/execs/releases/download/v#{version}/execs_#{version}_darwin_#{arch}"
  name "execs"
  desc "Execute shell command on the ECS Fargate"
  homepage "https://github.com/daeho-ro/"

  binary "execs_#{version}_darwin_#{arch}", target: "execs"

  # No zap stanza required
end
