import Icons from "utils/Icons";

export default (self: any, name: string, data: string) => {
    // console.log(`${name}: ${data}`);
    if (name === "screencast") {
        switch (data) {
            case "1,0": {
                self.icon = Icons.wm.screencast.monitor;
                break;
            }
            case "1,1": {
                self.icon = Icons.wm.screencast.window;
                break;
            }
            default: {
                self.icon = Icons.nix;
            }
        }
    }
};
