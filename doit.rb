class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.3.0/doit-macos-x86_64"
      sha256 "dce0ce8913f122931e89becda06076627a89d14d4463c750b6e5c2e31c5b456c9"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.3.0/doit-macos-aarch64"
      sha256 "f28bc5d1a35757f8d639b1e663a21e3a92ac0e234d359a5585db5b7bf7e6e4329"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.3.0/doit-linux-x86_64"
      sha256 "1194e6009839529fb840c5afc45e5f72b12e3d07afd2439fb7b6bc6c0fe10eb1a"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.3.0/doit-linux-aarch64"
      sha256 "fd33e65a660561070663ec91c3780634157c6d662cbd58eeaf1ac8d8a70c1bca8"
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