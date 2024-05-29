return {
  "rafamadriz/friendly-snippets",
  config = function()
    -- Load friendly snippets for all filetypes except LaTeX
    require("luasnip.loaders.from_vscode").lazy_load({
      exclude = { "tex" },
    })
  end,
}
