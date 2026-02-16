pragma Singleton
import QtQuick
import Quickshell

Singleton {
    readonly property QtObject colors: Colors
    readonly property QtObject fonts: Fonts
}
