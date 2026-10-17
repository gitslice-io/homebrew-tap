# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.8/gs_darwin_arm64.tar.gz"
      sha256 "204ceda46e75a83d6bf72b49d193699b0eeb652bad35c2388755ed959e4549e7"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.8/gs_darwin_amd64.tar.gz"
      sha256 "52ea0609cd43a1637cc2a66ea5f02204ae8daf169bbedeb3996cf09e6cb1c698"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.8/gs_linux_arm64.tar.gz"
      sha256 "474606eabe6cf616730db21984dc97dcd60fd295a3c586dfc0d36c570b2cb85e"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.8/gs_linux_amd64.tar.gz"
      sha256 "c2c5c738b1f9315755cb9c24cb090d21280b8e9e6d4a5642825de322128d27da"
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
