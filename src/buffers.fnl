(local mod {})

(local binds!
  {:<leader>b
    {:name :+buffers
        :p ["<cmd>bp<cr>" "Previous buffer"]
        :n ["<cmd>bn<cr>" "Next buffer"]
        :k ["<cmd>bd<cr>" "Kill buffer"]}})

(set mod.bind binds!)
mod
