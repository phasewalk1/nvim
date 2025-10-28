(lambda config []
  {:lazy nil
   :dependencies [:MunifTanjim/nui.nvim :nvim-lua/plenary.nvim]
   :config 
   (fn []
     (local neotree (require "neo-tree"))
     ((. neotree :setup) 
      {:filesystem {:hijack_netrw_behavior "open_current"}})
     (vim.keymap.set "n" "<leader>e" ":Neotree toggle <CR>" 
	{:desc "Neotree toggle"}))})

(config)

