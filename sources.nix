let
  sources_json = ../sources.json;
  nixpkgs = if builtins.pathExists sources_json
            then builtins.fetchGit (builtins.fromJSON (builtins.readFile sources_json))
            else <nixpkgs>;
in
  {
    inherit nixpkgs;
  }
