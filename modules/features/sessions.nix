{ config, lib, pkgs, ... }:

let
  cfg = config.anvim.features.sessions;
in
{
  options.anvim.features.sessions.enable = lib.mkEnableOption "session persistence features";

  config = lib.mkMerge [
    {
      anvim.features.sessions.enable = lib.mkDefault true;
    }
    (lib.mkIf cfg.enable {
      vim.lazy.plugins."persistence.nvim" = {
        package = pkgs.vimPlugins.persistence-nvim;
        event = [ "BufReadPre" ];
        setupModule = "persistence";
        setupOpts = {};
        after = ''
          vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc = "Restore session" })
          vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Restore last session" })
          vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Stop session save" })
        '';
      };
    })
  ];
}
