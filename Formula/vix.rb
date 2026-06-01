class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.3.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.3.1/vix-darwin-arm64.tar.gz"
      sha256 "9a0b5e064559b6f7bdf7e6fb1001580edc28dacf6e1d0c773fcdb52f82d55358"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.3.1/vix-linux-arm64.tar.gz"
      sha256 "e6420641a5990732b3e46a9ac16f5eaba524a67452285bb73f246a4fb286215d"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.3.1/vix-linux-amd64.tar.gz"
      sha256 "1f99825e595047ff494dcd6e7dcde1614c945bc73a4350f2f5d4b6cf18aa936f"
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
