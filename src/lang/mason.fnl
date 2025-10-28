(lambda mason-lspconfig-setup! []
  (let [mason-lspconfig (require "mason-lspconfig")]
    (mason-lspconfig.setup {:ensure_installed {:fennel-ls
			                       :rust_analyzer}})))

(lambda mason-setup! []
  {:config (fn []
	     (let [mason (require "mason")]
	       (mason.setup)
	       (mason-lspconfig-setup!)))})

(mason-setup!)
