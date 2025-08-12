class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.5.0/doit-macos-x86_64"
      sha256 "f2647d3e2f4c5fef2a2dac7ca20aa9ea6c021d92b442e1b40d83905c152db0c3"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.5.0/doit-macos-aarch64"
      sha256 "c89f6eecf84626d5f9cce4c3bd29bfcfe3e83cf8fcd879cda125d3dfd24ac645"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.5.0/doit-linux-x86_64"
      sha256 "31fb5400c10527e6a84238ce2a0a9cac37ec3882fd40aec1b56cfeab5fa6250b"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.5.0/doit-linux-aarch64"
      sha256 "3d558515a8f53cffa805b500ce4105954ab52fece91b51b3ec2921c65381f043"
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
