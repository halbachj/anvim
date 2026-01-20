{ config, lib, pkgs, ... }:

let
  zotciteFiletypes = [
    "markdown"
    "quarto"
    "rmd"
    "tex"
    "plaintex"
    "typst"
    "vimwiki"
    "rnoweb"
  ];
in
{
  config.vim = {
    extraPackages = [ pkgs.sqlite ];

    #lsp.lspconfig = {
    #  enable = true;
    #  sources.texlab = ''
    #    lspconfig.texlab.setup{
    #      capabilities = capabilities;
    #      on_attach = default_on_attach;
    #      cmd = {"${pkgs.texlab}/bin/texlab"};
    #    }
    #  '';
    #};

    #treesitter = {
    #  enable = true;
    #  grammars = [
    #    pkgs.vimPlugins.nvim-treesitter.builtGrammars.latex
    #    pkgs.vimPlugins.nvim-treesitter.builtGrammars.bibtex
    #    pkgs.vimPlugins.nvim-treesitter.builtGrammars.yaml
    #  ];
    #};

    #lazy.plugins = {
      #vimtex = {
      #  package = pkgs.vimPlugins.vimtex;
      #  ft = ["tex" "plaintex" "bib"];
      #};

      #zotcite = {
      #  package = pkgs.vimPlugins.zotcite;
      #  ft = zotciteFiletypes;
      #  setupModule = "zotcite";
      #  setupOpts = {};
      #  after = ''
      #    pcall(function()
      #      require("telescope").load_extension("zotcite")
      #    end)
      #  '';
      #};

      #"plenary.nvim" = {
      #  package = pkgs.vimPlugins.plenary-nvim;
      #  lazy = false;
      #};

      #"vim-pencil" = {
      #  package = pkgs.vimPlugins.vim-pencil;
      #  ft = ["markdown" "tex" "text"];
      #  after = ''
      #    vim.g["pencil#wrapModeDefault"] = "soft"
      #  '';
      #};

      #"nvim-bqf" = {
      #  package = pkgs.vimPlugins.nvim-bqf;
      #  ft = ["qf"];
      #  setupModule = "bqf";
      #  setupOpts = {};
      #};

      #"dial.nvim" = {
      #  package = pkgs.vimPlugins.dial-nvim;
      #  event = ["BufReadPost" "BufNewFile"];
      #};
    #};
  };
}
