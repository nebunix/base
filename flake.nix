{
  inputs = { };

  outputs =
    { ... }:
    {
      nixosModules = {
        base = import ./module;
      };
    };
}
