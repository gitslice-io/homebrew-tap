# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.13"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.13/gs_darwin_arm64.tar.gz"
      sha256 "a714e8b55e877dc44ce35b9afbdb14283b91cc82696c47c33261614d4393be25"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.13/gs_darwin_amd64.tar.gz"
      sha256 "b160ce348b61370163c52c143f2f8e0cfb87418c84f5eac1a29b7ecc57a99b5c"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.13/gs_linux_arm64.tar.gz"
      sha256 "39f857b19be9a08807bf5fc913f64a3c925aef99a412d6edf090bfd3dc04bf9b"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.13/gs_linux_amd64.tar.gz"
      sha256 "bb40934560e1f2d604a93727a79f000dc2653613398018825b5f983e195921ff"
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
