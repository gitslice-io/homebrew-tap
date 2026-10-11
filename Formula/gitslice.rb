# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.4/gs_darwin_arm64.tar.gz"
      sha256 "417161e22790f6e3c0f319a3bb4339aa72780db86a48e5cc5e382b854c2ef46c"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.4/gs_darwin_amd64.tar.gz"
      sha256 "90b84ccf6298a6198f99d21a5c9eb92c323a30e7ccbe86e7c71ca0b90be9256b"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.4/gs_linux_arm64.tar.gz"
      sha256 "da0ecb9b7cb6d6b53b4db8da7af5af10c07be58a9c8c88b590ebaee1851770dd"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.4/gs_linux_amd64.tar.gz"
      sha256 "0fc3027f41d259acc22e0785d61348722f7460b33b83f2a877829e30809074fd"
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
