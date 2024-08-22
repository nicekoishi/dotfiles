import Icons from "utils/Icons";
import focusedWorkspace from "utils/hyprland/FocusedWorkspace";
import urgentWorkspace from "utils/hyprland/UrgentWorkspace";

const Hyprland = await Service.import("hyprland");
const { Box, Button, Icon } = Widget;

export default () =>
    Box({
        className: "workspaces",
        cursor: "pointer",
        vertical: true,
        child: Box({
            vertical: true,
            children: Array.from({ length: 6 }, (_, i) => i + 1).map((i) =>
                Button({
                    cursor: "pointer",
                    attribute: { index: i },
                    child: Icon(Icons.wm.workspaces[i]),
                    onClicked: () =>
                        Hyprland.messageAsync(`dispatch workspace ${i}`),
                }),
            ),
            setup: (self: any) => {
                self.hook(Hyprland, focusedWorkspace).hook(
                    Hyprland,
                    urgentWorkspace,
                    "urgent-window",
                );
            },
        }),
    });
