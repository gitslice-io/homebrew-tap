# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.18"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.18/gs_darwin_arm64.tar.gz"
      sha256 "d32263f2b2a8138cb0db869a20371a6d1bd5fb2feca72fa5255459edad8a2c11"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.18/gs_darwin_amd64.tar.gz"
      sha256 "ff0ec0e5162785dd1f093037a0258f19338e2934584464201a14516a46e74d87"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.18/gs_linux_arm64.tar.gz"
      sha256 "9bbdd8eedc9a6238c1d809f39de3020137abe21afb01d9f07f04f2f52bcdbc7d"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.18/gs_linux_amd64.tar.gz"
      sha256 "c840042918f71d76327aa326c2441f9587daddc0948deb75f46d3037e127298d"
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
