import Quickshell
import QtQuick
import "components"
import "services"

ShellRoot {
    id: root

    Loader {
        id: barLoader
        source: "components/bar/Bar.qml"
    }
}
