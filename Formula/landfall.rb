class Landfall < Formula
  desc "Join a Landfall war room from your terminal"
  homepage "https://github.com/landfalls-ai/landfall-cli"
  url "https://github.com/landfalls-ai/landfall-cli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "edcb8f0474b871453dd434433b28a2c0cc93df16388f01550ad4213b8fee1263"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Usage: landfall", shell_output("#{bin}/landfall --help")
  end
end
