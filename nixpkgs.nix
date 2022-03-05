args@{ ... }:
let
  sources = import ./../sources.nix;
  nixpkgs = import sources.nixpkgs args;
in
  nixpkgs
