import QtQuick

Row {
    spacing: 10
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
        
    Text {
        id: clock
        text: Qt.formatTime(new Date(), "hh:mm")
        color: "white"
        font.pixelSize: 17
        font.family: "Noto Sans"
        font.styleName: "Bold"

        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: clock.text = Qt.formatTime(new Date(), "hh:mm")
        }
    }

    Text {
        id: date
        text: Qt.formatDate(new Date(), "ddd d")
        color: "gray"
        font.pixelSize: 12
        font.family: "Noto Sans"
        font.styleName: "Bold"
        anchors.verticalCenter: parent.verticalCenter
    }
}
