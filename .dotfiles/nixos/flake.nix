{

  description = "My flake";

  
  inputs = {
      nixpkgs.url = "nixpkgs/nixos-unstable"; 
      hyprland.url = "github:hyprwm/Hyprland";
      yazi.url = "github:sxyazi/yazi";
      nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
      waybar = {
          url = "github:alexays/waybar";
          inputs.nixpkgs.follows = "nixpkgs";
      };
  };


  outputs = {
      self,
      nixpkgs,
      ... }@inputs:

  {
      nixosConfigurations = {
          nixos = nixpkgs.lib.nixosSystem {
              system = "x86_64-linux";
              specialArgs = { inherit inputs; };
              modules = [
                  ./configuration.nix
                  inputs.nix-flatpak.nixosModules.nix-flatpak
                  ({ pkgs, ... }: {
                      environment.systemPackages = [
                        inputs.yazi.packages.${pkgs.system}.default
                        inputs.waybar.packages.${pkgs.system}.waybar
                      ];
		  })
              ];
          };
      };
  }; 
}

#####  END OF FILE  #####
