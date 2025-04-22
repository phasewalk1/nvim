(lambda navic-config []
  {:config (fn []
              (local navic (require :nvim-navic))
              ((. (require :lspconfig) :clangd :setup)
               {:on_attach (fn [client bufnr]
                             (navic.attach client bufnr))}))
   :lazy false})
(navic-config)
