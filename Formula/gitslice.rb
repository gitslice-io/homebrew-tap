# Written by bin/update-formula from the release's checksums.txt: change that
# script, not this file.
class Gitslice < Formula
  desc "Native source graph CLI with Git-compatible slices and changesets"
  homepage "https://gitslice.io"
  version "0.4.25"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.25/gs_darwin_arm64.tar.gz"
      sha256 "992ccdb9ca32bcc283fae24fadf9845256a047fd2e41642c7e601db5ee88e152"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.25/gs_darwin_amd64.tar.gz"
      sha256 "454239a67c02eaac77d4d2beb9bb4b2ac1611c7b9c87552373edfe65c75ade51"
    end
  end

  on_linux do
    on_arm do
      url "https://gitslice.io/releases/download/v0.4.25/gs_linux_arm64.tar.gz"
      sha256 "e62a6bbe94990527838b9ec9e63c51b76b25fc8f5c256f626b7b1c6ad906a25e"
    end
    on_intel do
      url "https://gitslice.io/releases/download/v0.4.25/gs_linux_amd64.tar.gz"
      sha256 "de7ec4e25d670243d7d4f1b61921b70b9821c71ba905038958e74f1585680376"
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
