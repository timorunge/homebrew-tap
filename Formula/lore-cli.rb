class LoreCli < Formula
  desc "CLI and terminal interface for lore: ingest, search, and serve knowledge bases"
  homepage "https://github.com/timorunge/lore"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/timorunge/lore/releases/download/v0.1.0/lore-cli-aarch64-apple-darwin.tar.gz"
      sha256 "2fca2e0b57052a4857e0fc3c458758e0683b443ce1a668a748ac78d81d9e444a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/timorunge/lore/releases/download/v0.1.0/lore-cli-x86_64-apple-darwin.tar.gz"
      sha256 "e6ab7798b2591601d8f21c07b051894ed638602dc1b9ebd5830f6c15e49e594a"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/timorunge/lore/releases/download/v0.1.0/lore-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "16feaad7220255ef6f2d298b8794d36b722326475a177a77d0045529cbfd5eb9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/timorunge/lore/releases/download/v0.1.0/lore-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3636134ce057d44839b5e806e6ceb5250ecb424f701bd66aacd16fa92de7bd30"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "lore" if OS.mac? && Hardware::CPU.arm?
    bin.install "lore" if OS.mac? && Hardware::CPU.intel?
    bin.install "lore" if OS.linux? && Hardware::CPU.arm?
    bin.install "lore" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
