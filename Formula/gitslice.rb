# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.6/gs_darwin_arm64.tar.gz"
      sha256 "3f515cd335cf4a17effbb66c789b035197cf0479c30459b0f0d10ba49c147d6c"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.6/gs_darwin_amd64.tar.gz"
      sha256 "25d9d339bbad53c366f423ea06539ea313836d80572ac6be4de72399a6d7da3c"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.6/gs_linux_arm64.tar.gz"
      sha256 "ca414ffb7cf81fa6af1801936bb1a82ff6012a6c127859442bd52deb5faba943"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.6/gs_linux_amd64.tar.gz"
      sha256 "e124237171ce3f1be671431e15d86fb45e455e0ac13a0594be4f8901be3481c3"
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
