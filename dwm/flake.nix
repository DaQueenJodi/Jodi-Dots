{
  inputs = {
    nixpkgs.url = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
  in {
    packages.${system}.dwm = nixpkgs.legacyPackages.${system}.dwm.overrideAttrs (
      old: {
        src = builtins.path {
          name = "dwm-source";
          path = ./.;
        };
      }
    );
  };
}
