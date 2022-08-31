# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./modules      
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  # Set your time zone.
    time.timeZone = "America/Chicago";

  # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
  # LICENSES
    nixpkgs.config.allowUnfree = true;

  # Enable the X11 windowing system.
    services.xserver.enable = true; 
    services.xserver.displayManager.gdm.enable = true;
  # use window managers
    services.xserver.windowManager.bspwm.enable = true;

# HARDWARE

  # AUDIO
    sound.enable = true;
    hardware.pulseaudio.enable = true;
    hardware.bluetooth.enable = true;
    hardware.pulseaudio.support32Bit = config.hardware.pulseaudio.enable;
  
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.jodi = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
    environment.systemPackages = with pkgs; [
      # GENERAL
      firefox
      wget
      curl
      # FOR NEOVIM
      nodejs
      neovim
  ];
  # NETWORKING
boot.extraModulePackages = with config.boot.kernelPackages; [
  (rtl88x2bu.overrideAttrs (old: {
     src = pkgs.fetchFromGitHub {
       owner = "RinCat";
       repo = "RTL88x2BU-Linux-Driver";
       rev = "master";
       hash = "sha256-/IHVObNDa5+ihOOctsO3/X+/4csjWwmStckTJOqLg2E=";
     };
  }))
];

  boot.kernelModules = [ "r88x2bu"  ];
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" "8.8.8.8" "8.8.4.4" ];    
  #networking.defaultGateway = "192.168.1.254";
  networking.wireless.iwd.enable = true;
  networking.hostName = "";

  #MISC
  programs.fish.enable = true;

  # FONTS
   fonts.fonts = with pkgs; [
     noto-fonts
     liberation_ttf
     fira-code
     fira-code-symbols
  ];


  programs.neovim.enable = true;
  programs.neovim.viAlias = true;


  # FLATPAK
  xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
      ];
    };

    services.flatpak.enable = true;

 
 


# Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}

