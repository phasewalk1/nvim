(local mod {})

(local binds!
  {:<leader>g
    {:name :+git
        :g ["<cmd>Neogit<cr>" "Open Neogit"]
        :d ["<cmd>DiffviewOpen<cr>" "Open Diffview"]
        :l ["<cmd>Neogit log<cr>" "git log"]
        :s ["<cmd>Telescope git_status<cr>" "git status"]}})

(lambda config []
  {:dependencies [:nvim-lua/plenary.nvim
                  :sindrets/diffview.nvim
                  :nvim-telescope/telescope.nvim]
   :config true})

(set mod.config config)
(set mod.bind binds!)
mod
