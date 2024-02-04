import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "genderPage"
    allowedOrientations: Orientation.All
    id: genderPage

    backgroundColor: _backgroundColor

    property string _backgroundColor: "#1c1c1e"
    property string _greenColor: "#d0fd3e"
    property string _whiteColor: "#ffffff"
    property string _grayColor: "#3a3a3c"
    property string _disableGenderColor: "#2c2c2e"
    property string _blackColor: "#000000"

    Text {
        id: tellText
        text: "TELL US ABOUTN YOURSELF!"
        color: _whiteColor
        font.pixelSize: Theme.dp(36)
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: Theme.dp(96)
    }

    Text {
        id: toGiveText
        text: "TO GIVE YOU A BETTER EXPERIENCE WE NEED TO KNOW YOUR GENDER"
        color: _whiteColor
        font.pixelSize: Theme.dp(24)
        wrapMode: Text.Wrap
        horizontalAlignment: Text.AlignHCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: tellText.bottom
        anchors.topMargin: Theme.dp(24)
    }


    MouseArea {
        anchors.top: toGiveText.bottom
        anchors.topMargin: Theme.dp(128)
        anchors.horizontalCenter: parent.horizontalCenter

        id: maleMouseArea
        width: 280
        height: 280

        onClicked: {
            maleCircle.color = _greenColor
            femaleCircle.color = _disableGenderColor
            maleImage.source = "qrc:/black-male-icon.png"
            maleText.color = _blackColor
            femaleImage.source = "qrc:/white-female-icon.png"
            femaleText.color = _whiteColor
        }

        Rectangle {
            id: maleCircle
            radius: 280
            color: _greenColor
            anchors.fill: maleMouseArea

            Image {
                id: maleImage
                source: "qrc:/black-male-icon.png"
                anchors.centerIn: maleCircle
                width: 100
                height: 100
            }

            Text {
                id: maleText
                text: "Male"
                color: _blackColor
                anchors.bottom: parent.bottom
                anchors.bottomMargin: Theme.dp(28)
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    MouseArea {
        anchors.top: maleMouseArea.bottom
        anchors.topMargin: Theme.dp(72)
        anchors.horizontalCenter: parent.horizontalCenter

        id: femaleMouseArea
        width: 280
        height: 280

        onClicked: {
            maleCircle.color = _disableGenderColor
            femaleCircle.color = _greenColor
            maleImage.source = "qrc:/white-male-icon.png"
            maleText.color = _whiteColor
            femaleImage.source = "qrc:/black-female-icon.png"
            femaleText.color = _blackColor
        }

        Rectangle {
            id: femaleCircle
            radius: 280
            color: _disableGenderColor
            anchors.fill: femaleMouseArea

            Image {
                id: femaleImage
                source: "qrc:/white-female-icon.png"
                anchors.centerIn: femaleCircle
                width: 100
                height: 100
            }

            Text {
                id: femaleText
                text: "Male"
                color: _whiteColor
                anchors.bottom: parent.bottom
                anchors.bottomMargin: Theme.dp(28)
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    MyButton{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Theme.dp(72)
        anchors.right: parent.right
        anchors.rightMargin: Theme.dp(48)
        buttonHeight: 80
        buttonWidth: 220
        buttonRadius: 48
        buttonColor: _greenColor
        iconSource: "qrc:/chevron-right.png"
        buttonText: "Next"


        onCustomClicked: pageStack.replace("MainPage.qml")
    }
}
