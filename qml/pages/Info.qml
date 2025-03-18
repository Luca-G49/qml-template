import QtQuick
import QtQuick.Controls


Item {
    id: pageInfo

    Rectangle {
        color: "lightgray"
        anchors.fill: parent

        Text {
            text: "Welcome to Info Page!"
            anchors.centerIn: parent
        }
    }
}
