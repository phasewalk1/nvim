return {
  {
    "sainnhe/everforest",
    lazy = true,
  },
  {
    "Th3Whit3Wolf/space-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "space-nvim"
    end
  },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = true,
  },
}
