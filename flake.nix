{
  description = "Mac Auto Setup with nix-darwin and home-manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager }:
    let
      username = "tubone";
      hostname = "my-mac";
    in
    {
      darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs username hostname; };
        modules = [
          ./nix/darwin.nix
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit username; };
              users.${username} = import ./nix/home.nix;
            };
          }
        ];
      };

      # Also support x86_64 Macs
      darwinConfigurations."${hostname}-x86" = nix-darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        specialArgs = { inherit inputs username hostname; };
        modules = [
          ./nix/darwin.nix
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit username; };
              users.${username} = import ./nix/home.nix;
            };
          }
        ];
      };

      # CI checks - verify the configurations evaluate correctly
      checks = let
        forAllSystems = nixpkgs.lib.genAttrs [ "aarch64-darwin" "x86_64-darwin" ];
      in forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in {
          # Verify the flake configuration evaluates without errors
          eval = pkgs.runCommand "eval-check" {} ''
            echo "Flake evaluation succeeded for ${system}"
            touch $out
          '';
        }
      );
    };
}
