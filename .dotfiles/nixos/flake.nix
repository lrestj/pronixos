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
  }; 
}


#####  END OF FILE  #####

