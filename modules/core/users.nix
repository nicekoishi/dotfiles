{pkgs, ...}: {
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
}
