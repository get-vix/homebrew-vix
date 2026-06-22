class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.5.3"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.3/vix-darwin-arm64.tar.gz"
      sha256 "3fb755dad7333714f4d4d19a74a29314f7af5a422bb6386119f71a5fee5984c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.3/vix-linux-arm64.tar.gz"
      sha256 "87a8714b0856bb68bb5c25a5f37f736aaa508709c3042ecdacd4a337515f7e7e"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.5.3/vix-linux-amd64.tar.gz"
      sha256 "2f43d7f5d60368dcba8386484386c665fda627ef101061497ae7fab3aa474e0e"
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
