{ config, lib, pkgs, ... } : {

  imports = [
    ./core.nix
    ./plugins.nix
    ./languages.nix
  ];
}
