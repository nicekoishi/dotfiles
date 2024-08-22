const Hyprland = await Service.import("hyprland");

export default (self: any, address: string) => {
    let isRed = false;
    const item = Hyprland.clients.find((item) => item.address === address);

    self.children.forEach((btn: any) => {
        const checks = {
            btn: btn.attribute.index === item?.workspace.id,
            early: btn.attribute.index === Hyprland.active.workspace.id,
        };

        const timeout = () => {
            clearInterval(notifyUrgent);
            btn.toggleClassName("urgent", false);
        };

        const notifyUrgent = setInterval(() => {
            if (checks.btn) {
                isRed = !isRed;
                btn.toggleClassName("urgent", isRed);

                const bail = btn.attribute.index === Hyprland.active.workspace.id;
                if (bail)
                    timeout();
            }
        }, 250);

        setTimeout(() => timeout(), 5000);
    });
};
