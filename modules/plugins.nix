{ config, lib, pkgs, ... }:

{
  imports = [
                #./tinymist.nix
  ];
  config.vim = {
    #statusline.lualine.enable = true;
    #telescope.enable = true;
    #autocomplete.nvim-cmp.enable = true;
    #binds.whichKey.enable = true;
    #git = {
    #    enable = true;
    #    gitsigns.enable = true;
    #};
    #comments.comment-nvim.enable = true;
    #formatter.conform-nvim.enable = true;
    #diagnostics.nvim-lint.enable = true;
    utility.surround.enable = true;
    #notes.obsidian = {
    #  enable = true;
    #  setupOpts.workspaces = [
    #    {
    #      name = "notes";
    #      path = "/home/johann/Projects/anvim";
    #    }
    #  ];
    #};
    notes.todo-comments.enable = true;
    utility.preview.glow.enable = true;
    snippets.luasnip.enable = true;
    autopairs.nvim-autopairs.enable = true;
    #tinymist.enable = true;
  };
}
