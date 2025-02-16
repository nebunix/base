{ config, lib, ... }:

let
  cfg = config.nebunix.defaultPrograms;
in
{
  options.nebunix.defaultPrograms = {
    terminal = lib.mkOption {
      type = with lib.types; nullOr str;
      default = null;
      description = "The default terminal to use.";
    };

    browser = lib.mkOption {
      type = with lib.types; nullOr str;
      default = null;
      description = "The default browser to use.";
    };

    shell = lib.mkOption {
      type = with lib.types; str;
      default = "bash";
      description = "The default shell to use.";
    };
  };
}
