
import Quickshell
import Quickshell.Io
import QtQuick

Scope {
  Variants {
    model: Quickshell.screens;

    PanelWindow {
      property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      height: 25
      
      Socket {
	path: `/tmp/hypr/${Quickshell.env("HYPRLAND_INSTANCE_SIGNATURE")}/.socket2.sock`
	connected: true

	signal activewindow(title: string);

	parser: SplitParser {
	  id: hypractive
	  onRead: data => {
	    const [type, body] = data.split(">>");
	    const agrs = body.split(",");

	    switch (type) {
	    case "activewindow"
	      activewindow(args[1])
	      break;
	    }
	  }
	}
      }

      Text {
	anchors.centerIn: parent
	text: hypractive.activewindow
      }
      
      /*ClockWidget {
	anchors.centerIn: parent
	}*/
    }
  }
}
