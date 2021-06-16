import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {

    property alias dishName: menuItemText.text
    property int rotationDegree
    property alias itemHovered: mouseArea.containsMouse
    signal itemClicked
    signal itemLongPressed

    width: parent.width
    height: 100
    clip: true

    MouseArea {
        id: mouseArea
        hoverEnabled: true
        anchors.fill: parent

        onClicked: {
            itemClicked();
        }

        onPressAndHold: {
            itemLongPressed();
        }
    }

    Rectangle {
        id: borderTop
        width: parent.width - 20
        height: 1
        color: "#44ffffff"
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
        }
    }

    Text {
        id: menuItemText
        color: "#ffffff"
        font {
            family: "Helvetica"
            pixelSize: 24
        }

        anchors {
            left: parent.left
            leftMargin: 40
            verticalCenter: parent.verticalCenter
        }

    }

    Rectangle {
        id: crossLine
        width: 20
        anchors {
            bottomMargin: -40
            topMargin: -40
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            rightMargin: 100
        }
        height: parent.height + 50
        rotation: rotationDegree
        LinearGradient {
            anchors.fill: parent
            start: Qt.point(0, 0)
            end: Qt.point(0, height)
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#CDD7D6" }
                GradientStop { position: 0.35; color: "#999999" }
                GradientStop { position: 0.40; color: "#CDD7D6" }
            }

        }
    }
}
