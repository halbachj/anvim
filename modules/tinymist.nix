{ config, lib, pkgs, ... }:

{
  config.vim.lazy.plugins = {
    "tinymist.nvim" = {
      package = pkgs.tinymist;
      setupModule = "tinymist";
      setupOpts = {
        option_name = true;
      };
      after = ''
        -- custom lua code to run after plugin is loaded
        print('tinymist loaded')
      '';

      # Explicitly mark plugin as lazy. You don't need this if you define one of
      # the trigger "events" below
      lazy = true;

      # load on command
      #cmd = ["AerialOpen"];

      # load on event
      #event = ["BufEnter"];

      # load on keymap
      #keys = [
      #  {
      #    key = "<leader>a";
      #    action = ":AerialToggle<CR>";
      #  }
      #];
    };
  };
}

