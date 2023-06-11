{pkgs, ...}: {
  nix.settings = {
    experimental-features = [" nix-command" "flakes"];
    substituters = [
      "https://hyprland.cachix.org"
      "https://nix-gaming.cachix.org"
    ];
    trusted-public-keys = [
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

  services.printing = {
    enable = true;
    drivers = [pkgs.hplipWithPlugin];
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
    jack.enable = true;
    pulse.enable = true;
  };

  ## User
  users.users.nicekoishi = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "adbusers"
      "adm"
      "audio"
      "floppy"
      "kvm"
      "libvirtd"
      "log"
      "lp"
      "nicekoishi"
      "optical"
      "power"
      "rfkill"
      "scanner"
      "storage"
      "sys"
      "users"
      "video"
      "wheel"
    ]; # Better be safe than sorry
  };

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.utf8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.utf8";
    LC_IDENTIFICATION = "pt_BR.utf8";
    LC_MEASUREMENT = "pt_BR.utf8";
    LC_MONETARY = "pt_BR.utf8";
    LC_NAME = "pt_BR.utf8";
    LC_NUMERIC = "pt_BR.utf8";
    LC_PAPER = "pt_BR.utf8";
    LC_TELEPHONE = "pt_BR.utf8";
    LC_TIME = "pt_BR.utf8";
  };

  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [
        {
          users = ["nicekoishi"];
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };

  fonts = {
    fontDir.enable = true;
    enableDefaultFonts = false;
    fonts = with pkgs; [
      material-symbols

      corefonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      (nerdfonts.override {fonts = ["Iosevka" "FiraCode" "JetBrainsMono"];})
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["Iosevka Nerd Font"];
        sansSerif = ["Iosevka Nerd Font"];
        monospace = ["Iosevka Nerd Font Mono"];
        emoji = ["Noto Color Emoji"];
      };
    };
  };

  zramSwap.enable = true;

  programs.zsh.enable = true;
  # Home Manager GTK stuff doesn't work without this!
  programs.dconf.enable = true;

  system.stateVersion = "23.05";
}
