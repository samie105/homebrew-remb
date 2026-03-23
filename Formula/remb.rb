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
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/samie105/remb/releases/download/v#{version}/remb-darwin-arm64"
      sha256 "53be0cd39e599740838cfc01b3ead2835716f3d12df1203a949e6c2a8c780e20"
    end
    on_intel do
      url "https://github.com/samie105/remb/releases/download/v#{version}/remb-darwin-amd64"
      sha256 "082ea394d90c8ae345d8c6c8e211f9a0347342ed3fe1aaca308d81b818600acf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/samie105/remb/releases/download/v#{version}/remb-linux-arm64"
      sha256 "1cd780fd435e6d5d57ab4f23c65346a2545a86ed827429e404a4eef95dd5ed4a"
    end
    on_intel do
      url "https://github.com/samie105/remb/releases/download/v#{version}/remb-linux-amd64"
      sha256 "2dd7b32cef845ebd483961ef964fb055faebd00c6d96e1cc6acbf0f1486041b1"
    end
  end

  def install
    bin.install Dir["remb*"].first => "remb"
  end

  test do
    assert_match "remb v#{version}", shell_output("#{bin}/remb --version")
  end
end
