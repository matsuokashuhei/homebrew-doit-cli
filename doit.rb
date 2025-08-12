class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.3.0/doit-macos-x86_64"
      sha256 "eb3e0185b020c7a656d1716b143473743f4e1dc3cea29f453a4c251addbdc6c0"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.3.0/doit-macos-aarch64"
      sha256 "16404a6d3692ef50eccf93f5fd5335c3758b067df02100561c04d9f7b8ac4424"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.3.0/doit-linux-x86_64"
      sha256 "bd363c789330e47139b4b48c4bbdd6a9991a7f03766d4fe84374e4dd6d755b12"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.3.0/doit-linux-aarch64"
      sha256 "9abac3e3791bf8a51cb22228b09cb6937918c12fef79eedf44b1f031ae34e6e9"
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
