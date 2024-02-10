import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "activityLevelPage"
    id: activityLevelPage
    allowedOrientations: Orientation.Portrait
    backgroundColor: customBackgroundColor

    property int _currentIndex: 2

    Text {
        id: tellText
        text: "Your regular physical activity level?".toUpperCase()
        color: whiteColor
        font.pixelSize: Theme.fontSizeLarge + Theme.dp(4)
        wrapMode: Text.Wrap
        font.bold: true
        anchors.left: parent.left
        anchors.right: parent.right
        horizontalAlignment: Text.AlignHCenter
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
        id: goalsListView
        width: parent.width
        anchors.top: toGiveText.bottom
        anchors.bottom: nextPage.top
        anchors.topMargin: Theme.paddingLarge * 10
        anchors.bottomMargin: Theme.paddingLarge * 10

        orientation: ListView.Vertical
        clip: true
        highlight: Rectangle { color: "transparent" }
        focus: true
        snapMode: ListView.SnapToItem
        highlightFollowsCurrentItem: true
        spacing: 0

        model: ListModel {

            Component.onCompleted: {
                append({ "text": "" })
                append({ "text": "" })
                append({ "text": "Rookie" })
                append({ "text": "Beginner" })
                append({ "text": "Intermediate" })
                append({ "text": "Advance" })
                append({ "text": "True Beast" })
                append({ "text": "" })
                append({ "text": "" })
            }
        }

        delegate: Rectangle {
            width: parent.width
            height: goalsListView.height / 5
            color: "transparent"

            function handleOpacityValue(index) {
                var offDistance = _currentIndex - index
                var distance = Math.abs(_currentIndex - index)
                if(goalsListView.model.get(_currentIndex - offDistance).text === "")
                    return 0;

                if (distance == 0)
                    return 1.0;
                else if (distance == 1)
                    return 0.6;
                else
                    return 0.4;
            }

            function handleSizeValue(index) {
                var distance = Math.abs(_currentIndex - index);
                if (distance == 0)
                    return Theme.fontSizeMedium + Theme.dp(24);
                else if (distance == 1)
                    return Theme.fontSizeSmall + Theme.dp(16);
                else if (distance == 2)
                    return Theme.fontSizeSmall + Theme.dp(10);
                else
                    return Theme.fontSizeExtraSmall + Theme.dp(12);
            }

            Text {
                id: modelText
                text: model.text
                font.pixelSize: handleSizeValue(index)
                color: "white"
                opacity: handleOpacityValue(index)
                anchors.centerIn: parent
            }
        }

        onContentYChanged: {
            _currentIndex = goalsListView.indexAt(contentX, contentY) + 2
        }
    }


    Column{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: Theme.paddingLarge + Theme.dp(598)
        spacing: Theme.itemSizeMedium

        Rectangle{
            height: Theme.itemSizeExtraSmall - Theme.dp(65)
            width: Theme.itemSizeExtraLarge * 3
            color: greenColor
        }

        Rectangle{
            height: Theme.itemSizeExtraSmall - Theme.dp(65)
            width: Theme.itemSizeExtraLarge * 3
            color: greenColor
        }
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

        onCustomClicked: pageStack.replace("GoalPage.qml")
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
        buttonText: "Start"


        onCustomClicked: pageStack.replace("MainPage.qml")
    }
}
