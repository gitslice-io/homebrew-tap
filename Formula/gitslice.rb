# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.12"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.12/gs_darwin_arm64.tar.gz"
      sha256 "faf1183d62f363a785d3d43fa49fd24e9a361e3610e8af70eef26b3d90cdc7cf"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.12/gs_darwin_amd64.tar.gz"
      sha256 "465f1068acae86a625a5ba7874eda76a9f7de7448c9786d6eb408aaeae1b09b6"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.12/gs_linux_arm64.tar.gz"
      sha256 "0541867d83cd1ba90311d130a086504561dcc35821a58018213f941821c29e74"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.12/gs_linux_amd64.tar.gz"
      sha256 "b4824c8644037daba5ba0c0c9f1c232177c4938b66cf1bab4ab43d78be366f5e"
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
