import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

RowLayout {
    spacing: 8
    anchors.verticalCenter: parent.verticalCenter

    Repeater {
        model: Hyprland.workspaces

        Rectangle {
            Layout.preferredWidth: modelData.active ? 50 : 16
            Layout.alignment: Qt.AlignHCenter

            height: 16
            radius: 20

            color: modelData.active ? "white" : mouseArea.containsMouse ? "#bbbbbb" : "gray"

            border.color: modelData.active ? color : ""
            border.width: 2

            Behavior on Layout.preferredWidth { NumberAnimation { duration: 150 } }
            Behavior on color { ColorAnimation { duration: 250 } }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                onClicked: modelData.activate()
                hoverEnabled: true
            }
        }
    }
}
