{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Python environment
    python3
    python3Packages.pip
    python3Packages.ansible
    python3Packages.ansible-core
    rsync
  ];

  shellHook = ''
    echo "Cloud deployment development environment ready!"
    echo "Ansible $(ansible --version | head -n1) is available"
  '';
}