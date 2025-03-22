{ config, lib, pkgs, ... }:

{
  config.vim.languages = {
    enableLSP = true;
    enableTreesitter = true;

    nix.enable = true;
    clang.enable = true;
    #latex.enable = true;
    #arduino.enable = true;
    java.enable = true;

  };

}


