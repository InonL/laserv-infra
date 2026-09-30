{ pkgs, lib, config, inputs, ... }:

{
  packages = with pkgs; [
    bitwarden-cli
    ansible-lint
    molecule
    just
  ];

  languages.ansible.enable = true;

  languages.python = {
    enable = true;
    version = "3.13";
    venv.enable = true;
    uv = {
      enable = true;
      sync.enable = true;
    };
    libraries = with pkgs;
      [
        zlib
        glib
      ];
  };

}
