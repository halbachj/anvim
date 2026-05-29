{ config, lib, pkgs, ... }:

let
  cfg = config.anvim.features.coding;
in
{
  options.anvim.features.coding.enable = lib.mkEnableOption "coding quality-of-life features";

  config = lib.mkMerge [
    {
      anvim.features.coding.enable = lib.mkDefault true;
    }
    (lib.mkIf cfg.enable {
      vim.lazy.plugins = {
        "trouble.nvim" = {
          package = pkgs.vimPlugins.trouble-nvim;
          cmd = [ "Trouble" "TroubleToggle" ];
          setupModule = "trouble";
          setupOpts = {};
          after = ''
            vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
            vim.keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer diagnostics" })
            vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix list" })
            vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "Location list" })
          '';
        };

        "fidget.nvim" = {
          package = pkgs.vimPlugins.fidget-nvim;
          event = [ "LspAttach" ];
          setupModule = "fidget";
          setupOpts = {};
        };
      };
    })
  ];
}
