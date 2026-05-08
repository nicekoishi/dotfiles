import Quickshell
import QtQuick
import "../options"

Text {
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    text: Qt.formatDateTime(clock.date, "hh\nmm\n")
    color: QsOptions.colors.text
    anchors.centerIn: parent

    font {
        family: QsOptions.fonts.family
        pixelSize: QsOptions.fonts.size
    }
}
