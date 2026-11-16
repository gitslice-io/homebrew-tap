# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.27"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.27/gs_darwin_arm64.tar.gz"
      sha256 "c0c0da02f3859cfb894dcea794754ba4cc262d2a4b35849d51ca24371db7cf65"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.27/gs_darwin_amd64.tar.gz"
      sha256 "f5ece766a164c2bb6446238eed23b066ea7ade2c29ba3031827af62170c516c9"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.27/gs_linux_arm64.tar.gz"
      sha256 "a553276c94ca73a4c95e993a4ae898c232ba44d3d04861252e5f27ffbfa20009"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.27/gs_linux_amd64.tar.gz"
      sha256 "d456c8be005f8818acda967e470eb868a0df3928362acf3388914d34bb40eaff"
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
