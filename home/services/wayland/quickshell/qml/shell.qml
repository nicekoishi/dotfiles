import Quickshell
import QtQuick
import "components"

//import "services/notifications"

ShellRoot {
    id: root

    Loader {
        id: barLoader
        source: "components/bar/Bar.qml"
    }
}
