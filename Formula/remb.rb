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
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/samie105/remb/releases/download/v#{version}/remb-darwin-arm64"
      sha256 "5383273e2a67d526d5d459ca2b7945b95fe2e70890b3c95b58692dc4c8e9aa0a"
    end
    on_intel do
      url "https://github.com/samie105/remb/releases/download/v#{version}/remb-darwin-amd64"
      sha256 "c4c5eec037432a8f2e9c56f28b48fbc474f740a44161dc183c3fd66d62237aac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/samie105/remb/releases/download/v#{version}/remb-linux-arm64"
      sha256 "4f608be8b24732f5f6b8621ef1fcd1c8a6d50f6397b8b272f1965c648c000faf"
    end
    on_intel do
      url "https://github.com/samie105/remb/releases/download/v#{version}/remb-linux-amd64"
      sha256 "ba73a5bd6e6e735b9f8f43df1b86aa331b95e8774a6d4496d5bb7d76c88ba9f2"
    end
  end

  def install
    bin.install Dir["remb*"].first => "remb"
  end

  test do
    assert_match "remb v#{version}", shell_output("#{bin}/remb --version")
  end
end
