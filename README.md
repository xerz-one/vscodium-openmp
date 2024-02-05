# `vscodium-openmp`
A simple flake providing VSCodium with Clang and OpenMP support, ready to go!

## Usage
As long as you have [installed Nix](https://nixos.org/download#download-nix)
with [flakes enabled](https://nixos.wiki/wiki/Flakes),
all you have to do is run the following whenever you want to get down to work:

```sh
nix develop --no-write-lock-file git+https://codeberg.org/xerz/vscodium-openmp -c codium
```
