import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

ColumnLayout {
    anchors.fill: parent
    anchors.margins: 8

    Repeater {
        model: 5

        Text {
            required property int index
            property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
            property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

            text: index + 1

            color: isActive ? "#0db9d7" : (ws ? "#7aa2f7" : "#444b6a")

            font {
                pixelSize: Fonts.size
                bold: true
            }

            MouseArea {
                anchors.fill: parent
                onClicked: Hyprland.dispatch("workspace " + (index + 1))
            }
        }
    }

    Item {
        Layout.fillWidth: false
    }

    Component.onCompleted: {
        console.log(Hyprland.focusedWorkspace);
    }
}
