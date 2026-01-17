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
        property int borderRadius: 20
    }

    Popups.Popup {
        id: controlCenter

        property int popupWidth: 360
        property int popupHeight: 480

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

        property int popupWidth: 480
        property int popupHeight: 360

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
