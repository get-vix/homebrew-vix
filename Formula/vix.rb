class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix"
  version "0.3.4"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix/releases/download/v0.3.4/vix-darwin-arm64.tar.gz"
      sha256 "eb164accfcc7ce58165d97eadba61eca29f6746f166cc5e725c46777f28d3154"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix/releases/download/v0.3.4/vix-linux-arm64.tar.gz"
      sha256 "ce7a2050d19a0e4343c1dadbdc68d7e8452b8842f71417ad554d76260e81d8e4"
    end
    on_intel do
      url "https://github.com/kirby88/vix/releases/download/v0.3.4/vix-linux-amd64.tar.gz"
      sha256 "efd164796e094c8a39c0da5159f989c90c3bcbf7382a2c5128955beaafe8e92c"
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
