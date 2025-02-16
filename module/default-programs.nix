{ config, lib, ... }:

let
  cfg = config.nebunix.defaultPrograms;
in
{
  options.nebunix.defaultPrograms = {
    terminal = lib.mkOption {
      type = with lib.types; str;
      default = "kitty";
      description = "The default terminal to use.";
    };

    browser = lib.mkOption {
      type = with lib.types; str;
      default = "firefox";
      description = "The default browser to use.";
    };
  };
}
