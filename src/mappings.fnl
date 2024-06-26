(lambda mapping! [mode keys cmd opts]
  (vim.keymap.set mode keys cmd opts))

;; --- Telescope ---
(mapping! "n" ";f" "<cmd>Telescope find_files<CR>" {})
(mapping! "n" ";w" "<cmd>Telescope live_grep<CR>" {})
(mapping! "n" ";x" "<cmd>Telescope commands<CR>" {})

;; --- Themery ---
(mapping! "n" "<leader>th" "<cmd>Themery<cr>" {})

;; --- Buffers ---
(mapping! "n" "<leader>bk" "<cmd>bd<cr>" 
  {:noremap true
   :silent true})
(mapping! "n" "<leader>bl" "<cmd>ls<cr>" {})
(mapping! "n" "<leader>bn" "<cmd>bn<cr>" {})
(mapping! "n" "<leader>bp" "<cmd>bp<cr>" {})
(mapping! "n" "<leader>bf" "<cmd>Telescope buffers<cr>" {})

;; --- Legendary ---
(mapping! "n" "<leader>ch" "<cmd>Legendary keymaps<cr>" {})

;; --- Git ---
(mapping! "n" "<leader>gg" "<cmd>Neogit<cr>" {})
(mapping! "n" "<leader>gd" "<cmd>DiffviewOpen<cr>" {})
(mapping! "n" "<leader>gl" "<cmd>Neogit log<cr>" {})
(mapping! "n" "<leader>gc" "<cmd>Telescope git_commits<cr>" {})

;; -- VimTex --
(mapping! "n" "<leader>zv" "<cmd>VimtexView<cr>" {})
(mapping! "n" "<leader>zb" "<cmd>VimtexCompile<cr>" {})

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
