class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.3.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.3.1/vix-darwin-arm64.tar.gz"
      sha256 "a5a2ff4b3a8574dff7315af24a61025bd755aba991c310b298cbd4a19a3fefbf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.3.1/vix-linux-arm64.tar.gz"
      sha256 "e703ae2b7edff0da43a87521d73b56ec391b162c69f320204a081efedca9b94f"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.3.1/vix-linux-amd64.tar.gz"
      sha256 "06537b131f46b33e1e31635ec3b1674ac2cb0a2fc51e94be32d5748bedfff405"
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
