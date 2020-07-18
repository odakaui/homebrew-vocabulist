class Vocabulist < Formula
  desc "Personalized vocabulary frequency list for learning Japanese"
  homepage "https://github.com/odakaui/vocabulist"
  version "0.1.6"
  license "MIT"

  if OS.mac?
    url "https://github.com/odakaui/vocabulist/releases/download/v#{version}/vocabulist-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "0a0d1b97af00621054335629bb868df6b6da7debd0be56f55c81fec21d5d9c8b"
  elsif OS.linux?
    url "https://github.com/odakaui/vocabulist/releases/download/v#{version}/vocabulist-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2f4117f15418640ed9093b807470e118d7e50602840e3fec2075fb4dbf47452b"
  end

  depends_on "mecab" => :recommended
  depends_on "mecab-ipadic" => :recommended

  def install
    bin.install "vocabulist_rs"
    share.install "jmdict.db"
    prefix.install "ACKNOWLEDGEMENTS.md"

    ohai "To finish setting up the package please run `vocabulist_rs config --homebrew`."
  end

  test do
    system bin/"vocabulist_rs", "config"
    assert_predicate testpath/".vocabulist_rs/config.toml", :exist?
  end
end
