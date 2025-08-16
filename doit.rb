class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.7.0/doit-macos-x86_64"
      sha256 "0a7fb5ac1e06ef8422f64f09128db41039ad56f2eb8caa1ad646769c53ce7d87"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.7.0/doit-macos-aarch64"
      sha256 "7b4dd60b833191bab660c1ccc2f16bd278ad92f4e17c6e0ca64691e8ec55a1b3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.7.0/doit-linux-x86_64"
      sha256 "eccb6304d7dd549ecaaa7754b7a9088d04a480e5c9eaf900d3de13a9cad42148"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.7.0/doit-linux-aarch64"
      sha256 "02547cbb6f1061102ee21380940d39ff480b539df4ffd09209554eee1b12dd0c"
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
