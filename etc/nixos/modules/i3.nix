{ config, pkgs, callPackage, ... }:
{
  # Set up X11 and i3 window manager
  services.xserver = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3status
        i3blocks
        dmenu
        feh  # for setting the wallpaper
      ];
    };

    # Enable a display manager (e.g., LightDM, SDDM, or GDM)
    displayManager.lightdm.enable = true;

    # Optionally, set up a background image using feh
    # environment.systemPackages = with pkgs; [
    #   feh
    # ];
  };

  # Set default user shell and session to i3
  environment.systemPackages = with pkgs; [
    i3
    i3status
    i3lock
    dmenu
    feh
  ];

  # Optional: Enable multi-user system and session management
  # systemd.defaultUserServices = {
  #   user = "alex";
  #   session = "i3";
  # };
}
