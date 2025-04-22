;; Table for plugins
(local plugins {})

;; ----------------- Editor ---------------------
(local editor
  {:nvim-telescope/telescope.nvim              (require :pkg.editor.telescope)
   :nvim-neo-tree/neo-tree.nvim                (require :pkg.editor.neotree)
   :windwp/nvim-autopairs                      (require :pkg.editor.autopair)
   :folke/which-key.nvim                       (require :bindings)
   :mrjones2014/legendary.nvim                 (require :pkg.editor.legendary)
   :akinsho/toggleterm.nvim                    (require :pkg.editor.toggleterm)
   :gelguy/wilder.nvim                         (require :pkg.editor.commands.wilder)
   :liuchengxu/vista.vim                       {:lazy false}
   :ellisonleao/glow.nvim                      {:lazy false :config true :cmd "Glow"}
   :nvim-neorg/neorg                           (require :pkg.editor.neorg)
   :folke/trouble.nvim                         {}
   :evesdropper/luasnip-latex-snippets.nvim    {}
   :gpanders/nvim-parinfer                     {}})

;; evesdropper/luasnip-latex-snippets.nvim

;; ----------------- Completions -----------------
(local completions
  {:github/copilot.vim                         {:lazy false}
   :L3MON4D3/LuaSnip                           (require :pkg.editor.completions.luasnip)
   :hrsh7th/nvim-cmp                           (require :pkg.editor.completions.nvim-cmp)
   :hrsh7th/cmp-nvim-lsp                       {}
   :iurimateus/luasnip-latex-snippets.nvim     (require :pkg.editor.completions.latex-snippets)})

;; ----------------- Tooling ---------------------
(local tooling
  {:williamboman/mason.nvim                    (require :pkg.tools.mason)
   :nvim-treesitter/nvim-treesitter            (require :pkg.lang.treesitter)
   :neovim/nvim-lspconfig                      (require :pkg.lang.lsp)
   :williamboman/mason-lspconfig.nvim          (require :pkg.tools.mason-lspconfig)
   :nvimtools/none-ls.nvim                     (require :pkg.tools.none-ls)
   :neogitorg/neogit                           (require :pkg.tools.neogit)
   :lervag/vimtex                              (require :pkg.tools.tex)
   ;; :Olical/Conjure                             {}
   :saecki/crates.nvim                         (require :pkg.lang.rust.crates)})

;; ----------------- UI Elements -----------------
(local elements
  {:nvim-lualine/lualine.nvim                  (require :pkg.ui.lualine)
   :SmiteshP/nvim-navic                        (require :pkg.ui.navic)
   :glepnir/dashboard-nvim                     (require :pkg.ui.dash)
   :folke/noice.nvim                           (require :pkg.ui.noice)
   :RRethy/vim-illuminate                      (require :pkg.ui.illuminate)
   :willothy/nvim-cokeline                     (require :pkg.ui.cokeline)
   :mawkler/modicator.nvim                     (require :pkg.ui.modicator)
   :stevearc/dressing.nvim                     (require :pkg.ui.dressing)
   :xiyaowong/transparent.nvim                 {:lazy false}})

;; ------------------ Themes ---------------------
(local themes
  {:zaldih/themery.nvim                       (require :pkg.ui.themery)
   :lunacookies/vim-colors-xcode               {:lazy true}
   :everblush/nvim                             {:lazy true}
   :catppuccin/nvim                            {:lazy false :name :catppuccin}
   :kjssad/quantum.vim                         {:lazy true}
   :nyoom-engineering/oxocarbon.nvim           {:lazy true}
   :NTBBloodbath/doom-one.nvim                 {:lazy true}
   ;; :navarasu/onedark.nvim                      {:lazy false}
   :mawkler/onedark.nvim                       {:lazy false}
   :projekt0n/github-nvim-theme                {:lazy false}
   :olivercederborg/poimandres.nvim            {:lazy false}})
  

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

;; Pack a pkg into the plugins table
(lambda pack! [pkg]
  (each [k v (pairs pkg)]
   (plug! k v)))

(pack! tooling)
(pack! completions)
(pack! editor)
(pack! elements)
(pack! themes)

;; Export the plugins
plugins
