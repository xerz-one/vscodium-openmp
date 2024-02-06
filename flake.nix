{
  description = "VSCodium with OpenMP";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs@{ ... }:
    inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import inputs.nixpkgs { inherit system; };
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
