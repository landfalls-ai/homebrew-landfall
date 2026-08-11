class Landfall < Formula
  desc "Join a Landfall war room from your terminal"
  homepage "https://github.com/landfalls-ai/landfall-cli"
  url "https://github.com/landfalls-ai/landfall-cli/archive/refs/tags/v0.4.3.tar.gz"
  sha256 "be2efccfe88161b312ff857b792434db2535e5fb51ee8b7b75c56679b7f465d2"
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
