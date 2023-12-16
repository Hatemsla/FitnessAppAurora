import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All
    backgroundColor: "#121212"
    id: pagea

    property string defaultSurfaceColor: "#10FFFFFF"

    Rectangle {
        id: appbar

        color: defaultSurfaceColor
        width: parent.width
        height: 100

        anchors.top: parent.top
        Text {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            text: "Главная"
        }
    }

    Rectangle{
        width: Screen.width
        height: Screen.height
        anchors.top: appbar.bottom
        anchors.topMargin: 24
        color: "transparent"

        SilicaFlickable{

            clip: true
            width: parent.width
            height: parent.height
            contentWidth: Screen.width
            contentHeight: ((Screen.height-appbar.height-10)/2)+((Screen.height-appbar.height-10)/3)*2.5-40
            boundsBehavior: SilicaFlickable.StopAtBounds

            Rectangle{
            id: viewContainer
            color: "transparent"
            width: parent.width

            Rectangle {
                id: userMetrics
                radius: 24
                width: parent.width
                height: ((Screen.height-appbar.height)/2-10)
                anchors.margins: 16
                color: defaultSurfaceColor
                anchors.top: appbar.bottom
                anchors.left: parent.left
                anchors.right: parent.right

                Text {
                    anchors.top: parent.top
                    anchors.topMargin: 24
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Ваши показатели"
                    color: "White"
                }
            }

            Rectangle {
                id: userActivities
                radius: 24
                width: parent.width
                height: (Screen.height-appbar.height)/3-10
                anchors.margins: 16
                color: defaultSurfaceColor
                anchors.top: userMetrics.bottom
                anchors.left: parent.left
                anchors.right: parent.right

                Text {
                    anchors.top: parent.top
                    anchors.topMargin: 24
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Возможные активности"
                    color: "White"
                }
            }



            Rectangle {
            id: userDevices
            radius: 24
            width: parent.width
            height: (Screen.height-appbar.height)/3-10
            anchors.margins: 16
            color: defaultSurfaceColor
            anchors.top: userActivities.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            Text {
                anchors.top: parent.top
                anchors.topMargin: 24
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Ваши устройства"
                color: "White"
            }

            Button {
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.margins: 28
                width: 30
                height: width
                icon.source: "qrc:/plus-svgrepo-com.svg"
                icon.width: 30
                icon.height: 30
                highlightBackgroundColor: "transparent"
                backgroundColor: "transparent"
                highlightColor: "transparent"
                onClicked: {
                    windowApp.openPage("AddDevicePage.qml")
                }
            }
        }
    }



//    Button{
//        color: "white"
//        text: "go to other page"
//        backgroundColor: defaultSurfaceColor
//        onClicked: windowApp.openPage("AddDevicePage.qml")
//    }
    }

    }



}
