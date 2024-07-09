(local telescope-bindings
   [{1 ";f"
     2 ":Telescope find_files"
     :description "Find files"}
    {1 ";w"
     2 ":Telescope live_grep"
     :description "Find word"}])

(local git-bindings
   [{1 "<leader>gg"
     2 ":Neogit"
       :description "Open Neogit"}
    {1 "<leader>gd"
     2 ":DiffviewOpen"
       :description "Open diff view"}
    {1 "<leader>gl"
     2 ":Neogit log"
       :description "Open Neogit log"}])

(local buffer-bindings
   [{1 "<leader>bk"
     2 ":bd"
     :description "Close buffer"}
    {1 "<leader>bn"
     2 ":bn"
     :description "Next buffer"}
    {1 "<leader>bp"
     2 ":bp"
     :description "Previous buffer"}
    {1 "<leader>bl"
     2 ":Telescope buffers"
     :description "Pick buffer"}])

(lambda legendary []
  {:priority 10000
   :lazy false
   :config (fn []
              ((. (require :legendary) :setup)
               {:extensions.lazy_nvim {:auto_register true}
                :keymaps telescope-bindings}))})
                
   

(legendary)
