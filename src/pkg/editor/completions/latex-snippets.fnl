(local mod {})

(lambda repo []
  :iurimateus/luasnip-latex-snippets.nvim)

(lambda config []
  {:lazy false
   :requires [:L3M0N4D3/LuaSnip :lervag/vimtex]
   :config (fn []
             ((. (require :luasnip-latex-snippets) :setup))
             ((. (require :luasnip) :config :setup) {:enable_autosnippets true}))})

(set mod.config config)
(set mod.repo repo)
mod
