import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1

Page {
    id: onboardingPage

    width: parent.width
    height: parent.height
    backgroundColor: customBackgroundColor
    allowedOrientations: Orientation.Portrait


    Image {
        id: splashImage
        source: "qrc:/Onboarding3Background.png"

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Theme.paddingLarge + Theme.dp(490)

    }

    Text {
        id: devText
        text: "ACTIONS IS THE"
        color: whiteColor
        font.pixelSize: Theme.fontSizeExtraLarge + Theme.dp(8)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: splashImage.bottom
        anchors.topMargin: Theme.paddingLarge + Theme.dp(14)
    }

    Text {
        id: startJourneyText
        text: "KEY TO ALL SUCCESS"
        color: whiteColor
        font.pixelSize: Theme.fontSizeExtraLarge + Theme.dp(8)
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: devText.bottom
    }

    MyButton{
        anchors.top: startJourneyText.bottom
        anchors.topMargin: Theme.paddingLarge + Theme.dp(72)
        anchors.horizontalCenter: parent.horizontalCenter
        buttonHeight: Theme.itemSizeExtraSmall
        buttonWidth: Theme.itemSizeMedium * 3
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
        anchors.bottomMargin: Theme.paddingLarge + Theme.dp(72)
        spacing: Theme.paddingLarge

        Rectangle {
            width: Theme.itemSizeExtraSmall - Theme.dp(30)
            height: Theme.itemSizeExtraSmall - Theme.dp(60)
            color: grayColor
            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
        }

        Rectangle {
            width: Theme.itemSizeExtraSmall - Theme.dp(30)
            height: Theme.itemSizeExtraSmall - Theme.dp(60)
            color: grayColor
            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
        }

        Rectangle {
            width: Theme.itemSizeSmall
            height: Theme.itemSizeExtraSmall - Theme.dp(60)
            color: greenColor
            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
        }
    }
}
