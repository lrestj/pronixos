{ pkgs, ... }:
{
  environment.variables = { EDITOR = "vim"; };

  environment.systemPackages = with pkgs; [
    ((vim_configurable.override {gui=false;}).customize{
      name = "vim";
     }
  )];

}
