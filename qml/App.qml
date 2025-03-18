// Copyright (c) 2025 Luca-G49
// Distribuited under the MIT License. See the LICENSE file for more details.

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: app
    width: parent.width
    height: parent.height

    property string currentPage: "MainView"

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Sidebar {
            id: appSidebar
            Layout.fillHeight: true

            onPageSelected: (page) => {
                var component = Qt.createComponent("pages/" + page + ".qml");
                if (component.status === Component.Ready) {
                    currentPage = page;
                } else {
                    console.warn("Page " + page + " not exists!");
                }
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0

            Header {
                id: appHeader
                Layout.fillWidth: true
            }

            Rectangle {
                id: appContent
                Layout.fillWidth: true
                Layout.fillHeight: true

                Loader {
                    id: pageLoader
                    anchors.fill: parent
                    source: "pages/" + currentPage + ".qml"
                }
            }
        }
    }
}

