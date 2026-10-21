class Kubepin < Formula
  desc "Configurable Kubernetes service port forwarding with automatic reconnect"
  homepage "https://github.com/opcode0x/kubepin"
  url "https://github.com/opcode0x/kubepin/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "954d74df4070acf9f5a0268f87c4a3e5c0644ab4b918a975772c5082d6a4457b"
  license "MIT"

  depends_on "go" => :build
  depends_on "kubernetes-cli"

  def install
    system "go", "build", "-buildvcs=false", "-o", bin/"kubepin", "."
  end

  test do
    assert_match "Usage of kubepin", shell_output("#{bin}/kubepin -h 2>&1")
  end
end
