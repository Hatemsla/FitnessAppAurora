import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: splashPage

    width: parent.width
    height: parent.height
    backgroundColor: _backgroundColor

    property string _backgroundColor: "#1c1c1e"
    property string _textColor: "#d0fd3e"

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
        color: _textColor
        font.pixelSize: Theme.dp(96)
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: splashImage.bottom
        anchors.topMargin: Theme.paddingLarge
    }

    Text {
        text: "MUSCLES"
        color: _textColor
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
