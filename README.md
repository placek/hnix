# hnix

Dummy, no-brainer configuration for pinning nixpkgs over caba2nix
for haskell startups.

### HowTo

Assuming you have a haskell project initialized in the monorepo, you can follow
the steps below.

Minimal requirements for the setup is to have a cabal file and haskell module,
like:

```cabal
cabal-version: 2.4
name:          foobar
version:       0.1.0.0

library
  exposed-modules: FooBar
  build-depends:   base >= 4 && < 5
```

and:

```haskell
module FooBar where
```

#### step one: install the hnix in monorepo

```sh
git remote add nix https://github.com/placek/hnix.git
git subtree add --prefix nix nix master --squash
```

#### step two: add nix-shell configuration

Create a `shell.nix` file:

```nix
import ./nix/shell.nix {
  name = "foobar";
}
```

If you want to define more tools to be used:

```nix
import ./nix/shell.nix {
  name = "foobar";
  devTools = { pkgs }: with pkgs; [
    gawk # add gnu awk
  ];
}
```

#### [optional] step three: pin nix sources to exact revision

To pin souces to one specific revision add `sources.json` file and place there
some details about the nixpkgs version, like:

```json
{
  "url": "https://github.com/NixOS/nixpkgs.git",
  "rev": "a1a6472993e44c44c437f6b5004e53289bc8399c",
  "ref": "refs/tags/21.11",
  "allRefs": true
}
```

#### [optional] step five: apply direnv config

```sh
echo "use nix" > .envrc && direnv allow
```
