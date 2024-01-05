return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons"
  },
  {
    "b0o/incline.nvim",
    lazy = false,
    config = function()
      require("incline").setup({
        debounce_threshold = {
          falling = 50,
          rising = 10,
        },
        hide = {
          cursorline = false,
          focused_win = false,
          only_win = false,
        },
        highlight = {
          groups = {
            InclineNormal = {
              default = true,
              group = "NormalFloat",
            },
            InclineNormalNC = {
              default = true,
              group = "NormalFloat",
            },
          },
        },
        ignore = {
          buftypes = "special",
          filetypes = {},
          floating_wins = true,
          unlisted_buffers = true,
          wintypes = "special",
        },
        render = "basic",
        window = {
          margin = {
            horizontal = 1,
            vertical = 1,
          },
          options = {
            signcolumn = "no",
            wrap = false,
          },
          padding = 1,
          padding_char = " ",
          placement = {
            horizontal = "right",
            vertical = "top",
          },
          width = "fit",
          winhighlight = {
            active = {
              EndOfBuffer = "None",
              Normal = "InclineNormal",
              Search = "None",
            },
            inactive = {
              EndOfBuffer = "None",
              Normal = "InclineNormalNC",
              Search = "None",
            },
          },
          zindex = 50,
        },
      })
    end,
  },
  {
    "goolord/alpha-nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  },
  -- Noice UI Elements
  {
    "folke/noice.nvim",
    lazy = true,
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      opts.presets.lsp_doc_border = true
    end,
  },
  -- Notifications
  {
    "rcarriga/nvim-notify",
    lazy = true,
    opts = {
      timeout = 3000,
    },
  },
  -- Status Line
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    opts = {
      options = {
        theme = "everforest",
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
