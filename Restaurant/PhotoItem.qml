import QtQuick 2.0
import QtGraphicalEffects 1.0

Image {

    id: image
    anchors.horizontalCenter: parent.horizontalCenter
    layer.enabled: true
    layer.effect: OpacityMask {
        maskSource: Rectangle {
            width: image.width
            height: image.height
            radius: 20
        }
    }

}
