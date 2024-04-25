(lambda none-ls []
  {:lazy false
   :config
     (fn []
       (local null-ls (require :null-ls))
       (null-ls.setup {:sources 
                        [null-ls.builtins.formatting.stylua
                         null-ls.builtins.formatting.prettier
                         null-ls.builtins.completion.spell]})
       (vim.keymap.set :n :<leader>hf vim.lsp.buf.format {})
       (vim.keymap.set :n :<leader>ca vim.lsp.buf.code_action {}))})


(none-ls)
  
