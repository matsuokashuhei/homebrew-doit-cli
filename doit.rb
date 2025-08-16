class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.6.0/doit-macos-x86_64"
      sha256 "4f75460fc1f269bad6157c4a3e1d4bcba1400cb1676579a142b63c84e2a5a4b1"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.6.0/doit-macos-aarch64"
      sha256 "98e668251877f5e4a7422807eb26bd4577b672e0b2bab4eb94239ae693c13130"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.6.0/doit-linux-x86_64"
      sha256 "53351ef78e1d39784dc69ac09e1c3e935db6e8af3695b9eff9b30bf515279964"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.6.0/doit-linux-aarch64"
      sha256 "81d35d17d2a9bd239ab2dcd48207190e59d04664f262ef2af60c3d4cb5476092"
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
