import QtQuick
import QtQuick.Controls
import QtQuick.Effects

Rectangle {
    id: button
    width: 60
    height: parent.height // Button takes the full width of its parent (sidebar width)
    color: buttonColor  // Dynamically set the color based on the state

    // Dynamic properties for button colors
    property color normalColor: "#222"      // Default color when button is not hovered or checked
    property color hoveredColor: "#555"     // Color when button is hovered

    // Icon source and checked state
    property alias iconSource: icon.source   // Allows you to dynamically set the icon's source
    property bool hovered: false            // Tracks if the mouse is hovering over the button

    signal clicked()                        // Signal emitted when the button is clicked

    // Dynamically calculate the button's color based on its state
    property color buttonColor: hovered ? hoveredColor : normalColor

    // MouseArea for detecting user interaction
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            button.clicked()
        }
        onEntered:{
            hovered = true
        }
        onExited: {
            hovered = false
        }
    }

    // Image for the button icon
    Image {
        id: icon
        anchors.centerIn: parent
        width: 32
        height: 32
        source: iconSource
        fillMode: Image.PreserveAspectFit
    }

    MultiEffect {
        id: overlayImg
        source: icon
        anchors.fill: icon
        brightness: 1.0
        colorization: 1.0
        colorizationColor: "white"
    }

    // Animation for color change
    Behavior on color {
        ColorAnimation {
            duration: 200
            easing.type: Easing.InOutQuad
        }
    }

    // Animation for visibility of indicator
    Behavior on visible {
        NumberAnimation {
            duration: 150
            easing.type: Easing.InOutQuad
        }
    }
}
