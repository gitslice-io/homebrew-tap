# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.17"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.17/gs_darwin_arm64.tar.gz"
      sha256 "7921d626dc7d524346ca89f8a211d0b9f4f378680eed53d4e2832341e4e5646b"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.17/gs_darwin_amd64.tar.gz"
      sha256 "169ac4138befc54cc34b630cfbf17a26630c0aa56c2302a47fdad619653cb9e5"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.17/gs_linux_arm64.tar.gz"
      sha256 "74e3b2c488a230d5024eb71af134dfd7935cf326233d3abb069b189db254b403"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.17/gs_linux_amd64.tar.gz"
      sha256 "c01434f07c548fee69e484e80f5720a76db23c67ebc0de279ebca555e99bd832"
    end
  end

  conflicts_with "ghostscript", because: "both install a `gs` binary"

  def install
    bin.install "gs"
    generate_completions_from_executable(bin/"gs", "completion")
  end

  test do
    ENV["GS_NO_UPDATE_CHECK"] = "1"
    assert_match "gs version v#{version}", shell_output("#{bin}/gs version")
  end
end
