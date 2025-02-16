{ config, lib, ... }:

let
  cfg = config.nebunix.localization;
in
{
  options.nebunix.localization = {
    consoleKeyMap = lib.mkOption {
      type = with lib.types; str;
      default = "us";
      description = "The key map to use in virtual consoles.";
    };

    timeZone = lib.mkOption {
      type = with lib.types; str;
      default = "UTC";
      description = "The time zone you are in.";
    };

    locale = lib.mkOption {
      type = with lib.types; str;
      default = "en_US.UTF-8";
      description = "The locale for your system.";
    };

    xkb = {
      layout = lib.mkOption {
        type = with lib.types; str;
        default = "us";
        description = "The keyboard layout for applications that use xkb.";
      };

      variant = lib.mkOption {
        type = with lib.types; str;
        default = "";
        description = "The keyboard variant for applications that use xkb.";
      };
    };
  };

  config = {
    console.keyMap = cfg.consoleKeyMap;
    time.timeZone = cfg.timeZone;
    i18n.defaultLocale = cfg.locale;

    services.xserver.xkb = {
      layout = cfg.xkb.layout;
      variant = cfg.xkb.variant;
    };

    environment.sessionVariables = {
      XKB_DEFAULT_LAYOUT = cfg.xkb.layout;
      XKB_DEFAULT_VARIANT = cfg.xkb.variant;
    };
  };
}
