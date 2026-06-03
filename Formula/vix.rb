class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.3.6"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.3.6/vix-darwin-arm64.tar.gz"
      sha256 "b384c2c15deaae04494d00719f13034ac11d4d6eae9bf27ae8c2aa20931fc502"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.3.6/vix-linux-arm64.tar.gz"
      sha256 "58aa03f7f708df51839193433fac92191467013b4e48f1145a564b4e76abf8a1"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.3.6/vix-linux-amd64.tar.gz"
      sha256 "e16a323fbf770d4b4586d8c884acdebedc3fff67b8a1cd0ce62017a054bc6e17"
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
