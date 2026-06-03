class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.3.6"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.3.6/vix-darwin-arm64.tar.gz"
      sha256 "da21d93aa30053f052532e00ccbbeed3a61a5a64ef754ad4bcd7eb118f6aa361"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.3.6/vix-linux-arm64.tar.gz"
      sha256 "7d03851ab3272d2975a0adb58b08e4b519131a6b8dda205c86ffbf18e8199eca"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.3.6/vix-linux-amd64.tar.gz"
      sha256 "40f83f1e06e3ee174e7210e85b0b2fadae0f2483ee39e62f2a5f8a733f5e4cda"
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
