import { App, Utils, Widget } from "../../../imports.js";
const { execAsync } = Utils;
const { Button, Calendar, Label, Window } = Widget;

const TimeLabel = () =>
    Label({ className: "timeLabel" }).poll(1000, (self) =>
        execAsync(["date", "+%d/%m/%y %H:%M"]).then((i) => (self.label = i)),
    );

export const TimeCalendar = () =>
    Window({
        name: "TimeCalendar",
        monitor: 0, // TODO: this is lazy
        anchor: ["top", "right"],
        visible: false,
        child: Calendar({
            className: "calendar",
            showDayNames: true,
            showDetails: true,
            showHeading: true,
            showWeekNumbers: true,
        }),
    });

export const Date = () =>
    Button({
        className: "clock",
        cursor: "pointer",
        child: TimeLabel(),
        onClicked: () => App.toggleWindow("TimeCalendar"),
    });
