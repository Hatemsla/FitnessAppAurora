import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    id: onboardingPage

    width: parent.width
    height: parent.height
    backgroundColor: customBackgroundColor


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
        color: whiteColor
        font.pixelSize: Theme.dp(48)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: splashImage.bottom
        anchors.topMargin: Theme.dp(36)
    }

    Text {
        id: startJourneyText
        text: "KEY TO ALL SUCCESS"
        color: whiteColor
        font.pixelSize: Theme.dp(48)
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: devText.bottom
    }

    MyButton{
        anchors.top: startJourneyText.bottom
        anchors.topMargin: Theme.dp(96)
        anchors.horizontalCenter: parent.horizontalCenter
        buttonHeight: 80
        buttonWidth: 300
        buttonRadius: 48
        buttonColor: greenColor
        iconSource: "qrc:/chevron-right.png"
        buttonText: "Start Now"


        onCustomClicked: pageStack.replace("GenderPage.qml")
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
            color: grayColor
            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
        }

        Rectangle {
            width: 40
            height: 10
            color: grayColor
            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
        }

        Rectangle {
            width: 80
            height: 10
            color: greenColor
            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
        }
    }
}
