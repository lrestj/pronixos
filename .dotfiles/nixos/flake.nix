{

  description = "My flake";

  
  inputs = {
      nixpkgs.url = "nixpkgs/nixos-unstable"; 
      yazi.url = "github:sxyazi/yazi";
  };


  outputs = { self, nixpkgs, yazi, ... }@inputs: {
      nixosConfigurations = {
          nixos = nixpkgs.lib.nixosSystem {
              specialArgs = { inherit inputs; };
              system = "x86_64-linux";
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

