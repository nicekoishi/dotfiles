import { Utils, Widget } from "../../../imports.js";
const { execAsync } = Utils;
const { Button, Label } = Widget;

const TimeLabel = () =>
    Label({ className: "timeLabel" }).poll(1000, (self) =>
        execAsync(["date", "+%d/%m/%y %H:%M"]).then((i) => (self.label = i)),
    );

export const Date = () =>
    Button({
        className: "clock",
        cursor: "pointer",
        child: TimeLabel(),
    });
