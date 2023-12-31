import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0


Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All
    backgroundColor: "#121212"
    id: mainPage

    property string defaultSurfaceColor: "#10FFFFFF"

    property ListModel devices: ListModel{}

    function initDevices(allDevices){
        for(var i = 0; i < allDevices.length; i++){
            devices.append({
                               userDevcieName: allDevices[i]
                           });
        }
    }

    function getRandomInt(min, max) {
        return Math.floor(min + (Math.random() * (max-min)));
    }

    function getRandomFloat(min, max) {
        return getRandomInt(min, max) + Math.floor(Math.random()*10)/10;
    }

    function parseTextToFloat(value) {
        return parseFloat(value.text)
    }

    Rectangle {
        id: appbar

        color: defaultSurfaceColor
        width: parent.width
        height: 100

        anchors.top: parent.top
        Text {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            text: "Главная"
        }
    }

    Rectangle{
        width: Screen.width
        height: Screen.height
        anchors.top: appbar.bottom
        anchors.topMargin: 24
        color: "transparent"

        SilicaFlickable{

            clip: true
            width: parent.width
            height: parent.height
            contentWidth: Screen.width
            contentHeight: ((Screen.height-appbar.height-10)/2)+((Screen.height-appbar.height-10)/3)*2.5-40
            boundsBehavior: SilicaFlickable.StopAtBounds

            Rectangle{
                id: viewContainer
                color: "transparent"
                width: parent.width

                Rectangle {
                    id: userMetrics
                    radius: 24
                    width: parent.width
                    height: ((Screen.height-appbar.height)/2-10)
                    anchors.margins: 16
                    color: defaultSurfaceColor
                    anchors.top: appbar.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right

                    Text {
                        id: userMetricsLabel
                        anchors.top: parent.top
                        anchors.topMargin: 24
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Ваши показатели"
                        color: "White"
                    }

                    CircularProgressBar{
                        id: userMetricsStepBar
                        anchors.left: parent.left
                        anchors.leftMargin: 24
                        size: parent.width/3-60
                        anchors.top: userMetricsLabel.bottom
                        anchors.topMargin: 24
                        value: parseTextToFloat(userMetricsStepCount)/13000
                        lineWidth: 12
                        secondaryColor: "#30FFFFFF"
                        primaryColor: "#FFFFFFFF"
                    }

                    Text {
                        id: userMetricsStepCount
                        text: getRandomInt(1212,12030)
                        anchors.centerIn: userMetricsStepBar
                        font.pointSize: 24
                        color: "white"
                    }

                    Text {
                        id: userMetricsStepLabel
                        text: "Шаги"
                        anchors.horizontalCenter: userMetricsStepCount.horizontalCenter
                        anchors.top: userMetricsStepBar.bottom
                        anchors.topMargin: 8
                        color: "white"
                    }

                    CircularProgressBar{
                        id: userMetricsPulseBar
                        anchors.horizontalCenter: parent.horizontalCenter
                        size: parent.width/3-60
                        anchors.top: userMetricsLabel.bottom
                        anchors.topMargin: 24
                        value: parseTextToFloat(userMetricsPulseCount)/200
                        lineWidth: 12
                        secondaryColor: "#30FFFFFF"
                        primaryColor: "#FFFFFFFF"
                    }

                    Text {
                        id: userMetricsPulseCount
                        text: getRandomInt(60,150)
                        anchors.centerIn: userMetricsPulseBar
                        font.pointSize: 24
                        color: "white"
                    }

                    Text {
                        id: userMetricsPulseLabel
                        text: "Пульс"
                        anchors.horizontalCenter: userMetricsPulseCount.horizontalCenter
                        anchors.top: userMetricsStepBar.bottom
                        anchors.topMargin: 8
                        color: "white"
                    }

                    CircularProgressBar{
                        id: userMetricsSleepBar
                        anchors.right: parent.right
                        anchors.rightMargin: 24
                        size: parent.width/3-60
                        anchors.top: userMetricsLabel.bottom
                        anchors.topMargin: 24
                        value: parseTextToFloat(userMetricsSleepCount)/8
                        lineWidth: 12
                        secondaryColor: "#30FFFFFF"
                        primaryColor: "#FFFFFFFF"
                    }

                    Text {
                        id: userMetricsSleepCount
                        text: getRandomInt(3,8)
                        anchors.centerIn: userMetricsSleepBar
                        font.pointSize: 24
                        color: "white"
                    }

                    Text {
                        id: userMetricsSleepLabel
                        text: "Часы сна"
                        anchors.horizontalCenter: userMetricsSleepCount.horizontalCenter
                        anchors.top: userMetricsStepBar.bottom
                        anchors.topMargin: 8
                        color: "white"
                    }

                    Rectangle{
                        id: userMetricsBottomDivider
                        radius: 24
                        anchors.top: userMetricsSleepLabel.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: userMetricsMoreButton.top
                        anchors.topMargin: 24
                        anchors.bottomMargin: 4
                        color: "#30FFFFFF"
                        width: 4
                    }

                    Button {
                        id: userMetricsMoreButton
                        width: userMetricsMoreButtonLabel.width + userMetricsMoreButtonIcon.width + 76
                        backgroundColor: "transparent"
                        color: "white"
                        highlightBackgroundColor: "#01FFFFFF"
                        highlightColor: "white"
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                    }

                    Text {
                        id: userMetricsMoreButtonLabel
                        text: "Подробнее"
                        anchors.verticalCenter: userMetricsMoreButton.verticalCenter
                        anchors.right: userMetricsMoreButtonIcon.left
                        anchors.rightMargin: 16
                        color: "white"
                    }

                    Image {
                        id: userMetricsMoreButtonIcon
                        source: "qrc:/next-svgrepo-com.svg"
                        height: userMetricsMoreButtonLabel.height/2
                        width: height
                        anchors.right: parent.right
                        anchors.rightMargin: 24
                        anchors.verticalCenter: userMetricsMoreButtonLabel.verticalCenter
                    }

                    Rectangle{
                        anchors.left: parent.left
                        color: "transparent"
                        anchors.right: userMetricsBottomDivider.left
                        anchors.top: userMetricsBottomDivider.top



                        Text{
                            id: userMetricsBloodSugarLabel
                            text: "Сахар: " + getRandomFloat(3,6)
                            anchors.left: parent.left
                            anchors.leftMargin: 16
                            anchors.top:  parent.top
                            color: "white"
                            anchors.topMargin: 16
                        }

                        Text{
                            id: userMetricsBloodOxygenLabel
                            text: "Сатурация: " + getRandomInt(95,100) + "%"
                            anchors.left: parent.left
                            anchors.leftMargin: 16
                            anchors.top:  userMetricsBloodSugarLabel.bottom
                            color: "white"
                            anchors.topMargin: 12
                        }

                        Text{
                            id: userMetricsBloodPressureLabel
                            text: "Давление: " + getRandomInt(110,130) + " / " + getRandomInt(60,90)
                            anchors.left: parent.left
                            anchors.leftMargin: 16
                            anchors.top:  userMetricsBloodOxygenLabel.bottom
                            color: "white"
                            anchors.topMargin: 12
                        }


                    }

                    Rectangle{
                        anchors.right: parent.right
                        color: "transparent"
                        anchors.left: userMetricsBottomDivider.right
                        anchors.top: userMetricsBottomDivider.top

                        Text{
                            id: userMetricsHeightLabel
                            text: "Рост: " + getRandomInt(150,190)
                            anchors.left: parent.left
                            anchors.leftMargin: 16
                            anchors.top:  parent.top
                            color: "white"
                            anchors.topMargin: 16
                        }

                        Text{
                            id: userMetricsWeightLabel
                            text: "Вес: " + getRandomFloat(65,90)
                            anchors.left: parent.left
                            anchors.leftMargin: 16
                            anchors.top:  userMetricsHeightLabel.bottom
                            color: "white"
                            anchors.topMargin: 12
                        }

                        Text{
                            id: userMetricsCaloriesLabel
                            text: "Сожжено ккал: " + getRandomFloat(2,3)
                            anchors.left: parent.left
                            anchors.leftMargin: 16
                            anchors.top:  userMetricsWeightLabel.bottom
                            color: "white"
                            anchors.topMargin: 12
                        }

                    }

                    // КОНЕЦ МЕТРИК
                }

                Rectangle {
                    id: userActivities
                    radius: 24
                    width: parent.width
                    height: (Screen.height-appbar.height)/3-10
                    anchors.margins: 16
                    color: defaultSurfaceColor
                    anchors.top: userMetrics.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right

                    Text {
                        id: userActivitiesLabel
                        anchors.top: parent.top
                        anchors.topMargin: 24
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Возможные активности"
                        color: "White"
                    }

                    ListModel{
                        id: userActivitiesModel
                        ListElement{
                            name: "Бег"
                        }
                        ListElement{
                            name: "Ходьба"
                        }
                        ListElement{
                            name: "Плавание"
                        }
                        ListElement{
                            name: "Велотренажер"
                        }
                        ListElement{
                            name: "Тренировка"
                        }
                    }

                    ListView{
                        model: userActivitiesModel
                        anchors.top: userActivitiesLabel.bottom
                        anchors.topMargin: 24
                        anchors.left: parent.left
                        anchors.leftMargin: 16
                        width: parent.width-32
                        height: parent.height-userActivitiesLabel.height-66
                        clip: true
                        delegate: Activity {
                            activityName: name
                        }
                    }
                }



                Rectangle {
                    id: userDevices
                    radius: 24
                    width: parent.width
                    height: (Screen.height-appbar.height)/3-10
                    anchors.margins: 16
                    color: defaultSurfaceColor
                    anchors.top: userActivities.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right

                    Text {
                        id: userDevicesLabel
                        anchors.top: parent.top
                        anchors.topMargin: 24
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Ваши устройства"
                        color: "White"
                    }

                    ListView{
                        id: userDevicesListView
                        model: devices
                        width: parent.width
                        height: parent.height - 90
                        clip: true
                        anchors.top: userDevicesLabel.bottom
                        anchors.topMargin: 24
                        delegate: Device{
                            deviceName: userDevcieName
                        }
                    }


                    Button {
                        anchors.top: parent.top
                        anchors.right: parent.right
                        anchors.margins: 28
                        width: 30
                        height: width
                        icon.source: "qrc:/plus-svgrepo-com.svg"
                        icon.color: "white"
                        icon.width: 30
                        icon.height: 30
                        highlightBackgroundColor: "transparent"
                        backgroundColor: "transparent"
                        highlightColor: "transparent"
                        onClicked: {
                            windowApp.openPage("AddDevicePage.qml")
                        }
                    }
                }
            }
        }
    }
}
