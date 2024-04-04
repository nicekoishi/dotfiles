import { Network } from "../imports.js";
import { Icons } from "../imports.js";

const { wifi, wired } = Icons;

export const wiredIcon = (internet) => {
    switch (true) {
        case internet === "connected":
            return wired.power;
            /*  It's unfortunate that the icon takes too long to change
            I find it pretty cool
            case internet === "connecting":
            return wired.powering;*/
        case internet === "disconnected":
            return wired.poweroff;
        default:
            return wired.poweroff;
    }
};

export const wiredTooltip = () => {
    const eth = Network.wired.internet;
    return `Status: ${eth}`;
};

export const wifiIcon = (strength) => {
    switch (true) {
        case strength < 0.1:
            return wifi.none;

        case strength < 0.26:
            return wifi.bad;

        case strength < 0.51:
            return wifi.low;

        case strength < 0.76:
            return wifi.normal;

        case strength > 0.76:
            return wifi;
        default:
            return wifi.none;
    }
};

export const wifiTooltip = (strength, ssid) => {
    const wifi = Network.wifi;
    const wifiStr = `Strength: ${strength * 100}`;

    switch (wifi.internet) {
        case "connected":
            return `${ssid} | Strength: ${wifiStr}`;
        case "connecting":
            return `Connecting to ${ssid} | Strength: ${wifiStr}`;
        case "disconnected":
            return `Disconnected from ${ssid}`;
        default:
            return "No connection";
    }
};
