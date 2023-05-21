{ pkgs, ... }:

{
  imports = [
    ../samba/smb.nix
  ];
  ## User
  users.users.nicekoishi = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "nicekoishi"
      "sys"
      "log"
      "floppy"
      "scanner"
      "power"
      "rfkill"
      "users"
      "video"
      "storage"
      "optical"
      "lp"
      "audio"
      "adm"
      "libvirtd"
      "kvm"
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
      extraRules = [{
        users = ["nicekoishi"];
        keepEnv = true;
        persist = true;
      }];
    };
  };

  fonts = {
    fontDir.enable = true;
    enableDefaultFonts = true;
    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "Iosevka" "FiraCode" "JetBrainsMono" ]; })
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Iosevka Nerd Font" ];
	      sansSerif = [ "Iosevka Nerd Font" ];
	      monospace = [ "Iosevka Nerd Font Mono" ];
      };
    };
  };

  programs.zsh.enable = true;
}
