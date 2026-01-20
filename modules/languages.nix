{ config, lib, pkgs, ... }:

{
  config.vim = {
    treesitter.enable = true;
    languages = {
      enableLSP = true;
      enableTreesitter = true;

      nix.enable = true;
      clang.enable = true;
      #latex.enable = true;
      #arduino.enable = true;
      java.enable = true;
      markdown.enable = true;
    };
  };

}
