# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.21"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.21/gs_darwin_arm64.tar.gz"
      sha256 "e8e7071cfb44feef9a3464c3889f3b6a331bbb188aa4feb1d1042c3c32697fc3"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.21/gs_darwin_amd64.tar.gz"
      sha256 "52de7ec453a122b7c9d9f4b611fe2dd2ff1e700445a9c79729b38fa2911fb1fa"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.21/gs_linux_arm64.tar.gz"
      sha256 "aab86da58586192c3904a8d45b7ba113537675bd2c674536dbd3fa793c693d37"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.21/gs_linux_amd64.tar.gz"
      sha256 "384faf1ebbe10c768dcdfb89829527ff231511a0514f1c3fe75d9b51617ddcae"
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
