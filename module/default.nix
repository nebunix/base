{ systemInformation, ... }:

{
  imports = [
    ./bootloader.nix
    ./fonts.nix
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

    home-manager.users."${systemInformation.userName}" =
      { ... }:
      {
        home.username = systemInformation.userName;
        home.homeDirectory = "/home/${systemInformation.userName}";
        programs.home-manager.enable = true;
        home.stateVersion = "24.11";
      };
  };
}
