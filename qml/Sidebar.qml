import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

Rectangle {
    id: sidebar
    width: 80
    color: "#333"

    signal pageSelected(string page)

    ColumnLayout{
        anchors.fill: parent
        anchors.topMargin: 30
        spacing: 8

        SidebarButton {
            id: mainViewButtonId
            iconSource: "qrc:/resources/icons/home.svg"
            checked: app.currentPage === "MainView"
            onClicked: {
                pageSelected("MainView")
            }
        }

        SidebarButton {
            id: dataButtonId
            iconSource: "qrc:/resources/icons/computer.svg"
            checked: app.currentPage === "Data"
            onClicked: {
                pageSelected("Data")
            }
        }

        SidebarButton {
            id: deviceButtonId
            iconSource: "qrc:/resources/icons/memory.svg"
            checked: app.currentPage === "Device"
            onClicked: {
                pageSelected("Device")
            }
        }

        Item {
            Layout.fillHeight: true
        }

        SidebarButton {
            id: settingsButtonId
            iconSource: "qrc:/resources/icons/settings.svg"
            checked: app.currentPage === "Settings"
            onClicked: {
                pageSelected("Settings")
            }
        }

        SidebarButton {
            id: infoButtonId
            iconSource: "qrc:/resources/icons/info.svg"
            checked: app.currentPage === "Info"
            onClicked: {
                pageSelected("Info")
            }
        }

        SidebarButton {
            id: exitButtonId
            iconSource: "qrc:/resources/icons/exit.svg"
            onClicked: Qt.quit()
        }

    }
}
