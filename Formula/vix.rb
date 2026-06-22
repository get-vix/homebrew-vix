class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.5.2"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.2/vix-darwin-arm64.tar.gz"
      sha256 "ec18802cc6c1102ec2a3095ee1a556c8ef7cf5019c0366c5e308bb11886c771d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.2/vix-linux-arm64.tar.gz"
      sha256 "8bb0f3b3277a4e5b45499fe8189f9130d37089760b1106ff23e5eab382ec0d49"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.5.2/vix-linux-amd64.tar.gz"
      sha256 "97657e2e31b0675886e0f8916b9d4cd7623ae921d86d74c994eb9ad7f025eb20"
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
