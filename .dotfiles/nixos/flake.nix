{

  description = "My flake";

  
  inputs = {
      nixpkgs.url = "nixpkgs/nixos-unstable"; 
      yazi.url = "github:sxyazi/yazi";
  };


  outputs = { self, nixpkgs, yazi, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;

      # Systems that can run tests:
      supportedSystems = [ "aarch64-linux" "i686-linux" "x86_64-linux" ];

      # Function to generate a set based on supported systems:
      forAllSystems = inputs.nixpkgs.lib.genAttrs supportedSystems;

      # Attribute set of nixpkgs for each system:
      nixpkgsFor =
        forAllSystems (system: import inputs.nixpkgs { inherit system; });
    in
  {
      nixosConfigurations = {
          nixos = lib.nixosSystem {
              specialArgs = { inherit inputs; };
              inherit system;
              modules = [
                  ./configuration.nix
                  ({ pkgs, ... }: {
		  environment.systemPackages = [ yazi.packages.${pkgs.system}.default ];
		  })
              ];
          };
      };
      packages = forAllSystems (system:
          let pkgs = nixpkgsFor.${system};
          in {
              default = self.packages.${system}.install;

              install = pkgs.writeShellApplication {
                  name = "install";
                  runtimeInputs = with pkgs; [ git ]; # deps
                  text = ''${./datetimenotify.sh} "$@"''; # the script
              };

      });

      apps = forAllSystems (system: {
          default = self.apps.${system}.install;

          install = {
            type = "app";
            program = "${self.packages.${system}.install}/bin/install";
          };
      });      

  }; 
}


#####  END OF FILE  #####

