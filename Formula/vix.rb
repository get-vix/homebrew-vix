class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.5.4"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.4/vix-darwin-arm64.tar.gz"
      sha256 "40c6ce4cc37fd74e9e4121846ff0e25db544c8fb8b4c73a18d8b87ddd62edfe0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.4/vix-linux-arm64.tar.gz"
      sha256 "76eea24df1a25b7520cbe0eaee1fb08b941bc495cda186b8889d5c8e32546145"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.5.4/vix-linux-amd64.tar.gz"
      sha256 "cfec27e6f81f73cebd5ed0a6960c174b8c734a399108f8411b81ee8613861d06"
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
