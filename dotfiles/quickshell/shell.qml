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
        anchors.top: true
        margins.top: 10
        borderRadius: 40
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

    Popups.Popup {
        id: applauncher

        popupWidth: 480
        popupHeight: 360

        Behavior on implicitHeight { NumberAnimation { duration: 800; easing.type: Easing.InOutCubic } }
        Behavior on implicitWidth { NumberAnimation { duration: 800; easing.type: Easing.InOutCubic } }

        anchor.window: bar
        anchor.rect.x: 1920 / 2 - width / 2
        anchor.rect.y: 1080 / 2 - height / 2

        Popups.AppLauncher {}

        IpcHandler {
            target: "applauncher"

            function toggle() {
                applauncher.open = !applauncher.open
            }
        }
    }
}
