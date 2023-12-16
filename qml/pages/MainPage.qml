import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All
    id: pagea

    Rectangle {
        id: page
        width: pagea.width; height: pagea.height
        color: "#121212"
    }

    Rectangle {
        id: appbar

        color: "#10FFFFFF"
        width: parent.width
        height: 100

        anchors.top: parent.top
        Text {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            text: "Выберите новое устройство"
        }

        // Иконочка возврата на предыдущий экран
    }

    ListModel {
        id: listModel
        ListElement{
            deviceName: "Весы"
            imgSource: "qrc:/watch-svgrepo-com.svg"
        }
        ListElement{
            deviceName: "умный турник блин"
            imgSource: "qrc:/watch-svgrepo-com.svg"
        }
        ListElement{
            deviceName: "умная ванна"
            imgSource: "qrc:/watch-svgrepo-com.svg"
        }
    }


    Rectangle{
        anchors.top: appbar.bottom
        anchors.topMargin: 24
        clip: true
        width: parent.width
        height: parent.height-appbar.height
        color: "transparent"
        ListView{
            anchors.fill: parent
            model: listModel
            delegate: Device{
                name: deviceName
                imageSource: imgSource
            }
        }
    }


}
