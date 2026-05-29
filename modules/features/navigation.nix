{ config, lib, pkgs, ... }:

let
  cfg = config.anvim.features.navigation;
in
{
  options.anvim.features.navigation.enable = lib.mkEnableOption "navigation features";

  config = lib.mkMerge [
    {
      anvim.features.navigation.enable = lib.mkDefault true;
    }
    (lib.mkIf cfg.enable {
      vim.lazy.plugins = {
        "oil.nvim" = {
          package = pkgs.vimPlugins.oil-nvim;
          cmd = [ "Oil" ];
          setupModule = "oil";
          setupOpts = {};
          after = ''
            vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
          '';
        };

        "flash.nvim" = {
          package = pkgs.vimPlugins.flash-nvim;
          event = [ "BufReadPost" ];
          setupModule = "flash";
          setupOpts = {};
          after = ''
            vim.keymap.set({"n", "x", "o"}, "s", function() require("flash").jump() end, { desc = "Flash jump" })
            vim.keymap.set({"n", "x", "o"}, "S", function() require("flash").treesitter() end, { desc = "Flash treesitter" })
          '';
        };
      };
    })
  ];
}
