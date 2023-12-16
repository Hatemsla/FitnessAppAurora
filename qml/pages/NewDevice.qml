import QtQuick 2.0
import Sailfish.Silica 1.0

Item{
    property string name
    property string imageSource
    width: parent.width
    height: 180

    Rectangle{
        color: "transparent"
        width: parent.width
        height: parent.height

        Rectangle {
            height: parent.height
            width: parent.width
            anchors.fill: parent
            anchors.topMargin: 8
            anchors.bottomMargin: 8
            anchors.leftMargin: 16
            anchors.rightMargin: 16
            color: "#10FFFFFF"
            radius: 24

            Image{
                id: image
                height: parent.height-60
                width: height
                source: imageSource
                anchors.margins: 24
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                id: deviceName
                text: name
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: image.right
                anchors.leftMargin: 20

                color: "white"
            }

            Button{
                width: parent.width
                height: parent.height
                opacity: 0
                color: "transparent"
                backgroundColor: "transparent"
                highlightBackgroundColor: "transparent"
                highlightColor: "transparent"
                onClicked: {
                    console.log("Created " + deviceName.text)
                    windowApp.openPage("NewDeviceCreationPage.qml")
                }
            }


        }
    }
}


