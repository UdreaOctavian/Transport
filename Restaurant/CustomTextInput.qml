import QtQuick 2.0

Item {

    property alias textInputContent: content.text

    width: 200
    height: 30

    TextInput {
        id: content

        width: parent.width - 15
        height: parent.height - 5
        color: "#ffffff"
        font.pixelSize: 24
        anchors.centerIn: parent

        onFocusChanged: {
            if(focus == true)
                content.text = ""
        }
    }

    Rectangle {
        color: "#fff"
        width: parent.width
        height: 1
        anchors {
            top: parent.bottom
        }
    }  
}

