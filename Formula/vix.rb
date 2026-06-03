class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.3.5"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.3.5/vix-darwin-arm64.tar.gz"
      sha256 "f8c9ff6b1ff1585705aa48317f05e9a03ce696b5c665c5c6e40b0a68d094e709"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.3.5/vix-linux-arm64.tar.gz"
      sha256 "b0fc656b92313db603814670b78ca4d99c3e1ab992c4e951a18fba7071ea1a4b"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.3.5/vix-linux-amd64.tar.gz"
      sha256 "8fbfbbfddceff97a0c2b27af06905652d45f27369f5eb7ce81598ba26a2d2938"
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
