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
      pkgs = import nixpkgs { inherit system; };
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
      packages.default = pkgs.writeScriptBin "runme" ''
        echo "I am currently being run!"
      '';

      # An app that uses the `runme` package
      apps.default = {
        type = "app";
        program = "${self.packages.${system}.runme}/bin/runme";
      };
  }; 
}


#####  END OF FILE  #####

