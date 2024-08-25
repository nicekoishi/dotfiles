import Icons from "utils/Icons";

const PowerProfiles = await Service.import("powerprofiles");

export default (self: any) => {
    const check = () => {
        self.icon = Icons.nix;
        self.css = "opacity: unset;";

        switch (PowerProfiles.active_profile) {
            case "performance":
                if (!self.attribute.screencast)
                    self.toggleClassName("speen", true);
                break;
            case "power-saver":
                self.css = "opacity: 0.5;";
                break;
            default:
                self.toggleClassName("speen", false);
        }

        // console.log(`${PowerProfiles.active_profile}`);
    };

    /* eslint-disable-next-line max-len */
    // https://discord.com/channels/1143610930542944377/1143612651759489054/1275916026768392322
    PowerProfiles.connect("notify::active-profile", check);

    // NOTE: This will become a mess if more icons and attributes are added!
    self.connect("notify::attribute", () => {
        if (
            !self.attribute.screencast &&
            PowerProfiles.active_profile == "performance"
        )
            self.toggleClassName("speen", true);
    });

    /* check for it on startup too */
    check();
};
