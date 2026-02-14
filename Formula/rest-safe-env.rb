class RestSafeEnv < Formula
  desc "Encrypt selected .env values at rest and unlock only with explicit local approval."
  homepage "https://github.com/adpopescu338/rest-safe-env"
  url "https://registry.npmjs.org/rest-safe-env/-/rest-safe-env-0.1.0.tgz"
  sha256 "c0f52cc320339af31c77ef95057f9a85f6eaeac531ec64a65b5c3eaf789dac1e"
  license "MIT"

  depends_on "node"

  def install
    source_dir = Dir.exist?("package") ? "package" : "."
    libexec.install Dir["#{source_dir}/*"]
    bin.install_symlink libexec/"bin/rse.js" => "rse"
  end

  test do
    output = shell_output("#{bin}/rse 2>&1", 1)
    assert_match "Usage:", output
  end
end
