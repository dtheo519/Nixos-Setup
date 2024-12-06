{ config, lib, pkgs, ...}:{

# Printer config
services.printing.enable = true; #CUPS
services.avahi = { #needed for printer discovery
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
};
hardware.bluetooth.enable = true; # enables support for Bluetooth
hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  hardware.bluetooth.settings = {
    General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true;
};
};
networking.firewall.enable = true;
#Network config
networking.networkmanager.enable = true; # most used and easiest option, most distros use
networking.hostName = "dom-asus"; # do you have dementia? this is self explanatory
services.openssh.enable = true; # did you forget the last question already?
#add better firewall conf
}
