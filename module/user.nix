{
  config,
  lib,
  systemInformation,
  ...
}:

let
  cfg = config.nebunix.user;
in
{
  options.nebunix.user = {
    fullName = lib.mkOption {
      type = with lib.types; str;
      description = "The full name of the user.";
    };
  };

  config = {
    users.users."${systemInformation.userName}" = {
      isNormalUser = true;
      description = cfg.fullName;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
}
