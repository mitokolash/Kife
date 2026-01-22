import Quickshell
import QtQuick

PopupWindow {
    visible: false

    property bool open: false
    property int popupHeight
    property int popupWidth

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
