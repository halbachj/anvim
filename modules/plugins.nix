{ config, lib, pkgs, ... }:

let
  cfg = config.anvim.obsidian;
in
{
  imports = [
                #./tinymist.nix
  ];

  options.anvim.obsidian.workspacePath = lib.mkOption {
    type = lib.types.nullOr lib.types.str;
    default = null;
    example = "/home/alice/Notes";
    description = "Absolute path to the Obsidian workspace; when null, Obsidian is disabled.";
  };

  config = lib.mkMerge [
    {
      vim = {
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        binds.whichKey.enable = true;
        #git = {
        #    enable = true;
        #    gitsigns.enable = true;
        #};
        comments.comment-nvim.enable = true;
        formatter.conform-nvim.enable = true;
        diagnostics.nvim-lint.enable = true;
        utility.surround.enable = true;
        notes.todo-comments.enable = true;
        utility.preview.glow.enable = true;
        snippets.luasnip.enable = true;
        autopairs.nvim-autopairs.enable = true;
        #tinymist.enable = true;
      };
    }
    (lib.mkIf (cfg.workspacePath != null) {
      vim.notes.obsidian = {
        enable = true;
        setupOpts.workspaces = [
          {
            name = "notes";
            path = cfg.workspacePath;
          }
        ];
      };
    })
  ];
}
