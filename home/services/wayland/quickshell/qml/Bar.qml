import Quickshell
import QtQuick
import QtQuick.Layouts

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: root
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                bottom: true
            }

            margins {
                top: 8
                bottom: 8
                left: 8
                right: 8
            }

            color: "transparent"
            implicitWidth: 50
            Rectangle {
                width: parent.width
                height: parent.height
                radius: 8
                color: Colors.base

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 8
                    spacing: 8

                    Rectangle {
                        id: top
                        width: parent.width
                        height: 250
                        radius: 12
                        color: Colors.surface0
                        Layout.alignment: Qt.AlignTop

                        Rectangle {
                            id: workspaces
                            width: parent.width + 2
                            height: parent.height
                            color: Colors.surface0
                            Layout.alignment: Qt.AlignCenter
                            radius: parent.radius

                            Workspaces {}
                        }
                    }

                    Rectangle {
                        id: bottom
                        width: parent.width
                        height: 50
                        radius: 12
                        color: Colors.base
                        Layout.alignment: Qt.AlignBottom

                        Rectangle {
                            id: clock
                            width: parent.width + 2
                            height: parent.height
                            color: Colors.surface0
                            Layout.alignment: Qt.AlignCenter
                            radius: parent.radius

                            Clock {}
                        }
                    }
                }
            }
        }
    }
}
