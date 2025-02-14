{ systemInformation, ... }:

{
  config = {
    users.users."${systemInformation.user.userName}" = {
      isNormalUser = true;
      description = systemInformation.user.fullName;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
}
