# Homebrew formula for Matthew-Eucaristo/homebrew-tap (Formula/decruft.rb).
# Builds from the tagged source tarball. Bump `url` and `sha256` per release;
# see RELEASING.md.
class Decruft < Formula
  desc "See and reclaim what a developer's machine accumulates, the official way"
  homepage "https://github.com/Matthew-Eucaristo/decruft"
  url "https://github.com/Matthew-Eucaristo/decruft/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "2fcf250c08d6fe7c59c97578767434aaa455c3f3ee17bb30bff72cdd361cbe74"
  license "MIT"
  head "https://github.com/Matthew-Eucaristo/decruft.git", branch: "main"

  depends_on "go" => :build
  # The family cleaners decruft shows and hands removals back to.
  depends_on "matthew-eucaristo/tap/fell"
  depends_on "matthew-eucaristo/tap/flutterkill"
  depends_on "matthew-eucaristo/tap/nodekill"
  depends_on "matthew-eucaristo/tap/rustkill"

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/decruft --version")
    output = shell_output("#{bin}/decruft --json --no-family")
    assert_match "\"schema_version\": 1", output
  end
end
