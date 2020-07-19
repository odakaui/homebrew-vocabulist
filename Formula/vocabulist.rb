class Vocabulist < Formula
  desc "Personalized vocabulary frequency list for learning Japanese"
  homepage "https://github.com/odakaui/vocabulist"
  version "0.1.7"
  license "MIT"

  if OS.mac?
    url "https://github.com/odakaui/vocabulist/releases/download/v#{version}/vocabulist-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "46affc8f17fc3780f1ede5da2c9561d8996c9d120689c68ef6d05e0ed912f03a"
  elsif OS.linux?
    url "https://github.com/odakaui/vocabulist/releases/download/v#{version}/vocabulist-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5c7ddb6dbcebfcf20e07f5fe132f5204007d2a0ab25bcbfc46c8dc85924c349c"
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
