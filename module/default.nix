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

    home-manager.users."${systemInformation.userName}" =
      { ... }:
      {
        home.userName = systemInformation.userName;
        home.homeDirectory = "/home/${systemInformation.userName}";
        programs.home-manager.enable = true;
        home.stateVersion = "24.11";
      };
  };
}
