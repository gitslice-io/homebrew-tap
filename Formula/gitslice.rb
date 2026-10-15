# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.7/gs_darwin_arm64.tar.gz"
      sha256 "60f3d6b5ff13255cbee87f31713d8c5838cfcfd0ad246bffd80b705339183573"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.7/gs_darwin_amd64.tar.gz"
      sha256 "4d1017d695f0888a449139222f88fdecd74a2ec106ea80193b55b4160bf96d1b"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.7/gs_linux_arm64.tar.gz"
      sha256 "9968342500b880f4d100b8ccd4c0f4508639010ebd377a1b6e43b58579a77346"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.7/gs_linux_amd64.tar.gz"
      sha256 "3d18db91a2b64fdad6c29c8d2bddfb9377dc05e037bc0ac7f51eb14612a6db91"
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
