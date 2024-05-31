return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/plugins/luasnip/" }),
  },
  opts = {
    history = false,
    enable_autosnippets = true,
    store_selection_keys = "<Tab>",
    update_events = "TextChanged, TextChangedI",
  },
  keys = {
    {
      "<tab>",
      function()
        return require("luasnip").expand_or_jumpable() and "<Plug>luasnip-expand-or-jump" or "<tab>"
      end,
      expr = true,
      silent = true,
      mode = "i",
    },
    {
      "<tab>",
      function()
        return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
      end,
      expr = true,
      silent = true,
      mode = "s",
    },
    {
      "<S-tab>",
      function()
        return require("luasnip").jumpable(-1) and "<Plug>luasnip-jump-prev" or "<S-tab>"
      end,
      expr = true,
      silent = true,
      mode = "i",
    },
    {
      "<S-tab>",
      function()
        return require("luasnip").jumpable(-1) and "<Plug>luasnip-jump-prev" or "<S-tab>"
      end,
      expr = true,
      silent = true,
      mode = "s",
    },
  },
}
