{ config, lib, pkgs, ... }:

let
  cfg = config.anvim.features.testing;
in
{
  options.anvim.features.testing.enable = lib.mkEnableOption "testing features";

  config = lib.mkMerge [
    {
      anvim.features.testing.enable = lib.mkDefault false;
    }
    (lib.mkIf cfg.enable {
      vim.lazy.plugins = {
        neotest = {
          package = pkgs.vimPlugins.neotest;
          event = [ "BufReadPost" ];
        };
      };
    })
  ];
}
