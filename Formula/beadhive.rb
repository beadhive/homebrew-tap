class Beadhive < Formula
  include Language::Python::Virtualenv

  desc "Beadhive CLI — the integration-plane driver for Agentic Git Flow (AGF)"
  homepage "https://github.com/beadhive/beadhive"
  url "https://files.pythonhosted.org/packages/5c/46/cd029d3cd4ce251a6e1eebffb350d46ca20c281879fb91b215eb7bae8195/beadhive-0.1.0.tar.gz"
  sha256 "9170419dc4a581137030ce6053a96ba8495763f4a57a6dee6e281be06e50e606"
  # TODO: no LICENSE file in beadhive/beadhive and no license classifier on PyPI
  # yet — add a `license` field here once the source repo declares one.

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"bh", "--help"
  end
end
