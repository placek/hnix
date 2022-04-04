{
  nixpkgs = builtins.fetchGit {
    url     = "https://github.com/NixOS/nixpkgs.git";
    rev     = "a1a6472993e44c44c437f6b5004e53289bc8399c";
    ref     = "refs/tags/21.11";
    allRefs = true;
  };
}
