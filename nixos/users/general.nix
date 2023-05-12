{config,pkgs,...}:

{
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
  
  users.users.nicekoishi.isNormalUser = true;
  users.users.nicekoishi.shell = pkgs.zsh;
  
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
}
