class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.4.4"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.4.4/vix-darwin-arm64.tar.gz"
      sha256 "155cb6508092c9cda58aca884952f404708e9609cbb4cb5992d40faf323ba75f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.4.4/vix-linux-arm64.tar.gz"
      sha256 "f375b45550c63e7a7e3d9778df7034f8933a9b6ba7fd33bde5e76345556e8957"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.4.4/vix-linux-amd64.tar.gz"
      sha256 "7d376c98955fbb5f627e0cff7cfe96c319f0f4347439e0436c0316f5aac6de91"
    end
  end

  def install
    bin.install "vix"
    bin.install "vixd"
  end

  service do
    run [opt_bin/"vixd"]
    keep_alive true
    log_path var/"log/vixd.log"
    error_log_path var/"log/vixd.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vix --version 2>&1", 1)
  end
end
