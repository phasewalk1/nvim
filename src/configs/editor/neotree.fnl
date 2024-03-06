(lambda neotree-config []
  {:lazy false
   :dependencies [:MunifTanjim/nui.nvim]
   :config 
   (fn []
     (local neotree (require "neo-tree"))
     ((. neotree :setup) 
       {:filesystem {:hijack_netrw_behavior "open_current"}})
     (vim.keymap.set "n" "<leader>e" ":Neotree toggle <CR>" {}))})

(neotree-config)
