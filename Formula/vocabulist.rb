class Vocabulist < Formula
  desc "Personalized vocabulary frequency list for learning Japanese"
  homepage "https://github.com/odakaui/vocabulist"
  version "0.1.4"
  license "MIT"

  if OS.mac?
    url "https://github.com/odakaui/vocabulist/releases/download/v#{version}/vocabulist-v#{version}-x86_64-apple-darwin.tar.gz"
    sha256 "7530cae373fc1dfa7fe1a7e1e1b2663c1d9a79c2b6fee784a715de9951c9e6b3"
  elsif OS.linux?
    url "https://github.com/odakaui/vocabulist/releases/download/v#{version}/vocabulist-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e3c74a42ac934c0782a12af5695a5a5baeeecfbee26b6c5e9025c1eca6dc073f"
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
