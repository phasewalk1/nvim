(local plugins {})

;;; --------------- BEGIN MODULES DEFINITION -------------------------------------

;;; ==============================================================================
;;; Editor Tooling 
;;; ==============================================================================

(local editor
  {:nvim-neo-tree/neo-tree.nvim      (require :editor.neotree)
   :windwp/nvim-autopairs            (require :editor.autopairs)
   :nvim-telescope/telescope.nvim    (require :editor.telescope)
   :folke/trouble.nvim               (require :editor.trouble)
   :liuchengxu/vista.vim             (require :editor.vista)
   :folke/which-key.nvim             (require :editor.which-key)})

;;; ==============================================================================
;;; Language Tooling 
;;; ==============================================================================

(local lang
  {:nvim-treesitter/nvim-treesitter  (require :lang.treesitter)
   :neovim/nvim-lspconfig            (require :lang.nvim-lspconfig)
   :williamboman/mason.nvim          (require :lang.mason)
   :mason-org/mason-lspconfig.nvim   {}
   :stevearc/conform.nvim            (require :lang.conform)
   ;;:olical/conjure                   {}
   :olical/nfnl                      {:ft :fennel}
   ;; Completions
   :hrsh7th/nvim-cmp                 (require :lang.completions.nvim-cmp)
   :hrsh7th/cmp-nvim-lsp             {}
   :l3mon4d3/luasnip                 (require :lang.completions.luasnip)
   :lervag/vimtex		     (require :lang.vimtex)
   :github/copilot.vim              {}})

;;; ==============================================================================
;;; UI Elements
;;; ==============================================================================

(local ui
  {:glepnir/dashboard-nvim           (require :ui.dash)
   :folke/noice.nvim                 (require :ui.noice)
   :nvim-lualine/lualine.nvim        (require :ui.lualine)})

;;; ==============================================================================
;;; Colorschemes
;;; ==============================================================================

(local colorschemes
  {:zaldih/themery.nvim              (require :ui.themery)
   :ntbbloodbath/doom-one.nvim       {:lazy true}
   :nyoom-engineering/oxocarbon.nvim {:lazy true}
   :edeneast/nightfox.nvim           {:lazy true}
   :shadorain/shadotheme             {:lazy true}
   :navarasu/onedark.nvim            (require :ui.onedark)})

;;; --------------- END MODULES DEFINITION -----------------------------

(lambda plug! [identifier opts]
  (if (= opts {})
      (table.insert plugins identifier)
        (let [plugin-spec {}]
          (table.insert plugin-spec identifier)
          (each [k v (pairs opts)]
            (tset plugin-spec k v))
          (table.insert plugins plugin-spec))))

(lambda pack! [pkg]
  (each [k v (pairs pkg)]
    (plug! k v)))

(pack! editor)
(pack! ui)
(pack! colorschemes)
(pack! lang)

plugins
