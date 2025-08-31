class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.10.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.10.1/doit-macos-x86_64"
      sha256 "c3efeff3ce32b4cd061419a3922a3845c803a86987a0b9b822e130161bea7898"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.10.1/doit-macos-aarch64"
      sha256 "33c070079105704e55c04f3a20a6e8821c49dea6d31cf5ac1593345353b45e9d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.10.1/doit-linux-x86_64"
      sha256 "586b8766fbaccc59685ba0251939585348fec12a7b589c6c950be4444caed728"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.10.1/doit-linux-aarch64"
      sha256 "197c73fe7ad52abcdbf29715f419e4bbdac7db4017451c225132be85ad037cc8"
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