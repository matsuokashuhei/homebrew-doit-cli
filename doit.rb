class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.6.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.6.1/doit-macos-x86_64"
      sha256 "709de0c005e0aef347bf3def5dff053a65532b19fb12f6a25bbfdb409fa479cb"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.6.1/doit-macos-aarch64"
      sha256 "d218cd0eaf50b2914cf1075bf5d1003d6642d8be3bf997a9211833d4e4bdb325"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.6.1/doit-linux-x86_64"
      sha256 "ce837cd08e68e60f0bfb3aa3e16db4461cd68e2f58a394b92fdf32f1ee7dd93a"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.6.1/doit-linux-aarch64"
      sha256 "913e60c8156cb85f6f9c936665e1e1cc81f70539437cbd7c51bce62da894f18b"
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
