class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.4.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.4.1/vix-darwin-arm64.tar.gz"
      sha256 "9522e2cc1c1793a5e81610131e9fc3ca9fcfb49a6087f29f3ca0268485927cf4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.4.1/vix-linux-arm64.tar.gz"
      sha256 "a4c196bd31f40d1849b0391ff1c761d99164ca132a713fda45ac355142c136dc"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.4.1/vix-linux-amd64.tar.gz"
      sha256 "299b165803ed61d2361150c6d4f8b7c21eaee127cfca1f880fc88137ad45f619"
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
