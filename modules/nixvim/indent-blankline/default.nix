{...}: {
  config = {
    options = {
      list = true;
      listchars = "eol:↴,nbsp:↲,space: ,tab: ,trail:-";
    };

    plugins = {
      indent-blankline = {
        enable = true;

        scope = {
          enabled = true;
          showStart = true;
        };
        exclude = {
          buftypes = ["terminal" "nofile"];
          filetypes = ["help" "dashboard" "NvimTree" "Trouble"];
        };
      };
    };
  };
}
