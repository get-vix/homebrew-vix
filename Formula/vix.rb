class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.3.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.3.1/vix-darwin-arm64.tar.gz"
      sha256 "c4c817cb37e8dd6618df3bfe39d33030a63f4ec94a16b8aca2efdba0275fc4b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.3.1/vix-linux-arm64.tar.gz"
      sha256 "18056981bd5517ddf308deea8138e69372d0cb415db50eb9aefbadd75688f281"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.3.1/vix-linux-amd64.tar.gz"
      sha256 "f19f181ad236c858ac8ac895537f80f8d2f7aa573fb19317296345b932ea147a"
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
