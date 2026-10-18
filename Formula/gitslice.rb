# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.10/gs_darwin_arm64.tar.gz"
      sha256 "d9dada0e4dfee895bee720a033e2a71e5a62995769fe5f3c3fd4c4d86b4b8a5c"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.10/gs_darwin_amd64.tar.gz"
      sha256 "26281a3a699fb7ed39dcdfadff173023bb27e56376782124e35e106de34a4f01"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.10/gs_linux_arm64.tar.gz"
      sha256 "9588a039f9acdba111523ddda9aa8c1b31dfabdda5d8f8d9c918f3bd779e3bf9"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.10/gs_linux_amd64.tar.gz"
      sha256 "559802bc0d634a7d82bd099ffb86c11a7eff57be0a4e69b7a6d9af6ee86a8600"
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
