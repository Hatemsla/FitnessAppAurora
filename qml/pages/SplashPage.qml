import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: splashPage

    width: parent.width
    height: parent.height
    backgroundColor: customBackgroundColor

    Image {
        id: splashImage
        source: "qrc:/splash-icon.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -Theme.dp(64)
    }

    Text {
        id: devText
        text: "DEV"
        color: greenColor
        font.pixelSize: Theme.dp(96)
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: splashImage.bottom
        anchors.topMargin: Theme.paddingLarge
    }

    Text {
        text: "MUSCLES"
        color: greenColor
        font.pixelSize: Theme.dp(72)
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: devText.bottom
    }

    Timer{
        id: splashTimer
        interval: 3000
        repeat: false
        onTriggered: {
            pageStack.replace("Onboarding1Page.qml")
        }
    }

    Component.onCompleted: {
        // Запустить таймер после завершения инициализации страницы
        splashTimer.start();
    }
}
