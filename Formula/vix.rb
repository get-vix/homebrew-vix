class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.16"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.16/vix-darwin-arm64.tar.gz"
      sha256 "b277ad2b56fe4d520c73a4763f20a63f496c88fc47fffc8e7115e774b6ee5b00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.16/vix-linux-arm64.tar.gz"
      sha256 "f1148df5e9e3494ae7c8188b56fddd577199b20cb6e7bb485d6f7430f2751b6e"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.16/vix-linux-amd64.tar.gz"
      sha256 "7d63d131389fc6201e1cea4d7932b8e3edc0aa9c0e87df1b6e07d25a69524f36"
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
