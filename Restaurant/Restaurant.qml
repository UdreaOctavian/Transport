import QtQuick 2.12
import QtQuick.Window 2.12

Window {

    readonly property int windowWidth: 920
    readonly property int windowHeight: 768
    property string imgPath

    id: root
    visible: true
    width: windowWidth
    height: windowHeight
    title: qsTr("Restaurant Menu")

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#102542"
    }

    Loader {
        id: loader
        sourceComponent: homePage
    }

    RestaurantModel {
        id: myModel

        onCountChanged: {
            if (myModel.count)
                //currentImage.source = myModel.get(0).imagePath
                imgPath = myModel.get(0).imagePath
            else
                //currentImage.source = "error.jpg"
                imgPath = "error.jpg"
        }
    }

    Component {
        id: homePage

        HomePage {

            width: windowWidth
            height: windowHeight
            listModel: myModel
            currentImgPath: imgPath

            onAddBtnClicked: {
                loader.sourceComponent = addDishPage
            }
        }
    }

    Component {
        id: addDishPage

        AddDishPage {
            width: windowWidth
            height: windowHeight

            onCloseBtnClicked: {
                loader.sourceComponent = homePage
            }

            onAddNewDish: {

                if (newDish.imagePath.startsWith("./assets/")) {
                    myModel.append(newDish)
                    loader.sourceComponent = homePage
                } else {
                    errorMsg = true
                }
            }
        }
    }
}
