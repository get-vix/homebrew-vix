class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.5.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.1/vix-darwin-arm64.tar.gz"
      sha256 "5fe27aefd43600f9edfde982ad66a79d90d1582bc82fd5625400813d0eba775b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.1/vix-linux-arm64.tar.gz"
      sha256 "d66bd175060665c0de1692a2e7c019ccd58997443d76292ac249b20e49d13921"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.5.1/vix-linux-amd64.tar.gz"
      sha256 "3cee54c0b3f8c925c66a1fe66d5054ef1ec321b895fa7d784c6025cc6de80403"
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
