class Landfall < Formula
  desc "Join a Landfall war room from your terminal"
  homepage "https://github.com/landfalls-ai/landfall-cli"
  url "https://github.com/landfalls-ai/landfall-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c17424ba71353a73b2f9d4b72e537da2c2d4a12ae969ab559838edca26f6dfa0"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    # `landfall logout` is the safest smoke test available today: no network
    # I/O, no hang waiting on stdin/MCP handshake, clears a (likely absent)
    # cached session and exits 0. (v0.1.0 has no --help flag yet — see
    # landfall-cli issue tracker / RELEASING.md for the planned v0.1.1 fix.)
    system "#{bin}/landfall", "logout"
  end
end
