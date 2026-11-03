# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.23"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.23/gs_darwin_arm64.tar.gz"
      sha256 "56db89e8aaee9a8f2f66b50ab03d2ec6c1da133f86781f79bf56abdd104c2c79"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.23/gs_darwin_amd64.tar.gz"
      sha256 "9eba8cd6d44c5b903c4235e081a749ebba32b41d19fbcc86d86d9cb7d800474b"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.23/gs_linux_arm64.tar.gz"
      sha256 "9316d1aee6ee6b73b98f1b14d8ec3c7168744cdbc5a8e44c22c04af376a2bd3c"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.23/gs_linux_amd64.tar.gz"
      sha256 "0e52a171e4eee1ce0c6e84edc8355212f78331b104cb28d08abe7d6247f07e5b"
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
