import { Widget, Hyprland, Icons } from "../../../imports.js";
import { getFocusedWorkspace } from "../../../utils/hyprland.js";
const { Box, Button, Icon } = Widget;
const { messageAsync } = Hyprland;

export const Workspaces = () =>
    Box({
        className: "workspaces",
        child: Box({
            vertical: false,
            children: Array.from({ length: 5 }, (_, i) => i + 1).map((i) =>
                Button({
                    cursor: "pointer",
                    attribute: { index: i },
                    child: Icon(Icons.workspaces[i]),
                    onClicked: () => messageAsync(`dispatch workspace ${i}`),
                }),
            ),

            setup: (self) => {
                self.hook(Hyprland, getFocusedWorkspace);
            },
        }),
    });
