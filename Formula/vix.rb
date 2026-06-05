class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.4.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.4.0/vix-darwin-arm64.tar.gz"
      sha256 "fc92aba711f526765f2394e36eb09348d7a34f35066db4f4f050ffc5677ada32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.4.0/vix-linux-arm64.tar.gz"
      sha256 "1890c29f2e81f0c6a68458b49988fffcd81264a777b4fbba24376af97d235e2b"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.4.0/vix-linux-amd64.tar.gz"
      sha256 "97b43bedc7f6358a389aff6838dea390dfa40dde087c1e0d918e7d353facb65a"
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
