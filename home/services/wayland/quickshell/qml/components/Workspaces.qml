import Quickshell.Hyprland
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ColumnLayout {
    spacing: 8

    Repeater {
        model: 10

        Button {
            required property int index
            property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
            property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
            property bool isUrgent: ws?.urgent === true

            text: index + 1
            visible: ws !== undefined
            onClicked: ws.activate()
            background: Rectangle {
                id: workspaceBtn
                color: isActive ? Options.colors.accent : Options.colors.surface1
                radius: workspaces.radius
                implicitWidth: workspaces.width
            }

            // all of this just to flash red when workspace has an urgent window
            onIsUrgentChanged: urgentFlash.start()

            SequentialAnimation {
                id: urgentFlash
                loops: 5

                ColorAnimation {
                    target: workspaceBtn
                    property: "color"
                    to: "red"
                    duration: 500
                }

                ColorAnimation {
                    target: workspaceBtn
                    property: "color"
                    to: Options.colors.surface1
                    duration: 500
                }
            }
        }
    }
}
