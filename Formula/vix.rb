class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.5.5"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.5/vix-darwin-arm64.tar.gz"
      sha256 "c774d5bd5deb5a9df5e03d4d624a5e7c95615ea9d922e2f56bff2ec5ea0f4055"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.5/vix-linux-arm64.tar.gz"
      sha256 "f75ed05b69ecbec154339fce478d66e1d00229bdc9e4a24099c63538f138a4f4"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.5.5/vix-linux-amd64.tar.gz"
      sha256 "56258dde33cedcf2218b2df7371f9abdcd05945dfa27c1868c624f72751050ba"
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
