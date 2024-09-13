{self', ...}: let
  inherit (self'.packages) docs;
in {
  imports = [
    ./extra
    ./host
    ./user
  ];
  environment.etc."nicekoishi/documentation" = {
    source = docs.outPath;
  };
}
