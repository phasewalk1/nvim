;; Any amt of args.
;; (vim! . arg1 . arg2 ... argN)
;; Example:
;;    1. (vim! :api :nvim_create_autocmd :ColorScheme {})
;;           == (vim.api.nvim_create_autocmd :ColorScheme {})
;;    
