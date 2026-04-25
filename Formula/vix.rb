class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.21"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.21/vix-darwin-arm64.tar.gz"
      sha256 "bcf83027179a1bb8f1bb7782387e992dbac62a999b9547b07f22ebe52b3ecd2b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.21/vix-linux-arm64.tar.gz"
      sha256 "1ca4c67bd28e5f57797a19105580653e823adf1c84048ce26d4dacb425345394"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.21/vix-linux-amd64.tar.gz"
      sha256 "0caf8a62eecc1c621319f8dccd00cd3468203c591247bb4a7380096b9cbdd5b6"
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
