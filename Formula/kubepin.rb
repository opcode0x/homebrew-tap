class Kubepin < Formula
  desc "Configurable Kubernetes service port forwarding with automatic reconnect"
  homepage "https://github.com/opcode0x/kubepin"
  url "https://github.com/opcode0x/kubepin/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "ff241c411a609201436ba8f33bb09b0765a13d25232483351882235b79c3df71"
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
