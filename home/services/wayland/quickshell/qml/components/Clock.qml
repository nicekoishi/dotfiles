import QtQuick

Text {
    text: Time.time
    color: Options.colors.text
    anchors.centerIn: parent

    font {
        family: Options.fonts.family
        pixelSize: Options.fonts.size
    }
}
