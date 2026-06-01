class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.3.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.3.2/vix-darwin-arm64.tar.gz"
      sha256 "d3449d2a3cab38e46dcee6efb1bb8f54c0bbd18572ade420e21e10a2215bab50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.3.2/vix-linux-arm64.tar.gz"
      sha256 "30b024a2b4993c6d3ff0c8def8a0c56541810448dc1b7316c0fdc2fbd60685a8"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.3.2/vix-linux-amd64.tar.gz"
      sha256 "91c099b72fb43db2340bf3b4a241faef52a65945ce15163d68391d8109ad1a81"
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
