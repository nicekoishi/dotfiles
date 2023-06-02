{pkgs, ...}: {
  nix.settings = {
    experimental-features = [" nix-command" "flakes"];
    substituters = [
      "https://anyrun.cachix.org"
      "https://hyprland.cachix.org"
      "https://nix-gaming.cachix.org"
    ];
    trusted-public-keys = [
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vn03p346s="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];
  };

  nixpkgs = {
    config.allowUnfree = true;
  };

  networking.stevenblack = {
    enable = true;
    block = ["gambling" "porn"];
  };

  networking.nameservers = ["2620:fe::fe" "2620:fe::9"];

  ## if i forgot this, it would be annoying at least
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.printing = {
    enable = true;
    drivers = [pkgs.hplipWithPlugin]; # FIXME this stopped working, now using printing via avahi
  };

  hardware.sane = {
    enable = true;
    extraBackends = [pkgs.hplipWithPlugin];
  };

  programs.java.enable = true;
  services.tumbler.enable = true;

  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };

  ## Keymap
  services.xserver = {
    layout = "br";
    xkbVariant = "";
  };

  console.useXkbConfig = true;

  ## Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  system.stateVersion = "23.05";
}
