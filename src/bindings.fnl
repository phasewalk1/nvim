(lambda bind! [mode keys cmd opts]
  (vim.keymap.set mode keys cmd opts))

;; Telescope
(bind! "n" ";f" "<cmd>Telescope find_files<cr>" {})
(bind! "n" ";w" "<cmd>Telescope live_grep<cr>" {})
;; Trouble 
(bind! "n" "<leader>dt" "<cmd>Trouble diagnostics toggle<cr>" {})
;; Themery
(bind! "n" "<leader>th" "<cmd>Themery<cr>" {})
;; Clear search highlights
(bind! "n" "<leader>h" "<cmd>noh<cr>" 
  {:desc "Clear search highlights"})
;; Buffers
(bind! "n" "<leader>bp" "<cmd>bprevious<cr>" 
  {:desc "Previous buffer"}) 
(bind! "n" "<leader>bn" "<cmd>bnext<cr>" 
  {:desc "Next buffer"}) 
;; Vista
(bind! "n" "<leader>v" "<cmd>Vista<cr>"
  {:desc "Vista toggle"})

