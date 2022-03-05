{
  nixpkgs = builtins.fetchGit {
    url     = "https://github.com/NixOS/nixpkgs.git";
    rev     = "7e9b0dff974c89e070da1ad85713ff3c20b0ca97";
    ref     = "refs/tags/21.11";
    allRefs = true;
  };
}
