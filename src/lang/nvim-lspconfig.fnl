(lambda bootstrap-lsp-opts []
  {:config (fn []
	     (vim.lsp.enable "fennel_ls")
	     (vim.lsp.enable "haskell-language-server")
	     (vim.lsp.enable "rust_analyzer"))})

(bootstrap-lsp-opts)
