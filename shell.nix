{ name }:
let
  project  = import ./release.nix { name = name; };
  devTools = with project.nixpkgs; [ cabal-install haskell-language-server ];
in
  project.env.overrideAttrs (oldEnv: { nativeBuildInputs = oldEnv.nativeBuildInputs ++ devTools; })
