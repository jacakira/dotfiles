return {
  "f-person/auto-dark-mode.nvim",
  config = {
    update_interval = 1000,
    set_dark_mode = function()
      vim.o.background = "dark" -- Sets the background to dark
      vim.cmd("colorscheme rose-pine-moon") -- Applies the dark colorscheme
    end,
    set_light_mode = function()
      vim.o.background = "light" -- Sets the background to light
      vim.cmd("colorscheme rose-pine-dawn") -- Applies the light colorscheme
    end,
  },
}
