class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.8.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.1/doit-macos-x86_64"
      sha256 "8321664c68e03b5740313f3d34db00e9b1fbb1a131cee46cb2ab37a2d14622ff"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.1/doit-macos-aarch64"
      sha256 "1599c42330fad77628596248a09eabf53f055296ac012026cd043be5f4a35aba"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.1/doit-linux-x86_64"
      sha256 "3dfd74d5b7e66a6a5514d6a687af2fa371ed418833105b1fd1b1e8d20c9e82dd"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.1/doit-linux-aarch64"
      sha256 "f59407364bd5a6734ca28e2eb6291d8c14a2e07fa800b9fc7acc3d432e8c75d7"
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
