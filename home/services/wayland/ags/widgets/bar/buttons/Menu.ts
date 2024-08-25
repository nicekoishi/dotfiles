import Icons from "utils/Icons";
import ProfileIcon from "utils/PowerProfiles";
import Screencast from "utils/hyprland/Screencast";

const Hyprland = await Service.import("hyprland");
const PowerProfiles = await Service.import("powerprofiles");
const { Button, Icon } = Widget;

export default () =>
    Button({
        className: "nix-menu",
        child: Icon({
            className: "menu-icon",
            icon: Icons.nix,
            attribute: { screencast: false },

            setup: (self: any) => {
                self.hook(Hyprland, Screencast, "event").hook(
                    PowerProfiles,
                    ProfileIcon,
                    "profile-released",
                );
            },
        }),
    });
