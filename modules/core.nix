{ config, lib, pkgs, ... }:

{
  config.vim = {
    
    # Enable custom theming options
    theme.enable = true;
    theme.name = "gruvbox";
    theme.style = "dark";

    statusline.lualine.enable = true;

  };

}


