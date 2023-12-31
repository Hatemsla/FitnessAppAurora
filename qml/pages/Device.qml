import QtQuick 2.0

Item {
    property string deviceName

    height: 80
    width: parent.width

    Rectangle{
        height: parent.height
        width: parent.width

        color: "transparent"

        Text {
            id: itemName
            text: deviceName
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: 24
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
