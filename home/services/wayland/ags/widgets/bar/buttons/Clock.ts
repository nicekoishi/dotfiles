import LaunchApp from "utils/LaunchApp";

const { Button, Label } = Widget;

const dateBar = Variable("", {
    poll: [1000, ["date", "+%H%n%M"]],
});

const dateTooltip = Variable("", {
    poll: [1000, ["date", "+%d/%m/%Y %H:%M:%S"]],
});

export default () =>
    Button({
        className: "clock",
        cursor: "pointer",
        onPrimaryClick: () => LaunchApp("gnome-calendar"),
        tooltipText: dateTooltip.bind(),
        child: Label({
            label: dateBar.bind(),
            setup: (self: any) =>
                self.hook(dateBar, () => {
                    self.label = dateBar.value.toString();
                }),
        }),
    });
