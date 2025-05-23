{

  description = "My flake";

  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable"; 
  };


  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [ ./configuration.nix
        ];
      };
    };
  }; 
}


#####  END OF FILE  #####

