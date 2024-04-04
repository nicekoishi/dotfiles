import { Hyprland } from "../../../imports.js";

export const ActiveTitle = () => {
    const fullTitle = Hyprland.active.client.bind("title");
    const Title = fullTitle.length > 35 ? fullTitle.substring(0, 35) : fullTitle;

    return Title;
};
