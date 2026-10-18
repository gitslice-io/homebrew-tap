# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.11"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.11/gs_darwin_arm64.tar.gz"
      sha256 "f138c1948f3b181741222e04465be1aff03a9c8b8221cfca6a722e0aac130063"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.11/gs_darwin_amd64.tar.gz"
      sha256 "34892506f26a19e64d3bf33d9c76c61cf3498000271dd713443b005a609cd863"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.11/gs_linux_arm64.tar.gz"
      sha256 "fd1c5570b71ab2062e370c8adbadbfcf104cb43fffffa3df8771e57e03d1186c"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.11/gs_linux_amd64.tar.gz"
      sha256 "2c1acc765ee0b52b43d29c1e30110be7046877a16743ad6d84fab2d8f4cd44b6"
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
