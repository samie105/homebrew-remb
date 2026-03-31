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
  version "0.3.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/samie105/remb/releases/download/v#{version}/remb-darwin-arm64"
      sha256 "b853ab13f9554f2f6d3237c547f5cacdee1256274c10773233ba771ff8de5804"
    end
    on_intel do
      url "https://github.com/samie105/remb/releases/download/v#{version}/remb-darwin-amd64"
      sha256 "ea32f591c1373f245b5c103491f13b123310887108393708e78911a795769fa8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/samie105/remb/releases/download/v#{version}/remb-linux-arm64"
      sha256 "ebf157315cbd09d0ff72b42e430e815f6fdc58295dc3df32d90faaf751600220"
    end
    on_intel do
      url "https://github.com/samie105/remb/releases/download/v#{version}/remb-linux-amd64"
      sha256 "cc588c60ccdf5623168464a46665b963a8d23effbc9590b9a53829fe50fba839"
    end
  end

  def install
    bin.install Dir["remb*"].first => "remb"
  end

  test do
    assert_match "remb v#{version}", shell_output("#{bin}/remb --version")
  end
end
