{ config, lib, pkgs, ... }:

let
  cfg = config.anvim.features.debug;
in
{
  options.anvim.features.debug.enable = lib.mkEnableOption "debugging features";

  config = lib.mkMerge [
    {
      anvim.features.debug.enable = lib.mkDefault false;
    }
    (lib.mkIf cfg.enable {
      vim.lazy.plugins = {
        "nvim-dap" = {
          package = pkgs.vimPlugins.nvim-dap;
          event = [ "BufReadPost" ];
        };

        "nvim-dap-ui" = {
          package = pkgs.vimPlugins.nvim-dap-ui;
          event = [ "BufReadPost" ];
          setupModule = "dapui";
          setupOpts = {};
        };

        "nvim-dap-virtual-text" = {
          package = pkgs.vimPlugins.nvim-dap-virtual-text;
          event = [ "BufReadPost" ];
          setupModule = "nvim-dap-virtual-text";
          setupOpts = {};
        };
      };
    })
  ];
}
