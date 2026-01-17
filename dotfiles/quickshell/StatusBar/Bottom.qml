import QtQuick
import "Items" as Items

Row {
    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left
    anchors.right: parent.right

    Items.Workspaces {
        anchors.left: parent.left
    }

    Rectangle {
        width: 120; height: 35
        color: mouseArea.containsMouse ? "#333333" : "transparent"
        radius: 20

        Behavior on color { ColorAnimation { duration: 150 } }

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: controlCenter.open = !controlCenter.open
        }

        Items.Clock {}
    }
}
