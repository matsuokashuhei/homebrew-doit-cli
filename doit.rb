class Doit < Formula
  desc "A CLI progress monitor for time-based visualization"
  homepage "https://github.com/matsuokashuhei/doit"
  license "MIT"
  version "0.８.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.８.0/doit-macos-x86_64"
      sha256 "e355bc178ba71d9e2efc5c9b893c2a34d3003d36b1fd7304786b24afa18387fd"
    end

    if Hardware::CPU.arm?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.８.0/doit-macos-aarch64"
      sha256 "1ca58779d123edc9856bb8cd142bdaeb27ded4d1a62c3dec6376e301014f72ee"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.８.0/doit-linux-x86_64"
      sha256 "e5bb69ccf35f3f1e9cea8a04e4920c28528dc407a65d0fe1de36ffa4bb2c2117"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/matsuokashuhei/doit/releases/download/v0.８.0/doit-linux-aarch64"
      sha256 "46d07ac4ae0516f8216f23ee664b2757c8a270d85734888d4802b72c8d061035"
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
