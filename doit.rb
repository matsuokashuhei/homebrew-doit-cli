class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.9.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.9.1/doit-macos-x86_64"
      sha256 "6c1e4b927a7204e292791589e0ea86c5d48787333ad96ef2e975eb96e5d16968"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.9.1/doit-macos-aarch64"
      sha256 "89b4f72184b93ef261253b81d41cf452e558714e313f7167455023b5ae444cfe"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.9.1/doit-linux-x86_64"
      sha256 "c57e1051175974b2dc71211d05867f5a914459b7b178add2898b0a65c95e64a9"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.9.1/doit-linux-aarch64"
      sha256 "717abb5c139da542742c75d32807a032ffa1ac0c05483b2ab41bbe21256e6418"
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
