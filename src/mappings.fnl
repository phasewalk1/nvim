(lambda mapping! [mode keys cmd opts]
  (vim.keymap.set mode keys cmd opts))

(mapping! "n" ";f" "<cmd>Telescope find_files<CR>" {})
(mapping! "n" ";w" "<cmd>Telescope live_grep<CR>" {})
(mapping! "n" ";x" "<cmd>Telescope commands<CR>" {})

(mapping! "n" "<leader>th" "<cmd>Themery<cr>" {})

(mapping! "n" "<leader>bk" "<cmd>bd<cr>" 
  {:noremap true
   :silent true})
(mapping! "n" "<leader>bl" "<cmd>ls<cr>" {})
(mapping! "n" "<leader>bn" "<cmd>bn<cr>" {})
(mapping! "n" "<leader>bp" "<cmd>bp<cr>" {})
(mapping! "n" "<leader>bf" "<cmd>Telescope buffers<cr>" {})

(mapping! "n" "<leader>ch" "<cmd>Legendary keymaps<cr>" {})

(local buffers-mappings!
  {:b
    :name "Buffers"
    {:k {:<cmd>bd<CR> "Kill buffer"}}
    {:l {:<cmd>ls<CR> "List buffers"}}
    {:n {:<cmd>bn<CR> "Next buffer"}}
    {:p {:<cmd>bp<CR> "Previous buffer"}}
    {:f {"<cmd>Telescope buffers<CR>" "Find buffer"}}})

(local telescope-mappings!
  {";"
    :name "Telescope"
    {:f {"<cmd>Telescope find_files<CR>" "Find Files"}}
    {:w {"<cmd>Telescope live_grep<CR>" "Live Grep"}}
    {:b {"<cmd>Telescope buffers<CR>" "Buffers"}}
    {:h {"<cmd>Telescope help_tags<CR>" "Help Tags"}}
    {:t {"<cmd>Telescope tags<CR>" "Tags"}}
    {:c {"<cmd>Telescope commands<CR>" "Commands"}}
    {:pl {"<cmd>Telescope planets<CR>" "Planets"}}})

;;(load-mappings! buffers-mappings!)
;;(load-mappings! telescope-mappings!)

(lambda wk-config-func [wk]
  (set vim.o.timeout true)
  (set vim.o.timeoutlen 300)
  (wk.register buffers-mappings!)
  (wk.register telescope-mappings!))

(lambda whichkey-config []
  {:event :VeryLazy
   :lazy false
   :opts {:mode :n
          :prefix ""
          :buffer nil
          :silent true
          :expr false}
   :init (fn []
          (local wk (require :which-key))
          (wk-config-func wk))})
              
(whichkey-config)
