import QtQuick 2.0
import QtQuick.Controls 2.5

Item {

    signal closeBtnClicked
    signal addNewDish(var newDish)

    property bool errorMsg: false

    Text {
        id: header
        color: "#ffffff"
        text: "Add new dish"
        font.pixelSize: 40
        font.capitalization: Font.AllUppercase
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 20
        }
    }

    RoundBtn {
        btnContent: "x"
        anchors {
            right: parent.right
            verticalCenter: header.verticalCenter
            rightMargin: 20
        }

        onBtnClicked: {
            closeBtnClicked()
        }
    }

    CustomTextInput {

        id: txtInput1
        textInputContent: "Dish..."

        anchors {
            top: header.bottom
            topMargin: 40
            horizontalCenter: header.horizontalCenter
        }
    }

    CustomTextInput {

        id: txtInput2
        textInputContent: "Path..."
        anchors {
            top: txtInput1.bottom
            topMargin: 10
            horizontalCenter: header.horizontalCenter
        }
    }

    RoundButton {
        id: addBtn
        text: "Add"
        radius: 5
        width: 100
        font.capitalization: Font.AllUppercase
        anchors {
            top: txtInput2.bottom
            topMargin: 50
            horizontalCenter: header.horizontalCenter
        }

        onClicked: {
            const newDish = {
                "foodName": txtInput1.textInputContent,
                "imagePath": txtInput2.textInputContent
            }
            addNewDish(newDish)
        }
    }

    Text {
        id: error
        visible: errorMsg
        //width: 100
        height: 40
        color: "red"
        font.pixelSize: 20
        text: "wrong image path"
        anchors {
            top: addBtn.bottom
            topMargin: 20
            left: parent.left
            //horizontalCenter: addBtn.horizontalCenter
            leftMargin: ( parent.width - error.width ) / 2
        }
    }
}







