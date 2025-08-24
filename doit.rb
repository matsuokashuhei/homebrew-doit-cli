class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.8.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.5/doit-macos-x86_64"
      sha256 "e58a91fa2f6d397d90a124d3faac92bebd0f27e9551ad57d8ab3e6279444803e"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.5/doit-macos-aarch64"
      sha256 "f25ca0677633a63c991ced1768f7d93668f17f048816737b3c9c4ef7a0fd5693"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.5/doit-linux-x86_64"
      sha256 "8be09ae8d12583be34f77c2ee4a4e4d556a2708f47a4a33b6ff380ded17bcb70"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.8.5/doit-linux-aarch64"
      sha256 "7a84b4e10e524f5ce83677cd985334874e126294090fa92ec806118791db874f"
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
