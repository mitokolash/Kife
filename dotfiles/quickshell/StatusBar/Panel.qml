import Quickshell
import QtQuick
import Quickshell.Wayland

PanelWindow {
    color: "transparent"
    visible: false
    height: 45
    anchors {
        left: true
        right: true
    }

    margins {
        left: 10
        right: 10
    }

    WlrLayershell.keyboardFocus: WlrKeyboardFocus.OnDemand

    Rectangle {
        id: bar
        color: "#111111"

        width: parent.width
        height: parent.height

        radius: borderRadius

        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Top {}
    }
}
