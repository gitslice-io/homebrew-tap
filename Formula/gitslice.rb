# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.9/gs_darwin_arm64.tar.gz"
      sha256 "2827a7e121244d071824fbf5925d134aecfb21448792ba6c75afa02325f02a5a"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.9/gs_darwin_amd64.tar.gz"
      sha256 "662cb2ad025fcc70e5697a316789be2164d64eaff310de1205f3fbf425cf9e7f"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.9/gs_linux_arm64.tar.gz"
      sha256 "b3453135a0519052ca5e34e3d4bf3c70e542bc13a8a4460a79883534bb053210"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.9/gs_linux_amd64.tar.gz"
      sha256 "1a158757c8b962eca12885b9e6fc001a027290585b9bd67466da715613edc9c9"
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
