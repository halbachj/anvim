{ config, lib, pkgs, ... } : {
  imports =
    [
      ./core.nix
      ./plugins.nix
      ./languages.nix
      ./academic.nix
    ]
    ++ lib.optional (builtins.pathExists ./local.nix) ./local.nix;
}
