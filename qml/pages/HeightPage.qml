import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "heightPage"
    id: heightPage
    allowedOrientations: Orientation.Portrait

    backgroundColor: customBackgroundColor

    property int _currentIndex: 3

    Text {
        id: tellText
        text: "WHAT’S YOUR HEIGHT?"
        color: whiteColor
        font.pixelSize: Theme.fontSizeLarge + Theme.dp(4)
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: Theme.paddingLarge + Theme.dp(72)
    }

    Text {
        id: toGiveText
        text: "THIS HELPS US CREATE YOUR PERSONALIZED PLAN"
        color: whiteColor
        font.pixelSize: Theme.fontSizeSmall
        wrapMode: Text.Wrap
        horizontalAlignment: Text.AlignHCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: tellText.bottom
        anchors.topMargin: Theme.paddingLarge + Theme.dp(2)
    }

    ListView {
        id: numberListView
        width: parent.width
        anchors.top: toGiveText.bottom
        anchors.bottom: nextPage.top
        anchors.topMargin: Theme.paddingLarge + Theme.dp(42)
        anchors.bottomMargin: Theme.paddingLarge + Theme.dp(42)

        model: ListModel {

            Component.onCompleted: {
                append({ "number": -1 })
                append({ "number": -1 })
                append({ "number": -1 })
                for (var i = 120; i <= 220; ++i) {
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
                    return Theme.fontSizeMedium + Theme.dp(38);
                else if (distance == 1)
                    return Theme.fontSizeMedium + Theme.dp(34);
                else if (distance == 2)
                    return Theme.fontSizeSmall + Theme.dp(26);
                else
                    return Theme.fontSizeExtraSmall + Theme.dp(18);
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
        anchors.topMargin: Theme.paddingLarge + Theme.dp(584)
        spacing: Theme.itemSizeSmall + Theme.dp(6)

        Rectangle{
            height: Theme.itemSizeExtraSmall - Theme.dp(65)
            width: Theme.itemSizeMedium * 2
            color: greenColor
        }

        Rectangle{
            height: Theme.itemSizeExtraSmall - Theme.dp(65)
            width: Theme.itemSizeMedium * 2
            color: greenColor
        }
    }

    Text{
        id: cmText
        anchors.right: parent.right
        anchors.rightMargin: Theme.paddingLarge + Theme.dp(198)
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.topMargin: Theme.paddingLarge + Theme.dp(630)
        text: "cm"
        font.pixelSize: Theme.fontSizeSmall
        color: whiteColor
    }

    MyButton{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Theme.paddingLarge + Theme.dp(50)
        anchors.left: parent.left
        anchors.leftMargin: Theme.paddingLarge + Theme.dp(26)
        buttonHeight: 80
        buttonWidth: 80
        buttonRadius: 48
        buttonColor: grayColor
        iconSource: "qrc:/arrow-left.png"

        onCustomClicked: pageStack.replace("WeightPage.qml")
    }

    MyButton{
        id: nextPage
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Theme.paddingLarge + Theme.dp(50)
        anchors.right: parent.right
        anchors.rightMargin: Theme.paddingLarge + Theme.dp(26)
        buttonHeight: 80
        buttonWidth: 220
        buttonRadius: 48
        buttonColor: greenColor
        iconSource: "qrc:/chevron-right.png"
        buttonText: "Next"


        onCustomClicked: pageStack.replace("MainPage.qml")
    }
}

