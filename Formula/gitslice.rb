# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.15"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.15/gs_darwin_arm64.tar.gz"
      sha256 "ef4cb7f4f0d53f77192580c53011bb590af8d896151886f4959280a3a688f536"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.15/gs_darwin_amd64.tar.gz"
      sha256 "ef19c2387bf03e8601b0434ffa836d679e9b56a397c08f78f87a060f7dabd769"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.15/gs_linux_arm64.tar.gz"
      sha256 "7b10698636e69f2c922cd64f02a4ff46130700b8d91075b9463372f5a5653ae2"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.15/gs_linux_amd64.tar.gz"
      sha256 "68380db51fc5d2e832abd0e23b989ebe5cda325a8dac1631fe1752d3f6418919"
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
