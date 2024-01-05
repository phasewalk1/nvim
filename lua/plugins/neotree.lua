return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        hijack_netrw_behavior = "open_current",
      }
    })
    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', {})
  end
}
