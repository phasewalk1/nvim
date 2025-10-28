(lambda group! [wk top-level name]
  (wk.add {1 top-level :group name}))

(lambda which-key-config! []
  {:event :VeryLazy
   :opts {}
   :config (lambda []
	     (local wk (require :which-key))
	     (group! wk :<leader>b :Buffers)
	     (group! wk :<leader>d :Diagnostics)
	     (group! wk ";" :Telescope))
   :keys 
     {:<leader>? (lambda []
		       (local wk (require :which-key))
		       (wk.show {:global false}))}})

(which-key-config!)
