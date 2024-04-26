import { Network, Utils, Widget } from "../../../imports.js";
import {
    wifiIcon,
    wifiTooltip,
    wiredIcon,
    wiredTooltip,
} from "../../../utils/network.js";
const { Button, Icon, Stack } = Widget;

const WifiIndicator = () =>
    Icon({})
        .bind("icon", Network.wifi, "strength", wifiIcon)
        .bind("tooltip-text", Network.wifi, "strength", wifiTooltip);

const WiredIndicator = () =>
    Icon({})
        .bind("icon", Network.wired, "internet", wiredIcon)
        .bind("tooltip-text", Network.wired, "internet", wiredTooltip);

export const NetWidget = () =>
    Button({
        className: "network",
        cursor: "pointer",
        onClicked: () => Utils.exec("nm-connection-editor"),
        child: Stack({
            shown: Network.bind("primary").as((p) => p || "wifi"),
            children: {
                wifi: WifiIndicator(),
                wired: WiredIndicator(),
            },
        }),
    });
