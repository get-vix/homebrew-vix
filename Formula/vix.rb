class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.3.6"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.3.6/vix-darwin-arm64.tar.gz"
      sha256 "aac465baf1d10199bf367c681956ae1d79901e4d1d39015dc1752be547352dee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.3.6/vix-linux-arm64.tar.gz"
      sha256 "3fee16c06d275454f92d3611feaf5dc15f0cd449a295dd6c248f352839df6bc2"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.3.6/vix-linux-amd64.tar.gz"
      sha256 "961acf3677b9438989c700d0424fa5bfb6fa1fb0e7be3256b6accd75fdaf0a30"
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
