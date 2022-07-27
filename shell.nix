{ name, devTools ? ({ pkgs }:[]) }:
let
  project    = import ./release.nix { name = name; };
  basicTools = with project.nixpkgs; [ cabal-install haskell-language-server hlint ];
  tools      = devTools { pkgs = project.nixpkgs; };
in
  project.env.overrideAttrs (oldEnv: {
    nativeBuildInputs = oldEnv.nativeBuildInputs ++ basicTools ++ tools;
  })
