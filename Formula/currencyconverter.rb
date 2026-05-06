class Currencyconverter < Formula
  desc "Convert currencies using ECB exchange rates"
  homepage "https://github.com/timorunge/currencyconverter"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/timorunge/currencyconverter/releases/download/v#{version}/currencyconverter_#{version}_Darwin_x86_64.tar.gz"
      sha256 "97c86e86a14b691b2455f1ef4240ee629192a334f42383bfb5592a241f57fe4c"
    end
    on_arm do
      url "https://github.com/timorunge/currencyconverter/releases/download/v#{version}/currencyconverter_#{version}_Darwin_arm64.tar.gz"
      sha256 "90353826c120863bf1c4222f9b7801be4c228a2126eb9d57b8c79189921117ee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/timorunge/currencyconverter/releases/download/v#{version}/currencyconverter_#{version}_Linux_x86_64.tar.gz"
      sha256 "d680da7e910a51da0aa855ab1436b1a047edd52bdb1d29121602c7250c9ba778"
    end
    on_arm do
      url "https://github.com/timorunge/currencyconverter/releases/download/v#{version}/currencyconverter_#{version}_Linux_arm64.tar.gz"
      sha256 "6391a1188b0f667d228ef5427ded6fbeb005f2e710020c222be3003690f7fd99"
    end
  end

  def install
    bin.install "currencyconverter"
  end

  test do
    assert_match "currencyconverter v#{version}", shell_output("#{bin}/currencyconverter --version")
  end
end
