import { Mpris, Widget } from "../../imports.js";
import { findPlayer, generateBackground } from "../../utils/music.js";
import PopupWindow from "../../utils/popup_window.js";

import Cover from "./cover.js";
import { Artists, Title } from "./title_artists.js";
import TimeInfo from "./time_info.js";
import Controls from "./controls.js";
import PlayerInfo from "./player_info.js";

const { Box } = Widget;

const Info = (player) =>
    Box({
        className: "info",
        vertical: true,
        vexpand: false,
        hexpand: false,
        homogeneous: true,

        children: [
            PlayerInfo(player),
            Title(player),
            Artists(player),
            Controls(player),
            TimeInfo(player),
        ],
    });

const MusicBox = (player) =>
    Box({
        className: "music window",
        children: [Cover(player), Info(player)],
    }).bind("css", player, "cover-path", generateBackground);

export const Media = () =>
    PopupWindow({
        monitor: 0,
        anchor: ["top"],
        layer: "top",
        margins: [8, 0, 0, 0],
        name: "music",
        child: Box(),
    }).bind("child", Mpris, "players", (players) => {
        if (players.length == 0)
            return Box();
        return MusicBox(findPlayer(players));
    });
