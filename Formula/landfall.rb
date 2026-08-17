class Landfall < Formula
  desc "Join a Landfall war room from your terminal"
  homepage "https://github.com/landfalls-ai/landfall-cli"
  url "https://github.com/landfalls-ai/landfall-cli/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "6e8d246461c2e1f22cf997aee10dfbcd3d4aa69ac5ae97c38a60b1ac1777c83e"
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
