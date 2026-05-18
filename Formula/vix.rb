class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.3.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.3.0/vix-darwin-arm64.tar.gz"
      sha256 "bd1b2eef9cb564f089b1e6bd684b3464899bcb53d1d2d03d3ec68de9d87e5369"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.3.0/vix-linux-arm64.tar.gz"
      sha256 "78532d26982a070de8664c09403dbb7a6944f49198d1e58ffce3771d36a84d79"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.3.0/vix-linux-amd64.tar.gz"
      sha256 "30b9a56497a938caded223f460692062e97722061fd1f07605c0cf069bace1f1"
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
