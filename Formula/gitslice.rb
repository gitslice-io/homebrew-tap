# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.20"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.20/gs_darwin_arm64.tar.gz"
      sha256 "90fdb8a1e1b1565f453ccec155eb32236d1785666e8e0c00d70e536292aae71f"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.20/gs_darwin_amd64.tar.gz"
      sha256 "462bd66df23674b4e601ff2beb787f643e8bbe58762a4b010949d812bab1acce"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.20/gs_linux_arm64.tar.gz"
      sha256 "98518e414e05d1861d7706bbda060ef8c8c69a49c979fa97a10bf21601e9cee3"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.20/gs_linux_amd64.tar.gz"
      sha256 "c07b100cfabffd6baf5dd5d24a53cd81075ea0fb77e7c3c9bc777fb77fe767be"
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
