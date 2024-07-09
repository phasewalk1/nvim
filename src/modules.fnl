;; Table for plugins
(local plugins {})

;; ----------------- Editor ---------------------
(local editor
  {:nvim-telescope/telescope.nvim              (require :module.editor.telescope)
   :nvim-neo-tree/neo-tree.nvim                (require :module.editor.neotree)
   :windwp/nvim-autopairs                      (require :module.editor.autopair)
   :folke/which-key.nvim                       (require :bindings)
   :mrjones2014/legendary.nvim                 (require :module.editor.legendary)
   :akinsho/toggleterm.nvim                    (require :module.editor.toggleterm)
   :gelguy/wilder.nvim                         (require :module.editor.commands.wilder)
   :liuchengxu/vista.vim                       {:lazy false}
   :ellisonleao/glow.nvim                      {:lazy false :config true :cmd "Glow"}
   :folke/trouble.nvim                         {}
   :gpanders/nvim-parinfer                     {}})

;; ----------------- Completions -----------------
(local completions
  {:github/copilot.vim                         {:lazy false}
   :L3MON4D3/LuaSnip                           (require :module.editor.completions.luasnip)
   :hrsh7th/nvim-cmp                           (require :module.editor.completions.nvim-cmp)
   :hrsh7th/cmp-nvim-lsp                       {}})

;; ----------------- Tooling ---------------------
(local tooling
  {:williamboman/mason.nvim                    (require :module.tools.mason)
   :nvim-treesitter/nvim-treesitter            (require :module.lang.treesitter)
   :neovim/nvim-lspconfig                      (require :module.lang.lsp)
   :williamboman/mason-lspconfig.nvim          (require :module.tools.mason-lspconfig)
   :nvimtools/none-ls.nvim                     (require :module.tools.none-ls)
   :neogitorg/neogit                           (require :module.tools.neogit)
   :lervag/vimtex                              (require :module.tools.tex)
   :saecki/crates.nvim                         (require :module.lang.rust.crates)})

;; ----------------- UI Elements -----------------
(local elements
  {:nvim-lualine/lualine.nvim                  (require :module.ui.lualine)
   :b0o/incline.nvim                           (require :module.ui.incline)
   :glepnir/dashboard-nvim                     (require :module.ui.dash)
   :folke/noice.nvim                           (require :module.ui.noice)
   :utilyre/barbecue.nvim                      (require :module.ui.barbecue)
   :RRethy/vim-illuminate                      (require :module.ui.illuminate)
   :xiyaowong/transparent.nvim                 {:lazy false}})

;; ------------------ Themes ---------------------
(local themes
  {:zaldih/themery.nvim                        (require :module.ui.themery)
   :lunacookies/vim-colors-xcode               {:lazy true}
   :everblush/nvim                             {:lazy true}
   :catppuccin/nvim                            {:lazy false :name :catppuccin}
   :kjssad/quantum.vim                         {:lazy true}
   :nyoom-engineering/oxocarbon.nvim           {:lazy true}
   :NTBBloodbath/doom-one.nvim                 {:lazy true}})

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

;; Pack a module into the plugins table
(lambda pack! [module]
  (each [k v (pairs module)]
   (plug! k v)))

(pack! tooling)
(pack! completions)
(pack! editor)
(pack! elements)
(pack! themes)

;; Export the plugins
plugins
