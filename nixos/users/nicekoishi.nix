{config,pkgs,...}:

{
  imports = [
    ./general.nix
    ../samba/smb.nix
  ];
  ## User
  users.users.nicekoishi = {
    isNormalUser = true;
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

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
  };
}
