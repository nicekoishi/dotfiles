{
  programs.chromium = {
    enable = true;
    extensions = [
      # ublock origin
      {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";}
      # bitwarden
      {id = "nngceckbapebfimnlniiiahkandclblb";}
      # pip - firefox has this by default right?
      {id = "hkgfoiooedgoejojocmhlaklaeopbecg";}
      # enhancer for youtube
      {id = "ponfpcnoihfmfllpaingbgckeeldkhle";}
      # betterttv and frankerface
      {id = "ajopnjidmegmdimjlfnijceegpefgped";}
      {id = "fadndhdgpmmaapbmfcknlfgcflmmmieb";}
      # sponsorblock
      {id = "mnjggcdmjocbbbhaepdhchncahnbgone";}
      # stylus
      {id = "clngdbkpkpeebahjckkjfobafhncgmne";}
      # tampermonkey
      {id = "dhdgffkkebhmkfjojejmpbldmpobfkfo";}
      # volume master
      {id = "jghecgabfgfdldnmbfkhmffcabddioke";}
    ];
  };
}
