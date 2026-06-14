class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.5.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.0/vix-darwin-arm64.tar.gz"
      sha256 "8ed77178bd9d3b123c125ebe47e70c9362e27b72e72b5352c01d8046f85a015b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.0/vix-linux-arm64.tar.gz"
      sha256 "f35960a0c54ebf78add3e54a69220412579305a6d8efedca467ca66fecc2b7f6"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.5.0/vix-linux-amd64.tar.gz"
      sha256 "acb6618786ab535ad6813e32628d77c764abe59a5c2c37bf95b0e8514147451a"
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
