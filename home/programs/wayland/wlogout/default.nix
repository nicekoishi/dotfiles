{
  pkgs,
  lib,
  ...
}: let
  bgImageSection = name: ''
    #${name} {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/${name}.png"));
    }
  '';
in {
  programs.wlogout = {
    enable = true;

    style = ''
      * {
        background: none;
      }

      window {
      	background-color: rgba(30, 30, 46, .5);
      }

      button {
        background: rgba(30, 30, 46, .05);
        border-radius: 8px;
        box-shadow: inset 0 0 0 1px rgba(166, 173, 200, .1), 0 0 rgba(30, 30, 46, .5);
        margin: 1rem;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
      }

      button:focus, button:active, button:hover {
        background-color: rgba(166, 173, 200, 0.2);
        outline-style: none;
      }

      ${lib.concatMapStringsSep "\n" bgImageSection [
        "lock"
        "logout"
        "suspend"
        "hibernate"
        "shutdown"
        "reboot"
      ]}
    '';
  };
}
