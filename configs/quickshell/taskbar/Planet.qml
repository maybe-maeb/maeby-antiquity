import QtQuick
import QtQuick.Effects

Item {
    id: root

    property real angle
    property real distance
    property point center
    property int size: 50

    signal clicked()

    property point pos: Qt.point(
        center.x + Math.cos((angle - 90) * Math.PI / 180) * distance,
        center.y + Math.sin((angle - 90) * Math.PI / 180) * distance
    )

    x: pos.x - width / 2
    y: pos.y - height / 2

    width: size
    height: size

    RectangularShadow {
        anchors.centerIn: parent
        width: size * 0.6
        height: size * 0.6
        radius: width / 2
        blur: 16
    }

    // All children declared inside Planet {} are put here.
    default property alias content: contentItem.data

    Item {
        id: contentItem
        anchors.fill: parent
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onClicked: root.clicked()

        HoverHandler {
            acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
            cursorShape: Qt.PointingHandCursor
        }
    }
}