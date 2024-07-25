{
  # allow overriding electron
  electron,
  webcord,
  substituteAll,
  lib,
  suncord-web-extension,
}:
# nixpkgs-update: no auto update
(webcord.override {inherit electron;}).overrideAttrs (old: {
  pname = "webcord-suncord";

  patches =
    (old.patches or [])
    ++ [
      (substituteAll {
        src = ./suncord.patch;
        suncord = suncord-web-extension;
      })
    ];

  meta = {
    inherit (old.meta) license mainProgram platforms;

    description = "Webcord with Suncord web extension";
    maintainers = with lib.maintainers; [
      FlafyDev
      NotAShelf
    ];
  };
})
