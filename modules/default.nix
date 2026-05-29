{ config, lib, pkgs, ... } : {
  imports =
    [
      ./core.nix
      ./ui.nix
      ./plugins.nix
      ./languages.nix
      ./academic.nix
      ./features/git.nix
      ./features/navigation.nix
      ./features/coding.nix
      ./features/dashboard.nix
      ./features/debug.nix
      ./features/testing.nix
      ./features/sessions.nix
    ]
    ++ lib.optional (builtins.pathExists ./local.nix) ./local.nix;
}
