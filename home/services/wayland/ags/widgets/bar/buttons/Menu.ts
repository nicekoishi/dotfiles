import Icons from "utils/Icons";
import Screencast from "utils/hyprland/Screencast";

const Hyprland = await Service.import("hyprland");
const { Button, Icon } = Widget;

export default () =>
    Button({
        className: "nix-menu",
        child: Icon({
            className: "speen",
            icon: Icons.nix,
            setup: (self: any) => {
                self.hook(Hyprland, Screencast, "event");
            },
        }),
    });
