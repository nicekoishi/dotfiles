import Icons from "utils/Icons";

/* TODO: screencast event returns a string state, owner and maybe I should send a PR */
/* but the quality of this code is... Well, if it works it works */
export default (self: any, name: string, data: string) => {
    // console.log(`${name}: ${data}`);
    if (name === "screencast") {
        const info = data.split(",");
        const sc = {
            state: info[0] /* maybe !! would work here? */,
            owner: info[1],
        };

        switch (sc.state) {
            case "1":
                self.toggleClassName("speen", false);
                self.attribute = { ...self.attribute, screencast: true };

                if (sc.owner == "0")
                    self.icon = Icons.wm.screencast.monitor;
                if (sc.owner == "1")
                    self.icon = Icons.wm.screencast.window;
                break;
            case "0":
                self.attribute = { ...self.attribute, screencast: false };
                self.icon = Icons.nix;
                break;
        }
    }
};
