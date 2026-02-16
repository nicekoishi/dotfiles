import Quickshell
import QtQuick
import QtQuick.Layouts
import ".."
import "../../options"

Scope {
    Variants {
        model: Quickshell.screens

        // start
        PanelWindow {
            id: root
            required property var modelData

            screen: modelData
            color: "transparent"
            implicitWidth: 50
            implicitHeight: 100

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

            //Component.onCompleted: console.log(JSON.stringify(QsOptions))

            // i'm only doing these comments bcause they're easier to see, maybe my eyes are jsut tired
            ColumnLayout {
                width: root.width
                height: root.height
                spacing: 8

                Rectangle {
                    id: barRect
                    color: QsOptions.colors.crust
                    radius: 12
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    // keep it here in case i forget (it will happen)
                    // Component.onCompleted: console.log(barRect.width)

                    // Workspaces widget
                    Rectangle {
                        id: workspaces
                        color: "transparent"
                        width: parent.width - 15
                        implicitHeight: 50
                        radius: 8

                        anchors {
                            horizontalCenter: parent.horizontalCenter
                            top: parent.top
                            topMargin: root.margins.top
                        }

                        Workspaces {}
                    }

                    // Clock widget
                    Rectangle {
                        id: clock
                        color: QsOptions.colors.surface0
                        width: parent.width - 15
                        height: 50
                        radius: 8

                        anchors {
                            horizontalCenter: parent.horizontalCenter
                            bottom: parent.bottom
                            bottomMargin: root.margins.bottom
                        }

                        Clock {}
                    }
                }
            }
        }
        //end
    }
}
