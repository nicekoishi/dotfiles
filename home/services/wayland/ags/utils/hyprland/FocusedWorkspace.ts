const Hyprland = await Service.import("hyprland");

export default (self: any) =>
    self.children.forEach((btn: any) => {
        const workspaceCheck = btn.attribute.index === Hyprland.active.workspace.id;
        btn.toggleClassName("focused", workspaceCheck);
        btn.visible = Hyprland.workspaces.some(
            (ws: any) => ws.id === btn.attribute.index,
        );
    });
