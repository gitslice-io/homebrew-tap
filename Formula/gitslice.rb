# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.5/gs_darwin_arm64.tar.gz"
      sha256 "77c6f80e33fdcd69c1f4d766fa0584624b1bcb32e2dfde43d155594b084e559d"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.5/gs_darwin_amd64.tar.gz"
      sha256 "2b190535a66d97c633a937f426d393a655b5181c4c9ec452e7edcd84a7b4cfb8"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.5/gs_linux_arm64.tar.gz"
      sha256 "3d2f2c6c0b6f9dfdbe491073e04008b57049f404dc330069fe0d044ab80c263c"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.5/gs_linux_amd64.tar.gz"
      sha256 "990f3e2affdd5082d932a806d88b73e03647ef966067353c86a791ad43b25e40"
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
