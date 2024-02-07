{
  description = "VSCodium with OpenMP";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    inputs.flake-utils.lib.eachSystem nixpkgs.lib.systems.flakeExposed (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells = rec {
          vscodium-openmp = pkgs.mkShell.override { stdenv = pkgs.llvmPackages_latest.stdenv; } {
            nativeBuildInputs = with pkgs; [
              llvmPackages.openmp
              clang-tools
              vscodium
            ];
          };
          default = vscodium-openmp;
        };
      }
    );
}
