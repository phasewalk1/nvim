(lambda mason-lspconfig-cfg []
  {:lazy false
   :config (fn []
            ((. (require :mason-lspconfig) :setup) {:ensure_installed [:lua_ls
                                                                       :rust_analyzer
                                                                       :pyre
                                                                       :biome
                                                                       :gopls
                                                                       :clangd
                                                                       :fennel_language_server
                                                                       :bufls]}))})

(mason-lspconfig-cfg)
