{

  description = "My flake";

  
  inputs = {
      nixpkgs.url = "nixpkgs/nixos-unstable"; 
      # yazi.url = "github:sxyazi/yazi";
      waybar = {
          url = "github:alexays/waybar";
          inputs.nixpkgs.follows = "nixpkgs";
      };
  };


  outputs = { self, nixpkgs, waybar, ... }@inputs:
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
                    environment.systemPackages = [
                        # yazi.packages.${pkgs.system}.default
                        waybar.packages.${pkgs.system}.waybar
                    ];
		  })
              ];
          };
      };
  }; 
}


#####  END OF FILE  #####

