class RestSafeEnv < Formula
  desc "Encrypt selected .env values at rest and unlock only with explicit local approval."
  homepage "https://github.com/adpopescu338/rest-safe-env"
  url "https://registry.npmjs.org/rest-safe-env/-/rest-safe-env-0.2.1.tgz"
  sha256 "7c66e1bbc2abde657e5bc393ce7efc6121476d598cfb6dcbae79b5dd92bb2cfe"
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
