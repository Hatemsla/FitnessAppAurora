import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    id: onboardingPage

    width: parent.width
    height: parent.height
    backgroundColor: _backgroundColor

    property string _backgroundColor: "#1c1c1e"
    property string _greenColor: "#d0fd3e"
    property string _whiteColor: "#ffffff"
    property string _grayColor: "#3a3a3c"


    Image {
        id: splashImage
        source: "qrc:/Onboarding3Background.png"

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Theme.dp(512)

    }

    Text {
        id: devText
        text: "ACTIONS IS THE"
        color: _whiteColor
        font.pixelSize: Theme.dp(48)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: splashImage.bottom
        anchors.topMargin: Theme.dp(36)
    }

    Text {
        id: startJourneyText
        text: "KEY TO ALL SUCCESS"
        color: _whiteColor
        font.pixelSize: Theme.dp(48)
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: devText.bottom
    }

    MouseArea {
        anchors.top: startJourneyText.bottom
        anchors.topMargin: Theme.dp(96)
        anchors.horizontalCenter: parent.horizontalCenter
        height: 80
        width: 300

        onClicked: {
            pageStack.replace("MainPage.qml")
        }

        Rectangle {
            anchors.fill: parent
            color: _greenColor
            radius: 48

            Row {
                anchors.centerIn: parent
                spacing: 8

                Text {
                    id: startText
                    text: "Start Now"
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }

                Image {
                    source: "qrc:/chevron-right.png"
                    height: 36
                    width: 36
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }

    RowLayout {
        id: bottomContainers
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: Theme.dp(96)
        spacing: 24

        Rectangle {
            width: 40
            height: 10
            color: _grayColor
            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
        }

        Rectangle {
            width: 40
            height: 10
            color: _grayColor
            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
        }

        Rectangle {
            width: 80
            height: 10
            color: _greenColor
            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
        }
    }
}
