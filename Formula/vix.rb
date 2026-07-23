class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.5.6"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.6/vix-darwin-arm64.tar.gz"
      sha256 "54d1da4fdcaca95de7a0793a6c00ade9633936b6bbe743d7014353f9e3eec260"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.6/vix-linux-arm64.tar.gz"
      sha256 "70dce7ff5fa034271a6e46b1c5dec61026da4f32d6feecc159d39159620d96e6"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.5.6/vix-linux-amd64.tar.gz"
      sha256 "0f7f4d3190c87b3469f7f871a0dbcb14663585ea6b1e6734cc5c2b8ca6ae3418"
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
