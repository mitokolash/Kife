//@ pragma IconTheme Papirus-Dark
import Quickshell
import Quickshell.Io
import QtQuick
import "StatusBar" as StatusBar
import "Popups" as Popups
import "Popups/ControlCenter" as ControlCenter

ShellRoot {
    StatusBar.Panel {
        id: bar
        visible: true
        anchors.bottom: true
        margins.left: 0
        margins.right: 0
    }

    Popups.Popup {
        id: controlCenter

        popupWidth: 360
        popupHeight: 480

        Behavior on implicitHeight { NumberAnimation { duration: 800; easing.type: Easing.InOutCubic } }
        Behavior on implicitWidth { NumberAnimation { duration: 800; easing.type: Easing.InOutCubic } }

        anchor.window: bar
        anchor.rect.x: bar.width / 2 - width / 2
        anchor.rect.y: bar.height + 20

        ControlCenter.ControlCenter {}

        IpcHandler {
            target: "controlcenter"

            function toggle() {
                controlCenter.open = !controlCenter.open
            }
        }
    }
}
