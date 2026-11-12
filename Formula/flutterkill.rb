# Homebrew formula for Matthew-Eucaristo/homebrew-tap (Formula/flutterkill.rb).
# Builds from the tagged source tarball. Bump `url` and `sha256` per release;
# see RELEASING.md.
class Flutterkill < Formula
  desc "Reclaim disk space from Flutter/Dart build artifacts and caches"
  homepage "https://github.com/Matthew-Eucaristo/flutterkill"
  url "https://github.com/Matthew-Eucaristo/flutterkill/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "9e543f50f625a69470f8da07b78fea1e6734584c3f85604eb902d47d20591dd9"
  license "MIT"
  head "https://github.com/Matthew-Eucaristo/flutterkill.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/flutterkill --version")
    assert_match "\"schema_version\": 1", shell_output("#{bin}/flutterkill capabilities --json")

    (testpath/"dev/app/pubspec.yaml").write "name: demo_app\n"
    (testpath/"dev/app/build/blob").write "x"
    output = shell_output("#{bin}/flutterkill scan --json --no-global #{testpath}/dev")
    assert_match "\"name\": \"demo_app\"", output
    assert_match "\"kind\": \"build\"", output
    assert_path_exists testpath/"dev/app/build/blob" # scan never changes anything
  end
end
