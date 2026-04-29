class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.22"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.22/vix-darwin-arm64.tar.gz"
      sha256 "8a346d1d0c232682e5bea62f492c58f5c0ffcb4979a883ceefe58950d5e6b59b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.22/vix-linux-arm64.tar.gz"
      sha256 "5cc65f4375eda5cdc034e4b2acbcb92e973fc898b4552f7aa060b27265e819e4"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.22/vix-linux-amd64.tar.gz"
      sha256 "7772db07720a389dc9868e3fd1534c2412168b1678f5fdf91c808aa56d18bebf"
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
