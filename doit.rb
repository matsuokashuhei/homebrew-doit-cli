class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.8.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.3/doit-macos-x86_64"
      sha256 "3896921b9cd5783b16efe57505fd499781d578eee0df5ceb4fec5f5b08be8dc4"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.3/doit-macos-aarch64"
      sha256 "871881ecadac6b0fb324285a7115cd0d045a9da1ad1921efea60cde8d98f9f5b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.3/doit-linux-x86_64"
      sha256 "0a625e821c52e5b9a59dc5c79954ac00f5184c6aacc160016f1ba47af2883dd2"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.3/doit-linux-aarch64"
      sha256 "ffde644e0b7ea76a33890d1f42cf25c29d197ebcc6b5cfbd887bdd5eeddb5dbf"
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
