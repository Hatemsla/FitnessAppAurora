import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "weightPage"
    id: weightPage
    allowedOrientations: Orientation.Portrait
    backgroundColor: customBackgroundColor

    property int _currentIndex: 11

    Text {
        id: tellText
        text: "WHAT’S YOUR WEIGHT?"
        color: whiteColor
        font.pixelSize: Theme.fontSizeLarge + Theme.dp(4)
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: Theme.paddingLarge + Theme.dp(72)
    }

    Text {
        id: toGiveText
        text: "YOU CAN ALWAYS CHANGE THIS LATER"
        color: whiteColor
        font.pixelSize: Theme.fontSizeSmall
        wrapMode: Text.Wrap
        horizontalAlignment: Text.AlignHCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: tellText.bottom
        anchors.topMargin: Theme.paddingLarge + Theme.dp(2)
    }

    Row{
        id: weightRow
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: Theme.paddingLarge + Theme.dp(500)
        spacing: Theme.paddingMedium

        Text {
            id: weightText
            text: "54"
            color: whiteColor
            font.pixelSize: Theme.fontSizeMedium + Theme.dp(38);
            wrapMode: Text.Wrap
        }

        Text {
            id: kgText
            text: "kg"
            color: whiteColor
            anchors.bottom: weightText.bottom
            anchors.bottomMargin: Theme.paddingMedium
            font.pixelSize: Theme.fontSizeMedium;
            wrapMode: Text.Wrap
            verticalAlignment: Text.AlignBottom
        }

    }

    ListView {
        id: weightList
        anchors.top: weightRow.bottom
        anchors.bottom: nextPage.top
        anchors.topMargin: Theme.paddingLarge + Theme.dp(12)
        anchors.bottomMargin: Theme.paddingLarge + Theme.dp(342)
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.left: parent.left
        anchors.leftMargin: Theme.paddingLarge * 2
        anchors.right: parent.right
        anchors.rightMargin: Theme.paddingLarge * 2

        orientation: ListView.Horizontal
        clip: true
        highlight: Rectangle { color: "transparent" }
        focus: true
        snapMode: ListView.SnapToItem
        highlightRangeMode: ListView.StrictlyEnforceRange
        preferredHighlightEnd: 1
        preferredHighlightBegin: 1
        highlightFollowsCurrentItem: true
        spacing: Theme.paddingLarge

        model: ListModel {

            Component.onCompleted: {
                for(var i = 0; i < 10; i += 1){
                    append({ "number": -1, "newHeight": Theme.itemSizeSmall - Theme.dp(50) });
                }

                for (var i = 40; i <= 50; i += 1) {
                    for (var j = 0; j < 10; j++) {
                        var number = i + j * 0.1; // Постепенно добавляем 0.1 к числу i
                        if (number <= 50) {
                            if (j === 0) { // Целое число
                                append({ "number": number, "newHeight": Theme.itemSizeMedium });
                            } else if (j === 5) { // Число с десятичной частью 0.5
                                append({ "number": number, "newHeight": (Theme.itemSizeSmall - Theme.dp(10)) });
                            } else { // Все остальные числа
                                append({ "number": number, "newHeight": Theme.itemSizeSmall - Theme.dp(50) });
                            }
                        }
                    }
                }

                for(var i = 0; i < 10; i += 1){
                    append({ "number": -1, "newHeight": Theme.itemSizeSmall - Theme.dp(50) });
                }
            }
        }

        delegate: Rectangle {
            width: Theme.itemSizeExtraSmall - Theme.dp(65)
            height: newHeight
            color: {
                if(number === -1)
                    return "transparent"

                return greenColor
            }
            anchors.verticalCenter: parent.verticalCenter

        }

        onCurrentIndexChanged: {
            _currentIndex = currentIndex + 10
            var num = weightList.model.get(_currentIndex).number
            if(num === -1)
                weightText.text = "50"
            else
                weightText.text = num
        }
    }

    MyButton{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Theme.paddingLarge + Theme.dp(50)
        anchors.left: parent.left
        anchors.leftMargin: Theme.paddingLarge + Theme.dp(26)
        buttonHeight: Theme.itemSizeExtraSmall
        buttonWidth: Theme.itemSizeExtraSmall
        buttonRadius: 48
        buttonColor: grayColor
        iconSource: "qrc:/arrow-left.png"

        onCustomClicked: pageStack.replace("AgePage.qml")
    }

    MyButton{
        id: nextPage
        anchors.bottom: parent.bottom
        anchors.bottomMargin: Theme.paddingLarge + Theme.dp(50)
        anchors.right: parent.right
        anchors.rightMargin: Theme.paddingLarge + Theme.dp(26)
        buttonHeight: Theme.itemSizeExtraSmall
        buttonWidth: Theme.itemSizeMedium * 2
        buttonRadius: 48
        buttonColor: greenColor
        iconSource: "qrc:/chevron-right.png"
        buttonText: "Next"


        onCustomClicked: pageStack.replace("HeightPage.qml")
    }

}
