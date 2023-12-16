import QtQuick 2.0

Item {
    property string deviceName
    // Для разных устройств разные комментарии
    property string shortComment

    height: 80
    width: parent.width

    Rectangle{
        height: parent.height
        width: parent.width
        color: "transparent"

        Text {
            id: itemName
            text: deviceName
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
        }



    }
}
