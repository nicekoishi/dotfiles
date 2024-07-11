{inputs, ...}: {
  imports = [inputs.aagl.nixosModules.default];

  nix.settings = inputs.aagl.nixConfig;

  programs = {
    anime-game-launcher.enable = true;
    honkers-railway-launcher.enable = true;
    sleepy-launcher.enable = true;
  };
}
