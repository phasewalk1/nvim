(lambda guts-header-hydra []
 ["⠄⠄⣴⣶⣤⡤⠦⣤⣀⣤⠆⠄⠄⠄⠄⠄⣈⣭⣭⣿⣶⣿⣦⣼⣆⠄⠄⠄⠄⠄⠄⠄⠄"
  "⠄⠄⠄⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦⠄⠄⠄⠄⠄⠄"
  "⠄⠄⠄⠄⠄⠈⠄⠄⠄⠈⢿⣿⣟⠦⠄⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄⠄⠄⠄⠄"
  "⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣸⣿⣿⢧⠄⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄⠄⠄⠄"
  "⠄⠄⢀⠄⠄⠄⠄⠄⠄⢠⣿⣿⣿⠈⠄⠄⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀⠄⠄"
  "⠄⠄⢠⣧⣶⣥⡤⢄⠄⣸⣿⣿⠘⠄⠄⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄⠄"
  "⠄⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷⠄⠄⠄⢊⣿⣿⡏⠄⠄⢸⣿⣿⡇⠄⢀⣠⣄⣾⠄⠄⠄"
  "⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀⠄⢸⢿⣿⣿⣄⠄⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄⠄"
  "⠙⠃⠄⠄⠄⣼⣿⡟⠌⠄⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿⠐⣿⣿⡇⠄⠛⠻⢷⣄"
  "⠄⠄⠄⠄⠄⢻⣿⣿⣄⠄⠄⠄⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟⠄⠫⢿⣿⡆⠄⠄⠄⠁"
  "⠄⠄⠄⠄⠄⠄⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃⠄⠄⠄⠄"])

(lambda guts-shortcut []
    [{:action "Lazy profile"
      :desc "󰲽 Profile"
      :group "@property"
      :key :pf}
     {:action "Lazy update"
      :desc "󰊳 Update"
      :group :Label
      :key :up}
     {:action :Mason
      :desc "󰏔 Dependencies"
      :group "@property"
      :key :ma}
     {:action "Telescope find_files"
      :desc "Find File"
      :icon " "
      :key ";f"}
     {:action "Telescope live_grep"
      :desc "Ripgrep (Find Word)"
      :icon "󱈄 "
      :key ";w"}
     {:action "Telescope planets show_moon=true, show_pluto=true"
      :desc "󱍊 Surprise!"
      :key :pl}])

(lambda guts-footer []
  [""
   ""
   "With software there are only two possibilities: either the user controls"
   "the [program], or the [program] controls the user."])

(lambda make-guts []
    (local guts {:config {:footer (guts-footer)
                          :header (guts-header-hydra)
                          :shortcut (guts-shortcut)}
                 :theme :hyper})
    guts)

(lambda dash-opts []
  {:event "VimEnter"
   :config (fn []
             (local dashboard (require :dashboard))
             (local guts (make-guts))
             (dashboard.setup guts))
   :dependencies [ :nvim-tree/nvim-web-devicons]})

(dash-opts)

