return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/plugins/luasnip/" }),
  },
  opts = {
    history = false,
    enable_autosnippets = true,
    store_selection_keys = "<Tab>",
  },
  keys = {},
}

--TODO
--
-- add keymaps
