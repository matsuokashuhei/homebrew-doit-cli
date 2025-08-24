class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.8.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.4/doit-macos-x86_64"
      sha256 "be8181f7e53f48e74e60f5ccb02bbbb6923980255ca70a5dfaaaa45fd2067925"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.4/doit-macos-aarch64"
      sha256 "25077f68aefe46114540cccd615d48e976bdae278c9213419ae228db8aad781c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.4/doit-linux-x86_64"
      sha256 "d325b291da959f7e64de1344bc27c527cea0b0941bc80c9920974edba7469a62"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.4/doit-linux-aarch64"
      sha256 "9f8f0d20c81d6e8b1dd4f7a0a3fcf85cf5be669b9cfbc1b7acc724ca35143b57"
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
