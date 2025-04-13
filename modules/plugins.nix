{ config, lib, pkgs, ... }:

{
  imports = [
                #./tinymist.nix
  ];
  config.vim = {
    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    #tinymist.enable = true;
  };
}

