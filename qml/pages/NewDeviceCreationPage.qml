import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0


Page {
    objectName: "newDeviceCreationPage"
    allowedOrientations: Orientation.All
    backgroundColor: "#121212"
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
            text: "Добавление устройства"
        }


    }

    Text{
        id: lablelNewDeviceName
        text: "Название устройства"
        anchors.top: appbar.bottom
        anchors.topMargin: 24
        anchors.left: parent.left
        anchors.leftMargin: 32
        color: "white"

    }

    TextArea {
        id: etxtNewDeviceName
        anchors.top: lablelNewDeviceName.bottom
        color: "white"
        anchors.margins: 8
        width: parent
        height: parent
    }

    Button{
        backgroundColor: "#20FFFFFF"
        color: "white"
        highlightBackgroundColor: "#30FFFFFF"
        text: "Добавить"
        highlightColor: "white"
        onClicked: {
            windowApp.addDeviceToHome(etxtNewDeviceName.text)
            windowApp.openHomePage()
        }
        anchors.top: etxtNewDeviceName.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 32
        anchors.rightMargin: 32
    }

}
