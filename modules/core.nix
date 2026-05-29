{ config, lib, pkgs, ... }:

{
  config.vim = {
    options = {
      tabstop = 2;
      softtabstop = 0;
      expandtab = true;
      shiftwidth = 2;
      smarttab = true;
    };

  };

}

