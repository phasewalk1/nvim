;; Table for plugins
(local plugins {})

;; Add a plugin to the table
(lambda plug! [identifier opts]
  (if (= opts {})
    (table.insert plugins identifier)
    (do
      (let [plugin-spec {}]
        (table.insert plugin-spec identifier)
        (each [k v (pairs opts)]
          (tset plugin-spec k v))
        (table.insert plugins plugin-spec)))))

(local editor
  {:nvim-telescope/telescope.nvim              (require :configs.editor.telescope)
   :nvim-neo-tree/neo-tree.nvim                (require :configs.editor.neotree)
   :windwp/nvim-autopairs                      (require :configs.editor.autopair)
   :gpanders/nvim-parinfer                     {}
   :folke/which-key.nvim                       (require :mappings)
   :mrjones2014/legendary.nvim                 (require :configs.editor.legendary)
   :akinsho/toggleterm.nvim                    (require :configs.editor.toggleterm)
   :gelguy/wilder.nvim                         (require :configs.editor.commands.wilder)
   :liuchengxu/vista.vim                       (require :configs.ui.vista)
   :ellisonleao/glow.nvim                      {:lazy false :config true :cmd "Glow"}})

(local completions
  {:github/copilot.vim                         {:lazy false}
   :hrsh7th/cmp-nvim-lsp                       {}
   :L3MON4D3/LuaSnip                           (require :configs.editor.completions.luasnip)
   :hrsh7th/nvim-cmp                           (require :configs.editor.completions.nvim-cmp)})

(local tooling
  {:williamboman/mason.nvim                    (require :configs.tools.mason)
   :nvim-treesitter/nvim-treesitter            (require :configs.lang.treesitter)
   :neovim/nvim-lspconfig                      (require :configs.lang.lsp)
   :williamboman/mason-lspconfig.nvim          (require :configs.tools.mason-lspconfig)
   :nvimtools/none-ls.nvim                     (require :configs.tools.none-ls)
   :neogitorg/neogit                           (require :configs.tools.neogit)})

(local lang
  ;; Rust
  {:saecki/crates.nvim                         (require :configs.lang.rust.crates)})

(local ui
  {:nvim-lualine/lualine.nvim                  (require :configs.ui.lualine)
   :b0o/incline.nvim                           (require :configs.ui.incline)
   :glepnir/dashboard-nvim                     (require :configs.ui.dash)
   :folke/noice.nvim                           (require :configs.ui.noice)
   :utilyre/barbecue.nvim                      (require :configs.ui.barbecue)
   :RRethy/vim-illuminate                      (require :configs.ui.illuminate)})

(local themes
  {:zaldih/themery.nvim                        (require :configs.ui.themery)
   :lunacookies/vim-colors-xcode               {:lazy true}
   :everblush/nvim                             {:lazy true}
   :catppuccin/nvim                            {:lazy false :name :catppuccin}
   :kjssad/quantum.vim                         {:lazy true}
   :nyoom-engineering/oxocarbon.nvim           {:lazy true}
   :NTBBloodbath/doom-one.nvim                 {:lazy true}})

(lambda load-plugins! [module]
  (each [k v (pairs module)]
   (plug! k v)))

(load-plugins! tooling)
(load-plugins! completions)
(load-plugins! editor)
(load-plugins! ui)
(load-plugins! themes)
(load-plugins! lang)

;; Export the plugins
plugins
