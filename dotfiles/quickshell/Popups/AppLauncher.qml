import QtQuick
import QtQuick.Layouts
import Quickshell
import QtQuick.Controls
import Quickshell.Hyprland

Rectangle {
    anchors.fill: parent
    radius: 20
    color: "#111111"
    focus: true

    HyprlandFocusGrab {
        active: applauncher.visible
        windows: [applauncher]
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 12
        spacing: 8

        TextField {
            id: searchInput
            placeholderText: "Search Apps..."
            focus: true
            color: "white"
            placeholderTextColor: "#bbbbbb"
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            font.pixelSize: 15
            font.family: "Inter"
            font.styleName: "semibold"

            padding: 10

            background: Rectangle {
                color: "#222222"
                radius: 20

                border.color: "gray"
                border.width: 2
            }

            onTextChanged: appsList.currentIndex = 0

            Keys.onPressed: (event) => {
                if (event.key === Qt.Key_Down) {
                    appsList.incrementCurrentIndex();
                    event.accepted = true;
                } else if (event.key === Qt.Key_Up) {
                    appsList.decrementCurrentIndex();
                    event.accepted = true;
                } else if (event.key === Qt.Key_Enter || event.key === Qt.Key_Return) {
                    if (appsList.currentItem) {
                        appsList.currentItem.launch();
                    }
                    event.accepted = true;
                } else if (event.key === Qt.Key_Escape) {
                    applauncher.open = false
                }
            }
        }

        ListView {
            id: appsList
            Layout.fillWidth: true
            Layout.fillHeight: true
            focus: true
            clip: true
            currentIndex: 0

            model: ScriptModel {
                values: DesktopEntries.applications.values.filter(entry =>
                    entry.name.toLowerCase().includes(searchInput.text.toLowerCase())
                )
            }

            delegate: Item {
                id: delegateItem
                width: appsList.width
                height: 48

                function launch() {
                    modelData.execute();
                    applauncher.open = false;
                }

                Rectangle {
                    anchors.fill: parent
                    color: delegateItem.ListView.isCurrentItem ? "#33ffffff" : "transparent"
                    radius: 20

                    Behavior on color { ColorAnimation { duration: 150 } }

                    RowLayout {
                        spacing: 12
                        anchors.fill: parent

                        Image {
                            source: Quickshell.iconPath(modelData.icon)
                            width: 32
                            height: 32
                            sourceSize.width: 32
                            sourceSize.height: 32
                            fillMode: Image.PreserveAspectFit
                            anchors.left: parent.left
                            anchors.leftMargin: 12
                            cache: true
                        }

                        Text {
                            text: modelData.name
                            font.pixelSize: 16
                            color: "white"
                            anchors.left: parent.left
                            anchors.leftMargin: 52
                        }

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                modelData.execute()
                                applauncher.open = false
                            }
                        }
                    }
                }
            }
        }
    }
}
