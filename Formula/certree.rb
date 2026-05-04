class Certree < Formula
  desc "Analyze and visualize X.509 certificate chains"
  homepage "https://github.com/timorunge/certree"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/timorunge/certree/releases/download/v#{version}/certree_#{version}_Darwin_x86_64.tar.gz"
      sha256 "6bd7bcc9626945462e545fa74644d03f7986d3b44f359b961e0de9b658cf0abe"
    end
    on_arm do
      url "https://github.com/timorunge/certree/releases/download/v#{version}/certree_#{version}_Darwin_arm64.tar.gz"
      sha256 "e30c0a5a8ccea11bc1c3450806baddb5692c3294141b658e96924e336637f824"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/timorunge/certree/releases/download/v#{version}/certree_#{version}_Linux_x86_64.tar.gz"
      sha256 "f4a2745cd105a5f9fead67ea1ddbc9cda84d62788471d519965188d96d9326cb"
    end
    on_arm do
      url "https://github.com/timorunge/certree/releases/download/v#{version}/certree_#{version}_Linux_arm64.tar.gz"
      sha256 "903b10a0e6b9fea27aa9317b5803cd5f8d4d439b7c7667f91363d219c2eff409"
    end
  end

  def install
    bin.install "certree"
  end

  test do
    assert_match "certree v#{version}", shell_output("#{bin}/certree --version")
  end
end
