{ config, lib, pkgs, ... }:
{
services.displayManager.sddm.enable = true;
services.xserver.windowManager.openbox.enable = true;
services.desktopManager.plasma6.enable = true;
services.xserver.enable = true;
environment.plasma5.excludePackages = with pkgs.kdePackages; [
  plasma-browser-integration
  oxygen
  elisa
  kwin
];
   }
