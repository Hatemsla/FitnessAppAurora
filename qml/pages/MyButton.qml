import QtQuick 2.0
import Sailfish.Silica 1.0


MouseArea {
    id: mouseArea

    signal customClicked

    property alias buttonText: startText.text
    property alias buttonColor: rect.color
    property alias buttonRadius: rect.radius
    property alias buttonHeight: mouseArea.height
    property alias buttonWidth: mouseArea.width
    property alias iconSource: icon.source

    onClicked: {
        customClicked();
    }

    Rectangle {
        id: rect
        anchors.fill: mouseArea

        Row {
            anchors.centerIn: rect
            spacing: 8

            Text {
                id: startText
                anchors.verticalCenter: rect.verticalCenter
                font.bold: true
            }

            Image {
                id: icon
                height: 36
                width: 36
                anchors.verticalCenter: rect.verticalCenter
            }
        }
    }
}

