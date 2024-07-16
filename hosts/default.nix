{
  inputs,
  withSystem,
  ...
}: let
  inherit (inputs.self) lib;

  inherit (lib.lists) concatLists flatten forEach;
  inherit (lib.nice) mkNixosSystem;

  modulePath = "${../modules}";

  # it doesn't return a proper path if it isn't in parentheses
  # what the heck
  core = forEach ["core" "nix" "system"] (
    i: modulePath + ("/" + i)
  );

  desktop = flatten [core (modulePath + "/roles/desktop")];
in {
  flake.nixosConfigurations = {
    polaris = mkNixosSystem {
      inherit withSystem;
      hostname = "polaris";
      system = "x86_64-linux";

      modules = flatten (concatLists [
        [
          ./polaris
          desktop
        ]
        # TODO: this is ugly as hell, import everything and select which ones this host shall use
        (
          forEach
          [
            "system/hardware/video/nvidia"

            "programs/desktop/hyprland"
            "programs/desktop/gnome"

            "programs/gaming"
            "programs/virt-manager"
            "programs/thunar"
          ] (i: modulePath + ("/" + i))
        )
        [
          inputs.chaotic.nixosModules.default
          inputs.nur.nixosModules.nur
        ]
      ]);
    };
  };
}
