{ config, lib, pkgs, ... }:

let
  cfg = config.anvim.features.ui;
  darculaVim = pkgs.vimUtils.buildVimPlugin {
    pname = "darcula";
    version = "master";
    src = pkgs.fetchzip {
      url = "https://github.com/doums/darcula/archive/refs/heads/master.tar.gz";
      hash = "sha256-Gn+lmlYxSIr91Bg3fth2GAQou2Nd1UjrLkIFbBYlmF8=";
    };
  };
in
{
  options.anvim.features.ui.enable = lib.mkEnableOption "UI features";

  config = lib.mkMerge [
    {
      anvim.features.ui.enable = lib.mkDefault true;
    }
    (lib.mkIf cfg.enable {
      vim = {
        theme.enable = true;
        statusline.lualine.enable = true;

        lazy.plugins = {
          darcula = {
            package = darculaVim;
            lazy = false;
            after = ''
              vim.cmd("colorscheme darcula")
            '';
          };
        };
      };
    })
  ];
}
