class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.4.3"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.4.3/vix-darwin-arm64.tar.gz"
      sha256 "e1adbca07468a8b71dc23232cebb13b933356a75dbf3284ac91b9fbbdc81c52c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.4.3/vix-linux-arm64.tar.gz"
      sha256 "e7a49037127ce7575a70ba5146762a60a86048f206f6578ccd8192c7ac8ec382"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.4.3/vix-linux-amd64.tar.gz"
      sha256 "61187506ee8993363b709aad1b5c2dbf7da2bf491131cea1212e7459dd246800"
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
