{ config, lib, pkgs, ... }:

let
  cfg = config.anvim.features.dashboard;
in
{
  options.anvim.features.dashboard.enable = lib.mkEnableOption "startup dashboard";

  config = lib.mkMerge [
    {
      anvim.features.dashboard.enable = lib.mkDefault true;
    }
    (lib.mkIf cfg.enable {
      vim.lazy.plugins."alpha-nvim" = {
        package = pkgs.vimPlugins.alpha-nvim;
        event = [ "VimEnter" ];
        after = ''
          local dashboard = require("alpha.themes.dashboard")
          dashboard.section.header.val = {
            "      ANVIM      ",
            "  Neovim + Nix   ",
          }
          dashboard.section.buttons.val = {
            dashboard.button("f", "Find file", "<cmd>Telescope find_files<CR>"),
            dashboard.button("r", "Recent files", "<cmd>Telescope oldfiles<CR>"),
            dashboard.button("g", "Live grep", "<cmd>Telescope live_grep<CR>"),
            dashboard.button("s", "Restore session", "<cmd>lua require('persistence').load()<CR>"),
            dashboard.button("q", "Quit", "<cmd>qa<CR>"),
          }
          require("alpha").setup(dashboard.opts)
          vim.keymap.set("n", "<leader>hh", "<cmd>Alpha<CR>", { desc = "Open dashboard" })
        '';
      };
    })
  ];
}
