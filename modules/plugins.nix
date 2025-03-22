{ config, lib, pkgs, ... }:

{

  config.vim = {
    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
  };
}

