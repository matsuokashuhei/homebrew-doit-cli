class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit-cli"
  license "MIT"
  version "0.10.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit-cli/releases/download/v0.10.3/doit-macos-x86_64"
      sha256 "fd5d9a2cd98273e4a51d40c04853cc6f98d8320617cb300f2d220546db6b8b84"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit-cli/releases/download/v0.10.3/doit-macos-aarch64"
      sha256 "d0acef0057c55b429775af2a04e4aa287a6fd0ffb08f4a30732c0332b5c9513f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit-cli/releases/download/v0.10.3/doit-linux-x86_64"
      sha256 "4a5dac151ea33b26a4c5b43813583093a6b991616fcec2c33a8eb7067778bfd6"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit-cli/releases/download/v0.10.3/doit-linux-aarch64"
      sha256 "d42b943cf3fb62a83b46cb8decc8b3d4211e12d3969dc985b7c59d0ba7b6859f"
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
