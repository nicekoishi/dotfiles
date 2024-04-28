import { App, Mpris, Widget } from "../../../imports.js";
import { findPlayer } from "../../../utils/music.js";
//import { ActiveTitle } from "./active.js";

const { Box, Button, Label } = Widget;

const Cover = (player) =>
    Box({ className: "cover" }).bind(
        "css",
        player,
        "cover-path",
        (cover) => `background-image: url('${cover ?? ""}');`,
    );

const Title = (player) =>
    Label({
        className: "title module",
    }).bind("label", player, "track-title", (title) =>
        (title ?? "") == "Unknown title" ? "" : title,
    );

export const MusicBox = (player) =>
    Box({
        children: [Cover(player), Title(player)],
    });

/* For some odd reason, using onPrimaryClicked instead of onClicked
causes some weird issues with the cursor grab.
So I just replace the EventBox for a Button*/
export const Music = () =>
    Button({
        className: "music",
        cursor: "pointer",
        onClicked: () => App.toggleWindow("music"),
    })
        .hook(App, (self, window, visible) => {
            if (window === "music")
                self.toggleClassName("active", visible);
        })
        .bind("visible", Mpris, "players", (p) => p.length > 0)
        .bind("child", Mpris, "players", (players) => {
            if (players.length == 0)
                return Box();
            return MusicBox(findPlayer(players));
        });
