import Quickshell
import QtQuick

PopupWindow {
    visible: false
    
    property bool open: false

    Behavior on implicitHeight { NumberAnimation { duration: 500; easing.type: Easing.InOutCubic } }
    Behavior on implicitWidth { NumberAnimation { duration: 500; easing.type: Easing.InOutCubic } }

    onOpenChanged: {
        if (open) {
            visible = true
            implicitHeight = popupHeight
            implicitWidth = popupWidth
        } else {
            implicitHeight = 1
            implicitWidth = 1
        }
    }

    onImplicitHeightChanged: {
        if (!open && implicitHeight === 1) {
            visible = false
        }
    }

    color: "transparent"
}
