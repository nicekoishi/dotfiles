import { Utils, Widget } from "../../../imports.js";
const { execAsync } = Utils;
const { Label, Box } = Widget;

const Time = () =>
    Label({ className: "timeLabel" }).poll(1000, (self) =>
        execAsync(["date", "+%d/%m/%y %H:%M"]).then((i) => (self.label = i)),
    );

export const Date = () =>
    Box({
        className: "clock",
        children: [Time()],
    });
