import QtQuick 2.0

Item {

    signal addBtnClicked

    property var listModel
    property string currentImgPath

    Text {
        id: header
        color: "#ffffff"
        text: "Menu"
        font.pixelSize: 40
        font.capitalization: Font.AllUppercase
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 20
        }
    }

    RoundBtn {
        btnContent: "+"
        anchors {
            right: parent.right
            verticalCenter: header.verticalCenter
            rightMargin: 20
        }

        onBtnClicked: {
            addBtnClicked()
        }
    }

    PhotoItem {
        id: currentImage
        source: listModel.count > 0 ? listModel.get(0).imagePath : "error.jpg"
        width: 500
        height: 300
        anchors {
            horizontalCenter: header.horizontalCenter
            top: header.bottom
            topMargin: 20
        }
    }

    Rectangle {

        id: listWrapper

        width: parent.width
        color: "transparent"
        anchors {
            horizontalCenter: currentImage.horizontalCenter
            top: currentImage.bottom
            topMargin: 20
            bottom: parent.bottom
            bottomMargin: 10
        }

        ListView {

            width: listWrapper.width
            height: listWrapper.height
            clip: true
            boundsBehavior: Flickable.StopAtBounds
            anchors.centerIn: listWrapper
            model: listModel
            delegate: MenuItem {
                dishName: model.foodName
                rotationDegree: index % 2 ? 135 : 45
                color: itemHovered ? "#22c6d9ec" : "transparent"

                onItemClicked: {
                    currentImage.source = model.imagePath
                }

                onItemLongPressed: {
                    listModel.remove(index)
                    currentImage.source = currentImgPath
                }
            }
        }
    }
}
