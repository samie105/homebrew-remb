# typed: false
# frozen_string_literal: true

# Homebrew formula for remb
# Tap: brew tap samie105/remb
# Install: brew install remb
#
# To publish this tap:
#   1. Create a repo: github.com/samie105/homebrew-remb
#   2. Add this file as Formula/remb.rb
#   3. Update the sha256 hashes after each release (run: shasum -a 256 <binary>)
class Remb < Formula
  desc "Persistent memory layer for AI coding sessions"
  homepage "https://www.useremb.com"
  version "0.3.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/samie105/remb/releases/download/v#{version}/remb-darwin-arm64"
      sha256 "baed209c16f6eadc86651ae7d05ab071e9cea96596ed0cd3142cdcc4e642608f"
    end
    on_intel do
      url "https://github.com/samie105/remb/releases/download/v#{version}/remb-darwin-amd64"
      sha256 "90883a0f36923a65c9d77e22c945d3d2365b2c058a4d1a82fb46e27af6c6a70c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/samie105/remb/releases/download/v#{version}/remb-linux-arm64"
      sha256 "8cc3299e9d676d4f083b86198337595c21dd42ecd7a2cac2b6de8d7c64979a6e"
    end
    on_intel do
      url "https://github.com/samie105/remb/releases/download/v#{version}/remb-linux-amd64"
      sha256 "702a9b3716fc167da86d0dfee1ed3a7d836e3d2c1fdfc6232dfeaddf9e495f3a"
    end
  end

  def install
    bin.install Dir["remb*"].first => "remb"
  end

  test do
    assert_match "remb v#{version}", shell_output("#{bin}/remb --version")
  end
end
