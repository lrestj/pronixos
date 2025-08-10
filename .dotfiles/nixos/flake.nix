{

  description = "My flake";

  
  inputs = {
      nixpkgs.url = "nixpkgs/nixos-unstable"; 
      nixpkgs-stable.url = "nixpkgs/nixos-25.05"; 
      hyprland.url = "github:hyprwm/Hyprland";
      nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
      waybar = {
          url = "github:alexays/waybar";
          inputs.nixpkgs.follows = "nixpkgs";
      };
  };


  outputs = { self, nixpkgs, ... }@inputs: {
      nixosConfigurations = {
          nixos = nixpkgs.lib.nixosSystem {
              system = "x86_64-linux";
              specialArgs = { inherit inputs; };
              modules = [
                  ./configuration.nix
                  inputs.nix-flatpak.nixosModules.nix-flatpak
                  ({ pkgs, ... }: {
                      environment.systemPackages = [
                        inputs.waybar.packages.${pkgs.system}.waybar
                      ];
		  })
              ];
          };
      };
  }; 
}

#####  END OF FILE  #####
