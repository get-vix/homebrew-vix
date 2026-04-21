class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.15"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.15/vix-darwin-arm64.tar.gz"
      sha256 "f7a68ab9cc30f101dc1521c5ab9b397cc3d9ffc05b8b5805d63ea39b2df1da6e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.15/vix-linux-arm64.tar.gz"
      sha256 "de0e1b0035d07bbb8d2bde9fe6975a1d7cf5f884422641906b6749ea6bcec0ec"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.15/vix-linux-amd64.tar.gz"
      sha256 "e16616af8d09b991795c3c7e6aa02989969426185ca4e0dcb664e3e9198ae3d4"
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
