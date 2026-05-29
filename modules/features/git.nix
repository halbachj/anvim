{ config, lib, pkgs, ... }:

let
  cfg = config.anvim.features.git;
in
{
  options.anvim.features.git = {
    enable = lib.mkEnableOption "git features";
    neogit = lib.mkEnableOption "neogit plugin";
  };

  config = lib.mkMerge [
    {
      anvim.features.git.enable = lib.mkDefault true;
      anvim.features.git.neogit = lib.mkDefault false;
    }
    (lib.mkIf cfg.enable {
      vim.git = {
        enable = true;
        gitsigns.enable = true;
      };
    })
    (lib.mkIf (cfg.enable && cfg.neogit) {
      vim.lazy.plugins.neogit = {
        package = pkgs.vimPlugins.neogit;
        cmd = [ "Neogit" ];
      };
    })
  ];
}
