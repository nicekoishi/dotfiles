import Icons from "utils/Icons";
import Screencast from "utils/hyprland/Screencast";

const Hyprland = await Service.import("hyprland");
const PowerProfiles = await Service.import("powerprofiles");
const { Button, Icon } = Widget;

export default () =>
    Button({
        className: "nix-menu",
        child: Icon({
            icon: Icons.nix,
            attribute: { screencast: false },

            setup: (self: any) => {
                self.hook(Hyprland, Screencast, "event");

                /* check for it on startup */
                if (PowerProfiles.active_profile == "performance")
                    self.toggleClassName("speen", true);

                /* eslint-disable-next-line max-len */
                // https://discord.com/channels/1143610930542944377/1143612651759489054/1275916026768392322
                PowerProfiles.connect("notify::active-profile", () => {
                    switch (PowerProfiles.active_profile) {
                        case "performance":
                            if (self.attribute.screencast)
                                self.toggleClassName("speen", false);
                            else
                                self.toggleClassName("speen", true);
                            break;
                        default:
                            self.toggleClassName("speen", false);
                    }
                });
            },
        }),
    });
