class Landfall < Formula
  desc "Join a Landfall war room from your terminal"
  homepage "https://github.com/landfalls-ai/landfall-cli"
  url "https://github.com/landfalls-ai/landfall-cli/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "03bb1c0508e304cf7f90b36df8b1fe9b96db1ca34a176bea1160225131596f9c"
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
