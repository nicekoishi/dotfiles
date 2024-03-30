import Quickshell
import Quickshell.Io
import QtQuick

ShellRoot {
  Variants {
    model: Quickshell.screens;

    delegate: Component {
      PanelWindow {
        property var modelData
        screen: modelData

        anchors {
          top: true
          left: true
          right: true
        }

        height: 25
         
        Text {
          id: clock
          anchors.centerIn: parents

          Process {
            id: dateProc
            command: ["date"]
            running: true
            stdout: SplitParser {
              onRead: data => clock.text = data
            }
          }

          Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: dateProc.running = true
          }
        }
      }
    }
  }
}
