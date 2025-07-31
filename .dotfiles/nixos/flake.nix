{

  description = "My flake";

  
  inputs = {
      nixpkgs.url = "nixpkgs/nixos-unstable"; 
      hyprland.url = "github:hyprwm/Hyprland";
      yazi.url = "github:sxyazi/yazi";
      vim-overlay.url = "github:kawarimidoll/vim-overlay";
      waybar = {
          url = "github:alexays/waybar";
          inputs.nixpkgs.follows = "nixpkgs";
      };
  };


  outputs = {
      self,
      nixpkgs,
      waybar,
      yazi,
      ... }@inputs:

  {
      nixosConfigurations = {
          nixos = nixpkgs.lib.nixosSystem {
              system = "x86_64-linux";
              specialArgs = { inherit inputs; };
              modules = [
                  ./configuration.nix
                  { nixpkgs.overlays = [ inputs.vim-overlay.overlays.default ];}
                  ({ pkgs, ... }: {
                      environment.systemPackages = [
                          yazi.packages.${pkgs.system}.default
                          waybar.packages.${pkgs.system}.waybar
                      ];
		  })
              ];
          };
      };
  }; 
}

#####  END OF FILE  #####
