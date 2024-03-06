(lambda fennel-lsp-opts []
  {:default_config {:cmd [:$HOME/.cargo/bin/fennel-language-server]
                    :filetypes [:fennel]
                    :singe_file_support true}})

(lambda bootstrap-lsp-opts []
  {:config (fn []
            (local lspconfig (require "lspconfig"))
            ((. lspconfig.pyre                   :setup) {})
            ((. lspconfig.biome                  :setup) {})
            ((. lspconfig.rust_analyzer          :setup) {})
            ((. lspconfig.lua_ls                 :setup) {})
            ((. lspconfig.fennel_language_server :setup) (fennel-lsp-opts))
            ((. lspconfig.clangd                 :setup) {})
            (vim.keymap.set "n" "K" vim.lsp.buf.hover {})
            (vim.keymap.set "n" "gd" vim.lsp.buf.definition {})
            (vim.keymap.set "n" "gD" vim.lsp.buf.declaration {})
            (vim.keymap.set "n" "gr" vim.lsp.buf.references {})
            (vim.keymap.set "n" "ca" vim.lsp.buf.code_action {}))
   :lazy false})


(bootstrap-lsp-opts)
