# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.16"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.16/gs_darwin_arm64.tar.gz"
      sha256 "1653de8bca0566e6dd778dba1021fc83b7a81f02bffa8d943bc4d0d09c7e4a97"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.16/gs_darwin_amd64.tar.gz"
      sha256 "6c88f3bbd37625e99f84055cb8752f9e17a27c2bc331d1f211ede5bfd0f902ed"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.16/gs_linux_arm64.tar.gz"
      sha256 "7e0d1476eba579d624645e720c6e12cc57860cca1a55bf23a51d9c4796094898"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.16/gs_linux_amd64.tar.gz"
      sha256 "501209b00b5b0f2e68df168974686b55dfeb414b4403c83cb403c325c3dd6615"
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
