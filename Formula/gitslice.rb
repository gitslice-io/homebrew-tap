# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.14"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.14/gs_darwin_arm64.tar.gz"
      sha256 "4e7c97bc271a716bf0113562f8d0d83c83b2d648876a31109e3d6f8fa74697fe"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.14/gs_darwin_amd64.tar.gz"
      sha256 "dfd093f431c1a8595b84a65edbec7a50a28c33967ee9a32bb9ddb5cdcf3d1f91"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.14/gs_linux_arm64.tar.gz"
      sha256 "ada3dacd49dcf97e2f9745852e7f973689f612e439ade3484066c6bf157f1dd6"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.14/gs_linux_amd64.tar.gz"
      sha256 "8a477bd193add86259ac533d4a62cd3cfebf5704e4ac3369610e314fdcffdc2c"
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
