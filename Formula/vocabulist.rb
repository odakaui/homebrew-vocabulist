class Vocabulist < Formula
  desc "Personalized vocabulary frequency list for learning Japanese"
  homepage "https://github.com/odakaui/vocabulist"
  license "MIT"

  if OS.mac?
    url "https://github.com/odakaui/vocabulist/releases/download/v0.1.8/vocabulist-v0.1.8-x86_64-apple-darwin.tar.gz"
    sha256 "88ba7ccac4995975d6a67f55b189b650657bf736ba0d8202f966df87ee419c3d  vocabulist-v0.1.8-x86_64-apple-darwin.tar.gz"
  elsif OS.linux?
    url "https://github.com/odakaui/vocabulist/releases/download/v0.1.8/vocabulist-v0.1.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c1b4176879009a19f498ee8eb5a4ad9fb5a13a2abfb29f2fcc4b4056b5294b75"
  end

  depends_on "mecab" => :recommended
  depends_on "mecab-ipadic" => :recommended

  def install
    bin.install "vocabulist_rs"
    pkgshare.install "jmdict.db"
    prefix.install "ACKNOWLEDGEMENTS.md"
  end

  def caveats
    <<~EOS
      If you do not have an existing config file, you will need to create one before you can start using vocabulist_rs.
      
      Please run `vocabulist_rs config --homebrew`.
    EOS
  end

  test do
    system bin/"vocabulist_rs", "config"
    assert_predicate testpath/".vocabulist_rs/config.toml", :exist?
  end
end
