class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.8.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.1/doit-macos-x86_64"
      sha256 "18ba9d5b880a0fe8e89ab9de58b40a79069472417a3a2e47e7b498abf9505f45"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.1/doit-macos-aarch64"
      sha256 "786a4932956bdc0fb2920bfd139496f5694a77a4a58448c1687b64bafbae69e0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.1/doit-linux-x86_64"
      sha256 "4a3fdc947581600ee3ea28566885f0106210a9ada9534e2b3400b136f23a7ec9"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.1/doit-linux-aarch64"
      sha256 "b6dd04ef5526e257ea08faf3f2357cd6dadfa39d6358b87fab376e9a25c39218"
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
