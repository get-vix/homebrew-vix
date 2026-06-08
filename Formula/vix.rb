class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.4.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.4.2/vix-darwin-arm64.tar.gz"
      sha256 "bd9e358513f360ef59710fff42b519aea6016696feed56db2c1e63cf5930ffa9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.4.2/vix-linux-arm64.tar.gz"
      sha256 "d44d81aa031d4b26833d944f14b3320eb98876983b8451069279857d1d7c4e30"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.4.2/vix-linux-amd64.tar.gz"
      sha256 "29f4e4e89ee12168520014175d3fe469177ae42499248edade2c17bbb41d0fc0"
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
