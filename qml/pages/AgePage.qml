import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "agePage"
    id: agePage
    allowedOrientations: Orientation.All

    backgroundColor: customBackgroundColor

    property int _currentIndex: 3

    Text {
        id: tellText
        text: "HOW OLD ARE YOU ?"
        color: whiteColor
        font.pixelSize: Theme.dp(36)
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: Theme.dp(96)
    }

    Text {
        id: toGiveText
        text: "THIS HELPS US CREATE YOUR PERSONALIZED PLAN"
        color: whiteColor
        font.pixelSize: Theme.dp(24)
        wrapMode: Text.Wrap
        horizontalAlignment: Text.AlignHCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: tellText.bottom
        anchors.topMargin: Theme.dp(24)
    }

    ListView {
        id: numberListView
        width: parent.width
        anchors.top: toGiveText.bottom
        anchors.bottom: nextPage.top
        anchors.topMargin: Theme.dp(64)
        anchors.bottomMargin: Theme.dp(64)

        model: ListModel {

            Component.onCompleted: {
                append({ "number": -1 })
                append({ "number": -1 })
                append({ "number": -1 })
                for (var i = 6; i <= 100; ++i) {
                    append({ "number": i });
                }
                append({ "number": -1 })
                append({ "number": -1 })
                append({ "number": -1 })
            }
        }

        delegate: Rectangle {
            width: parent.width
            height: numberListView.height / 7
            color: "transparent"

            function handleOpacityValue(index) {
                var offDistance = _currentIndex - index
                var distance = Math.abs(_currentIndex - index)
                if(numberListView.model.get(_currentIndex - offDistance).number === -1)
                    return 0;

                if (distance == 0)
                    return 1.0;
                else if (distance == 1)
                    return 0.6;
                else if (distance == 2)
                    return 0.4;
                else
                    return 0.2;
            }

            function handleSizeValue(index) {
                var distance = Math.abs(_currentIndex - index);
                if (distance == 0)
                    return Theme.dp(64);
                else if (distance == 1)
                    return Theme.dp(56);
                else if (distance == 2)
                    return Theme.dp(48);
                else
                    return Theme.dp(40);
            }

            Text {
                id: modelText
                text: model.number
                font.pixelSize: handleSizeValue(index)
                color: "white"
                opacity: handleOpacityValue(index)
                anchors.centerIn: parent
            }
        }

        onContentYChanged: {
            _currentIndex = numberListView.indexAt(contentX, contentY) + 3
        }

        orientation: ListView.Vertical
        clip: true
        highlight: Rectangle { color: "transparent" }
        focus: true
        snapMode: ListView.SnapToItem
        highlightFollowsCurrentItem: true
        spacing: 0
    }

    Column{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: Theme.dp(606)
        spacing: 100

        Rectangle{
            height: 5
            width: 120
            color: greenColor
        }

        Rectangle{
            height: 5
            width: 120
            color: greenColor
        }
    }

    MyButton{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Theme.dp(72)
        anchors.left: parent.left
        anchors.leftMargin: Theme.dp(48)
        buttonHeight: 80
        buttonWidth: 80
        buttonRadius: 48
        buttonColor: grayColor
        iconSource: "qrc:/arrow-left.png"

        onCustomClicked: pageStack.replace("GenderPage.qml")
    }

    MyButton{
        id: nextPage
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Theme.dp(72)
        anchors.right: parent.right
        anchors.rightMargin: Theme.dp(48)
        buttonHeight: 80
        buttonWidth: 220
        buttonRadius: 48
        buttonColor: greenColor
        iconSource: "qrc:/chevron-right.png"
        buttonText: "Next"


        onCustomClicked: pageStack.replace("MainPage.qml")
    }
}
