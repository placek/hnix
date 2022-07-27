# hnix

The simplest configuration for pinning nixpkgs over caba2nix.

### HowTo

Assuming you have a haskell project initialized in the monorepo, you can follow the steps below.

Minimal requirements for the setup is to have a cabal file and haskell module, like:

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

#### step one: fork hnix repo

Fork `hnix` repo to have a copy of the nix configuration you'll be able to change when needed. It's recommended to adjust `sources.nix` file.

#### step two: install the fork in monorepo

```bash
git remote add nix <your_fork_ssh_url>
git subtree add --prefix nix nix <main_branch_of_your_fork> --squash
```

#### step three: add nix-shell configuration

`shell.nix` file:

```nix
import ./nix/shell.nix {
  name = "foobar";
}
```

If you want to define more tools:

```nix
import ./nix/shell.nix {
  name = "foobar";
  devTools = { pkgs }: [ gawk ];
}
```

#### [optional] step four: apply direnv config

`.envrc` file:

```bash
use nix
```

After setting the `.envrc` file allow the repo root to be served with direnv:

```bash
direnv allow .
```
