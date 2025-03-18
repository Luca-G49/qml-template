import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

Rectangle {
    id: header
    width: parent.width
    height: 60
    color: "#222"

    RowLayout {
        anchors.fill: parent
        anchors.margins: 0

        // App Name
        Text {
            text: "Qml template project"
            color: "white"
            font.bold: true
            font.pixelSize: 18
            Layout.leftMargin: 10
        }

        Item {
            Layout.fillWidth: true
        }

        HeaderButton {
            id: userButtonId
            iconSource: "qrc:/resources/icons/account.svg"
            Layout.rightMargin: 15
            onClicked: {
            }
        }

        Timer {
            interval: 1000  // Aggiorna ogni secondo
            running: true
            repeat: true
            onTriggered: {
                let now = new Date()
                clockText.text = Qt.formatDateTime(now, "hh:mm:ss")
                dateText.text = Qt.formatDateTime(now, "dddd dd MMM yyyy")
            }
        }

        // Date
        Text {
            id: dateText
            text: Qt.formatDateTime(new Date(), "dddd dd MMM yyyy")
            color: "white"
            font.bold: true
            font.pixelSize: 14
            Layout.rightMargin: 15
        }

        // Time
        Text {
            id: clockText
            text: Qt.formatDateTime(new Date(), "hh:mm:ss")
            color: "white"
            font.bold: true
            font.pixelSize: 14
            Layout.rightMargin: 15
        }
    }
}

