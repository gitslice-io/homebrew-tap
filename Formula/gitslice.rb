# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.26"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.26/gs_darwin_arm64.tar.gz"
      sha256 "adb7ed5ee40de807e458bb5a55e0745240c85f1e913595740ad0dbdf9d9c6a01"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.26/gs_darwin_amd64.tar.gz"
      sha256 "c5ae92171ecf8126147a4ec79f79c785c1c261089c449a0eb3007a3d88ed9b3a"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.26/gs_linux_arm64.tar.gz"
      sha256 "f178d3f6f62ff89d6c0d9c2c56140cd0c5eaeb463d31b33f151e04f49df1aced"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.26/gs_linux_amd64.tar.gz"
      sha256 "47a5dea1fce5f471eb6d2f81618529a49c0078eedcde1a86753d54f74493d001"
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
