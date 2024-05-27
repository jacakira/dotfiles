if true then
  return {}
end

return {
  "f-person/auto-dark-mode.nvim",
  config = {
    update_interval = 10,
    set_dark_mode = function()
      vim.api.nvim_set_option("background", "dark")
      vim.cmd("colorscheme rose-pine-moon")
    end,
    set_light_mode = function()
      vim.api.nvim_set_option("background", "light")
      vim.cmd("colorscheme rose-pine-dawn")
    end,
  },
}
