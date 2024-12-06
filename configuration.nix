{ config, pkgs, ... }:

{
  # The NixOS version
   imports =
    [
      ./hardware-configuration.nix  # Your hardware configuration
      ./netconf.nix
      ./nvidiad.nix
      ./devapps.nix
      ./desetup.nix
    ];
boot.loader.systemd-boot.enable = true;
  # Time settings
  time.timeZone = "America/New_York"; # Set your timezone.
  # Users
  users.users.dom = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable sudo and NetworkManager access.
  };
services.fprintd.enable = true;
virtualisation.vmware.host.enable = true;
  nixpkgs.config.allowUnfree = true;
  # Environment settings
  environment.systemPackages = with pkgs; [
    firefox
    spotify
    planify
    discord
    lutris
    obsidian
    onlyoffice-bin_latest
lunar-client
    teams-for-linux
    mangohud
protonvpn-gui
    gamemode
	gparted
    vlc
tidal-hifi
	usbimager
    qdirstat
  ];
  
security.rtkit.enable = true;
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
  # If you want to use JACK applications, uncomment this
  #jack.enable = true;
};
fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
  corefonts
  vistafonts
];


  services.flatpak.enable = true;
programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
};
nix.settings.auto-optimise-store = true;
  # System settings
  system.stateVersion = "22.05"; # Update this to the version you are using.
}
