{
  lib,
  pkgs,
  ...
}:
with lib.plusultra;
with lib.plusultra.theme.nord; {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "dbsession.nvim";
      version = "unstable-2023-06-28";
      src = pkgs.fetchFromGitHub {
        owner = "nvimdev";
        repo = "dbsession.nvim";
        rev = "63df28409d940f9cac0a925df09d3dc369db9841";
        sha256 = "0731yc308jhqwpgabdb69mz8wi75rbnlwa2rh25rrigr28hxin1c";
      };
    })
  ];

  extraConfigLua = ''
    require("dbsession").setup {
      dir = os.getenv("HOME") .. "/.config/dashboard-nvim",
      auto_save_on_exit = false,
    }
  '';

  highlight = {
    DashboardShortCut = {
      fg = nord3;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ss";
      action = "<cmd>SessionSave<cr>";
      options = {
        silent = true;
        desc = "Save session";
      };
    }
    {
      mode = "n";
      key = "<leader>sl";
      action = "<cmd>SessionLoad<cr>";
      options = {
        silent = true;
        desc = "Load session";
      };
    }
  ];

  plugins = {
    dashboard = {
      enable = true;

      theme = "hyper";
      disableMove = true;
      changeToVcsRoot = true;

      packages.enable = false;
      week_header.enable = true;

      hide = {
        statusline = true;
        tabline = true;
        winbar = true;
      };

      project = {
        enable = true;
        icon = "󰉋 ";
        label = "Projects";
        limit = 8;
        action = "e ";
      };

      mru = {
        icon = " ";
        label = "Recent Files";
        limit = 10;
      };

      shortcut = [
        {
          icon = " ";
          desc = "Open File ";
          key = "f";
          action = "Telescope find_files";
        }
        {
          icon = " ";
          desc = "Open Recent ";
          key = "r";
          action = "Telescope oldfiles";
        }
        {
          icon = " ";
          desc = "Open Config ";
          key = "c";
          action = "e $HOME/devland/config";
        }
      ];
    };
  };
}
