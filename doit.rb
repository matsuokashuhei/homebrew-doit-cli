class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit-cli"
  license "MIT"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit-cli/releases/download/v1.0.0/doit-macos-x86_64"
      sha256 "e45c12c882e39971db222a18a62175ffb08deda074b25053370cb69d3f6d2ad3"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit-cli/releases/download/v1.0.0/doit-macos-aarch64"
      sha256 "fe78bb3fe35a2fda750c110c9db2e1240783a672185e85c5fa1e48501dff3b36"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit-cli/releases/download/v1.0.0/doit-linux-x86_64"
      sha256 "8725cc68247eee11e307c3e725c11ad6833a01f1df08159e83b49f05c189e669"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit-cli/releases/download/v1.0.0/doit-linux-aarch64"
      sha256 "b5744848727246817fd8b5480503e993cf5ed7186b9893e813630921b5205a73"
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
