# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.19"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.19/gs_darwin_arm64.tar.gz"
      sha256 "817e6537000bef6d96287802f4a40b13fe4d9c82ee4c4752568a41753512e00a"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.19/gs_darwin_amd64.tar.gz"
      sha256 "f5480515695aada00845f1a9e3bfa993090195d11123212d95c20f484f1f4177"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.19/gs_linux_arm64.tar.gz"
      sha256 "b4b0065aa53634722b1cc28e08df7dfa752a1303d43f6118ad49ce84e21e57de"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.19/gs_linux_amd64.tar.gz"
      sha256 "7ce193ee9999c61d02c08a66d37eeb0ecc4f7c721d1f9e857d773e122bc6a2e8"
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
