class LoreCli < Formula
  desc "CLI and terminal interface for lore: ingest, search, and serve knowledge bases"
  homepage "https://github.com/timorunge/lore"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/timorunge/lore/releases/download/v0.2.0/lore-cli-aarch64-apple-darwin.tar.gz"
      sha256 "628fa2702348cf42a77670aebe59d9c87206e7987cae7925bbd7fb72dfb1c219"
    end
    if Hardware::CPU.intel?
      url "https://github.com/timorunge/lore/releases/download/v0.2.0/lore-cli-x86_64-apple-darwin.tar.gz"
      sha256 "6258faa38b3f67daeaea46eb676e3b028c26ed1a1a89203c88401ffb2f658519"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/timorunge/lore/releases/download/v0.2.0/lore-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "470cd573f8ad91b2b1352f8f7f80ec9585201360172f52b64ebc7393832e0626"
    end
    if Hardware::CPU.intel?
      url "https://github.com/timorunge/lore/releases/download/v0.2.0/lore-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "adffb3661e3857c2b48fc2c76eca77c27b5173a54f30d7f13084346ec45ed2dd"
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
    if OS.mac? && Hardware::CPU.arm?
      bin.install "lore"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "lore"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "lore"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "lore"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
