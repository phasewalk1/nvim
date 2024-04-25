[{1 :hrsh7th/nvim-cmp
  :config (fn []
            (local cmp (require :cmp))
            ((. (require :luasnip.loaders.from_vscode) :lazy_load))
            (cmp.setup {:mapping (cmp.mapping.preset.insert {:<C-Space> (cmp.mapping.complete)
                                                             :<C-b> (cmp.mapping.scroll_docs (- 4))
                                                             :<C-e> (cmp.mapping.abort)
                                                             :<C-f> (cmp.mapping.scroll_docs 4)
                                                             :<CR> (cmp.mapping.confirm {:select true})})
                        :snippet {:expand (fn [args]
                                            ((. (require :luasnip) :lsp_expand) args.body))}
                        :sources (cmp.config.sources [{:name :luasnip}
                                                      {:name :nvim_lsp}]
                                                     [{:name :buffer}])
                        :window {:completion (cmp.config.window.bordered)
                                 :documentation (cmp.config.window.bordered)}})
            (cmp.setup.filetype :gitcommit
                                {:sources (cmp.config.sources [{:name :git}]
                                                              [{:name :buffer}])})
            (cmp.setup.cmdline ["/" "?"]
                               {:mapping (cmp.mapping.preset.cmdline)
                                :sources [{:name :buffer}]})
            (cmp.setup.cmdline ":"
                               {:mapping (cmp.mapping.preset.cmdline)
                                :sources (cmp.config.sources [{:name :path}]
                                                             [{:name :cmdline}])})
            (local capabilities
                   ((. (require :cmp_nvim_lsp) :default_capabilities)))
            ((. (. (require :lspconfig) :lua_ls) :setup) {: capabilities})
            ((. (. (require :lspconfig) :rust_analyzer) :setup) {: capabilities})
            ((. (. (require :lspconfig) :ruff) :setup) {: capabilities})
            ((. (. (require :lspconfig) :bufls) :setup)
             {: capabilities
              :cmd [:bufls :--offset-encoding=utf-16]})
            ((. (. (require :lspconfig) :tsserver) :setup) {: capabilities})
            ((. (. (require :lspconfig) :fennel_language_server) :setup) {: capabilities})
            ((. (. (require :lspconfig) :clangd) :setup) {: capabilities}))
  :lazy false
  :dependencies [:hrsh7th/cmp-cmdline
                 :hrsh7th/cmp-buffer]}]  
