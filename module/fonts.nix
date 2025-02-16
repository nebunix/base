{ config, lib, ... }:


let
  cfg = config.nebunix.fonts;
in
{
  options.nebunix.fonts = {
    monospaceFont = lib.mkOption {
      type = with lib.types; str;
      default = "monospace";
      description = "The monospace font to use.";
    };
  };
}
