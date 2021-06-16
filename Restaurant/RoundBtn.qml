import QtQuick 2.0

Rectangle {

    signal btnClicked
    property alias btnContent: btnText.text

    color: "#59C9A5"
    width: 50
    height: 50
    radius: width / 2

    Text {
        id: btnText
        font.pixelSize: 24
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            btnClicked()
        }
    }
}
