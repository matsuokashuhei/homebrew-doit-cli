class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.9.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.9.0/doit-macos-x86_64"
      sha256 "fbc6bf16dcd3ea1940d5ec6b3fbf9394da4a11724952ca91a89d14dde34529d9"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.9.0/doit-macos-aarch64"
      sha256 "b3621bbf0866023dada5d1b677a7b5005e80132b34a8d6ec2310c6f54a9d4566"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.9.0/doit-linux-x86_64"
      sha256 "f973226b9a8f8f44ba85e9d8b2e16566950f16a0b1646d776a0071e02551ef78"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.9.0/doit-linux-aarch64"
      sha256 "509d278e5306c41d9af2843be781a098fa000005aefe60d7de46a6fd8029dda6"
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
