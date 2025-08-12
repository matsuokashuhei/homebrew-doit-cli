class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.5.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.5.1/doit-macos-x86_64"
      sha256 "c0704efcf68df5326be33bb55f5bdf961a027fd9d98a0eee742297330e4e9fae"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.5.1/doit-macos-aarch64"
      sha256 "f582f5c36344c6b0b9b5618db7bcf8475c70213b32dd0af612e509230483b738"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.5.1/doit-linux-x86_64"
      sha256 "78b02c06a46adaab0c591fda9780d2f773e4545d0c77254169103d5a45d629d8"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.5.1/doit-linux-aarch64"
      sha256 "a48f51bc8d4d2e6d636caa86b4bed544285da59ed212b8c0c7138590f6b7c2b5"
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
