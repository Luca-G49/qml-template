// Copyright (c) 2025 Luca-G49
// Distribuited under the MIT License. See the LICENSE file for more details.

import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtCore

ApplicationWindow {
    id: appWindow
    x: 100
    y: 100
    width: 1920
    height: 1080
    minimumWidth: 800
    minimumHeight: 560
    visible: true
    visibility: Window.Maximized
    title: qsTr("qml-template")

    // Load app layout
    App { }
}


