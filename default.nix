{ stdenvNoCC, lib, luaPackages, gnumake }:

stdenvNoCC.mkDerivation {
  pname = "phasewalk-nvim";
  version = "local";

  # cleanSource strips .git, editor backups, result symlinks, etc.
  # so a `git status` change doesn't invalidate the Nix store path.
  src = lib.cleanSource ./.;

  nativeBuildInputs = [ luaPackages.fennel gnumake ];

  buildPhase = ''
    runHook preBuild
    # Wipe build artifacts and the cached init.lua so make doesn't get
    # tripped up by stale mtimes from a previous local `make` run.
    make clean || true
    rm -f init.lua
    make
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    install -Dm644 init.lua $out/init.lua
    cp -r build $out/build
    [ -d after ] && cp -r after $out/after
    if [ ! -f $out/build/theme.lua ]; then
      cat > $out/build/theme.lua <<'EOF'
-- Themery block
-- This block will be replaced by Themery.
vim.cmd("colorscheme onedark")
vim.g.theme_id = 6
-- end themery block
EOF
    fi
    runHook postInstall
  '';

  meta = with lib; {
    description = "phasewalk1's Neovim configuration";
    license = licenses.unlicense;
    platforms = platforms.unix;
  };
}
