(local buffers (require :buffers))
(local neogit (require :pkg.tools.neogit))
(local telescope (require :pkg.editor.telescope))

;; Initializes which-key
(lambda init! [wk]
  (set vim.o.timeout true)
  (set vim.o.timeoutlen 300)
  (wk.register buffers.bind)    ;; buffer keybindings
  (wk.register neogit.bind)     ;; neogit keybindings
  (wk.register telescope.bind)) ;; telescope keybindings

;; Configures which-key
(lambda wk-config []
  {:event :VeryLazy
   :lazy false
   :init (fn []
          (local wk (require :which-key))
          (init! wk))})
              
(wk-config)
