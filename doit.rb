class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.6.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.6.2/doit-macos-x86_64"
      sha256 "7a606190969a73a107a996a6bea08c4dfb7f428a4d8856b5d0887abc8c39e828"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.6.2/doit-macos-aarch64"
      sha256 "3db26be427229ec54825b1ba73e5fc217698ecea66545872b32e8156106ec54d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.6.2/doit-linux-x86_64"
      sha256 "707bce3605d58385df828e2e74b3cd27dbb893a1f5c47bd4bd2d36ee189769d4"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.6.2/doit-linux-aarch64"
      sha256 "50a225f712f0b88510631bea5cf81bcd4c1b981549821e4bdecbfd4569dbd71d"
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
