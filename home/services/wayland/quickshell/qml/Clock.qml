import Quickshell
import QtQuick

Text {
    text: Time.time
    color: Colors.text
    font {
        family: Fonts.family
        pixelSize: Fonts.size
    }

    // just to center
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    width: parent.width
    height: parent.height
}
