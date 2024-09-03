{buildGoModule}:
buildGoModule {
  pname = "go-template";
  version = "0.0.1";

  src = ./.;

  vendorHash = null;

  ldflags = ["-s" "-w"];
}
