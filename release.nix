{ pkgs ? ./nixpkgs.nix, name }:
let
  nixpkgs = import pkgs {
    overlays = [
      (final: prev: {
        localHaskellPackages = final.haskellPackages.override (old: {
          overrides = final.lib.composeExtensions (old.overrides or (_: _: {})) haskellPkgsOverlay;
        });
      })
    ];
  };

  haskellPkgsOverlay = (final: prev: {
    project = final.callCabal2nix name ./.. {};
  });

  inherit (nixpkgs.localHaskellPackages) project;
in
  {
    inherit nixpkgs project;
    inherit (project) env;
  }
