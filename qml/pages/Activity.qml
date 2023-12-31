import QtQuick 2.0

Item {
    property string activityName

    height: 60
    width: parent.width

    Rectangle{
        height: parent.height
        width: parent.width
        color: "transparent"

        Text {
            id: itemName
            text: activityName
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: 24
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
