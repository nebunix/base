{ systemInformation, ... }:

{
  imports = [
    ./bootloader.nix
    ./localization.nix
    ./networking.nix
    ./user.nix
  ];

  config = {
    networking.hostName = systemInformation.hostName;

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    system.stateVersion = "24.11";
  };
}
