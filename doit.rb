class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.10.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.10.0/doit-macos-x86_64"
      sha256 "991f8f27c0bb5b0af880374127076efd02e0144bf14b3b79576148d8dd27eaaf"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.10.0/doit-macos-aarch64"
      sha256 "fcfd8892c7e049cc2a0b53a5b86e197eba9b87dc569e76f10da9250a072c972d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.10.0/doit-linux-x86_64"
      sha256 "c0e69b6f918a1138ccf4a88643aaeac6b34617d066393c1fe1e441b301105c7c"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.10.0/doit-linux-aarch64"
      sha256 "649d976fc3ad3a6c396d4cfd88892c52b1ef4478d362ec67cd3990608b3b3f3e"
    end
  end

  def install
    bin.install "doit-macos-x86_64" => "doit" if OS.mac? && Hardware::CPU.intel?
    bin.install "doit-macos-aarch64" => "doit" if OS.mac? && Hardware::CPU.arm?
    bin.install "doit-linux-x86_64" => "doit" if OS.linux? && Hardware::CPU.intel?
    bin.install "doit-linux-aarch64" => "doit" if OS.linux? && Hardware::CPU.arm?
  end

  test do
    system "#{bin}/doit", "--help"

    # Test basic functionality
    output = shell_output("#{bin}/doit --duration 1s 2>&1", 0)
    assert_match "Start:", output
  end
end