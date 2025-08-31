class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.10.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.10.2/doit-macos-x86_64"
      sha256 "6b87873a400e81d2f447f47ffd8fc8f41bddb85c23ba7bf8152ca70d68520cff"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.10.2/doit-macos-aarch64"
      sha256 "4ddd29f5db8e8df8990abf09533b8a50e0f22b50ae586dba1af4c6325f70ca79"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.10.2/doit-linux-x86_64"
      sha256 "3d5b14f599d4170cc6995c9fcb2902baeeeaae30f83bbd72a4114ad215a63acc"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.10.2/doit-linux-aarch64"
      sha256 "83df9d7186674d3b59f6d2df0179f8158af38f79006106b85457e3031efc7069"
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
