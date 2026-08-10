class Landfall < Formula
  desc "Join a Landfall war room from your terminal"
  homepage "https://github.com/landfalls-ai/landfall-cli"
  url "https://github.com/landfalls-ai/landfall-cli/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "75a345ef98740c925664571c90176e8500d0b2041ef4eaf7db8e4b51427fcae8"
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
