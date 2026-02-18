import Quickshell.Wayland
import QtQuick
import Quickshell
import Quickshell.Io

Row {
    Repeater {
        model: ToplevelManager.toplevels

        delegate: Rectangle {
            width: 40; height: 35
            radius: 8
            color: mouseArea.containsMouse ? "#333333" : "transparent"

            Image {
                source: Quickshell.iconPath(modelData.appId)
                width: 32
                height: 32
                sourceSize.width: 32
                sourceSize.height: 32
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                cache: true
            }
           
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                  if (modelData.activated) {
                      modelData.minimized = true;
                  } else {
                      modelData.activate();
                  }
                }
            }
        }
    }
}