class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix"
  version "0.3.3"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix/releases/download/v0.3.3/vix-darwin-arm64.tar.gz"
      sha256 "c4babe4b9249040a9d6e8b908f2c358e9340b13f9b375aa59e78b9f86f5af6e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix/releases/download/v0.3.3/vix-linux-arm64.tar.gz"
      sha256 "3bebfb827a22138cae10e4aee588c5a562acf3e793194a75bf2494c20ef7d26b"
    end
    on_intel do
      url "https://github.com/kirby88/vix/releases/download/v0.3.3/vix-linux-amd64.tar.gz"
      sha256 "cb54efc377d75d10e61cfe0b2a06ab4a68ea5e865bb86faf0673f70f1673e8dd"
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
