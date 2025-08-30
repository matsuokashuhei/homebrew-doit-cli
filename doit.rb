class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.9.4"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.9.4/doit-macos-x86_64"
      sha256 "71d4e8877d44434ad952376c2b52e85a361ea7cbdf946319d2db50034a836369"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.9.4/doit-macos-aarch64"
      sha256 "026d0fd0d18fa2d4c8fb868480377d08ea7033901f9ac0a097852a15e676ef63"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.9.4/doit-linux-x86_64"
      sha256 "b3e2766b4363b81a89f939189a89c7fb27bd88bed92304d1de6756541bafed3b"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.9.4/doit-linux-aarch64"
      sha256 "2429b3b06590d32594b0862da4aa50150b2f35600a733b30ce8fdc86d23dff76"
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
