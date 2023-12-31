import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "addDevicePage"
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

        Image {
            anchors.left: parent.left
            anchors.leftMargin: 24
            source: "qrc:/next-svgrepo-com.svg"
            width: parent.height/4
            height: width
            anchors.verticalCenter: parent.verticalCenter
            rotation: 180

            MouseArea{
                onClicked: windowApp.navigateBack()
            }
        }
    }

    ListModel {
        id: listModel
        ListElement{
            deviceName: "Весы"
            imgSource: "qrc:/watch-svgrepo-com.svg"
        }
        ListElement{
            deviceName: "Велотренажер"
            imgSource: "qrc:/watch-svgrepo-com.svg"
        }
        ListElement{
            deviceName: "Умные часы"
            imgSource: "qrc:/watch-svgrepo-com.svg"
        }
        // TODO: Добавить больше желментов и картинки к ним всем
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
            delegate: NewDevice{
                name: deviceName
                imageSource: imgSource
            }
        }
    }
}
