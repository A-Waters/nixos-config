{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
    environment.systemPackages = [
      pkgs.gtk4
      pkgs.gtk3
      pkgs.gtk2
      pkgs.wofi
      pkgs.swww
      #pkgs.qt5-wayland
      #pkgs.qt6-wayland
    ];

    nix.settings = {
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
   


    # inputs.swww.url = "github:LGFae/swww";

    programs.dconf.enable = true; 

     
    services = {
     xserver.enable = true; 
     displayManager = {
        sddm = {
          enable = true;
	  package = pkgs.kdePackages.sddm;
          wayland = {
            enable = true;
          };
      	};
      };
    };

    programs.hyprland.enable = true;
    programs.xwayland.enable = true;
    programs.waybar.enable = true;
    programs.yazi.enable = true;


    home-manager.users.alex = {pkgs, ...}: {
	wayland.windowManager.hyprland = {
            settings = {
    		monitor = [
            		",prefered,auto,1"
            		"DP-2, 1920x1080@144, 0x0, 1"
  		];
    	    };  	    
 	};
    };

}
