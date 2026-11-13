# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.24"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.24/gs_darwin_arm64.tar.gz"
      sha256 "7e429b0edba23437e2922a6e2c5f52cb640cee198de65cb49084c131496a17b6"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.24/gs_darwin_amd64.tar.gz"
      sha256 "c77976230abe78f726c1842115296663d4c29bbd27658303f62ab1a43e2a4bee"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.24/gs_linux_arm64.tar.gz"
      sha256 "1614c083de6b91bd10848f5f869e1ba261d8950dd9a1dc80c63acb39c062aa08"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.24/gs_linux_amd64.tar.gz"
      sha256 "bcb6ccdefedc898aba365b420885bfe5ec4bb0869fc81d9b214ee882ce81c915"
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
