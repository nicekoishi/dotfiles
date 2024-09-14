{
  inputs,
  self,
  ...
}: {
  perSystem = {
    inputs',
    pkgs,
    ...
  }: {
    packages = {
      # i want to shoot myself
      docs = inputs'.ndg.packages.ndg-builder.override {
        title = "nicekoishi's options documentation - ${self.shortRev or self.dirtyShortRev}";
        embedResources = true;

        # https://github.com/nix-community/home-manager/blob/503af483e1b328691ea3a434d331995595fb2e3d/docs/default.nix#L48
        optionsDocArgs = let
          inherit (builtins) toString;
          inherit (inputs.nixpkgs) lib;
          inherit (lib.strings) hasPrefix removePrefix removeSuffix;

          source = toString ../.;

          ghDeclaration = user: repo: path: let
            rev =
              if user == "nicekoishi"
              then "${self.rev or (removeSuffix "-dirty" self.dirtyRev)}"
              else "${inputs.nixpkgs.rev}";
          in {
            url = "https://github.com/${user}/${repo}/blob/${rev}/${path}";
            name = "<${repo}/${path}>";
          };

          checks = decl:
            if hasPrefix source (toString decl)
            then
              ghDeclaration "nicekoishi" "dotfiles"
              (removePrefix "/" (removePrefix source (toString decl)))
            else if decl == "lib/modules.nix"
            then ghDeclaration "NixOS" "nixpkgs" decl
            else decl;
        in {
          transformOptions = opt:
            opt // {declarations = map checks opt.declarations;};
        };

        rawModules = [
          ../modules/options/extra
          ../modules/options/host
          ../modules/options/user
        ];

        specialArgs = {inherit pkgs;};
      };
    };
  };
}
