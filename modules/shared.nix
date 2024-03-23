{pkgs, ...}: {
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    builders-use-substitutes = true;
    auto-optimise-store = true;
    keep-going = true;
    warn-dirty = false;
    max-jobs = "auto";
    http-connections = 0;
    substituters = [
      "https://ezkea.cachix.org"
      "https://hyprland.cachix.org"
      "https://nix-gaming.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
    ];

    trusted-users = [
      "root"
      "@wheel"
    ];
  };

  nixpkgs = {
    config.allowUnfree = true;
  };

  networking = {
    nameservers = ["2606:4700:4700::1111 2606:4700:4700::1001"];
    stevenblack = {
      enable = true;
      block = ["gambling" "porn"];
    };
  };

  console.useXkbConfig = true;

  ## if i forgot this, it would be annoying at least
  programs = {
    mtr.enable = true;
    java.enable = true;

    # Home Manager GTK stuff doesn't work without this!
    dconf.enable = true;
    zsh.enable = true;
  };

  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [
        {
          users = ["supeen"];
          keepEnv = true;
          persist = true;
        }
      ];
    };
    rtkit.enable = true;
  };

  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    dbus.packages = [pkgs.gcr];
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;
    };
    printing = {
      enable = true;
      drivers = [pkgs.hplipWithPlugin];
    };
    tumbler.enable = true;
    udev.packages = [pkgs.gnome.gnome-settings-daemon];
    xserver.xkb = {
      layout = "br";
      variant = "";
    };
  };

  hardware = {
    bluetooth = {
      enable = true;
    };
    sane = {
      enable = true;
      extraBackends = [pkgs.hplipWithPlugin];
    };
  };

  ## User
  users.users.supeen = {
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
      "supeen"
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

  time = {
    timeZone = "America/Sao_Paulo";
    hardwareClockInLocalTime = true; # eww windoes
  };
  i18n = {
    defaultLocale = "en_US.utf8";
    extraLocaleSettings = {
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
  };

  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = false;
    packages = with pkgs; [
      material-symbols

      corefonts
      vistafonts
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

  system.stateVersion = "23.11";
}
