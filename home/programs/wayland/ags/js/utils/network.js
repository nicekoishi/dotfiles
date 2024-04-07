import { Network } from "../imports.js";
import { Icons } from "../imports.js";

const { wifi, wired } = Icons;

export const wiredIcon = (internet) => {
    if (internet == "connected")
        return wired.power;
    if (internet == "connecting")
        return wired.powering;
    if (internet == "disconnected")
        return wired.poweroff;
    return wired.poweroff;
};

export const wiredTooltip = (internet) => {
    return `Status: ${internet}`;
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
