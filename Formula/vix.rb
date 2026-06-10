class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.4.5"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.4.5/vix-darwin-arm64.tar.gz"
      sha256 "dbfd0180257298989ff16c0b7f2562fbec3464298479a787771017bfa084588a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.4.5/vix-linux-arm64.tar.gz"
      sha256 "2471ca863511314eb95d45375d1e2643d3e6872f4dec1314c0641ac013bcfbdb"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.4.5/vix-linux-amd64.tar.gz"
      sha256 "fff2892108375e6a1ac2452c12533e906c869928ce663463690111e17a45af53"
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
