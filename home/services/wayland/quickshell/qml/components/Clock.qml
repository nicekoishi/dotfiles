import QtQuick
import "../services"
import "../options"

Text {
    text: Time.time
    color: QsOptions.colors.text
    anchors.centerIn: parent

    font {
        family: QsOptions.fonts.family
        pixelSize: QsOptions.fonts.size
    }
}
