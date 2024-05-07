import QtQuick
import Quickshell
import Quickshell.Io

Scope {
  id: root

  property string time;

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

        height: 30

        Text {
          anchors.centerIn: parent

          text: root.time
        }
      }
    }
  }

  Process {
    id: dateProc

    command: ["date"]
    running: true

    stdout: SplitParser {
      onRead: data => root.time = data
    }
  }

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: dateProc.running = true
  }

}