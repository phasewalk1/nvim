(lambda nvim-cmp-setup! []
  {:lazy nil
   :dependencies [:hrsh7th/cmp-cmdline
		  :hrsh7th/cmp-buffer
		  :onsails/lspkind.nvim
		  :js-everts/cmp-tailwind-colors]
   :config (lambda []
	     (local cmp (require :cmp))
	     (local lspkind (require :lspkind))
	     ((. (require :luasnip.loaders.from_vscode) :lazy_load))
	     (cmp.setup {:mapping  {:<Cr> (cmp.mapping (cmp.mapping.confirm 
				        {:select true
					 :behavior cmp.ConfirmBehavior.Insert}))
				    :<Tab> (cmp.mapping.select_next_item
				        {:behavior cmp.ConfirmBehavior.Insert})
				    :<S-Tab> (cmp.mapping.select_prev_item
					{:behavior cmp.ConfirmBehavior.Insert})}
			 :snippet {:expand (lambda [args]
					     ((. (require :luasnip) :lsp_expand) args.body))}
			 :sources (cmp.config.sources [{:name :luasnip
							:name :nvim_lsp}]
						      [{:name :buffer}])
			 :window {:completion (cmp.config.window.bordered)
			          :documentation (cmp.config.window.bordered)}
		         :formatting {:format (lspkind.cmp_format
						{:ellipsis_char "..."
						:mode :symbol_text})}})
	     (cmp.setup.cmdline ["/" "?"]
				{:mapping (cmp.mapping.preset.cmdline)
				 :sources [{:name :buffer}]})
	     (cmp.setup.cmdline ":"
				{:mapping (cmp.mapping.preset.cmdline)
				 :sources (cmp.config.sources
					    [{:name :path}]
                                            [{:name :cmdline}])})

	     (local capabilities ((. (require :cmp_nvim_lsp) :default_capabilities)))
             ((. (. (require :lspconfig) :lua_ls) :setup) {: capabilities})
             ((. (. (require :lspconfig) :rust_analyzer) :setup) {: capabilities})
             ((. (. (require :lspconfig) :pyright) :setup) {: capabilities})
	     ((. (. (require :lspconfig) :hls) :setup) {: capabilities})
             ((. (. (require :lspconfig) :ts_ls) :setup) {: capabilities})
             ((. (. (require :lspconfig) :fennel_ls) :setup) {: capabilities})
             ((. (. (require :lspconfig) :clangd) :setup) {: capabilities}))})

(nvim-cmp-setup!)
