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
      sha256 "c734c6ad91ced16f96137ef1a35f7a2a0d0297c5f0379fa6df021af83bed3457"
    end
    on_intel do
      url "https://github.com/samie105/remb/releases/download/v#{version}/remb-darwin-amd64"
      sha256 "3cb943d6fc8954ada194bd3db7ed5a3dc29f0b2af0fa7d931b6beb1c0e3ff4e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/samie105/remb/releases/download/v#{version}/remb-linux-arm64"
      sha256 "e607bfc76a24fd601da1655c4c2a166b91a5d96e6d4210cc3182895810b0e8ea"
    end
    on_intel do
      url "https://github.com/samie105/remb/releases/download/v#{version}/remb-linux-amd64"
      sha256 "8340ba59110b2d9c0ca71ddf3b63ffdada6ad4018588944d0ced046129966cba"
    end
  end

  def install
    bin.install Dir["remb*"].first => "remb"
  end

  test do
    assert_match "remb v#{version}", shell_output("#{bin}/remb --version")
  end
end
