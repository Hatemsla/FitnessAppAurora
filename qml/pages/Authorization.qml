import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.Layouts 1.0

Page {
    allowedOrientations: Orientation.All
    backgroundColor: defaultColor

    property string defaultColor: "#121212"
    property string defaultSurfaceColor: "#10FFFFFF"
    property bool isValidEmail: false
    property string errorEmailMessage: "Неверные данные"
    property bool isValidPassword: false
    property string errorPasswordMessage: "Неверные данные"

    readonly property string correctEmail: "test@gmail.com"
    readonly property string correctPassword: "test123"

    property bool valid: false

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
            text: "Авторизация"
            font.pixelSize: 36
        }
    }


    Column {
        anchors.top: parent.top
        anchors.topMargin: appbar.height * 4
        width: parent.width
        spacing: 16


        TextField {
            id: emailField
            placeholderText: "Почта"
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            cursorColor: "white"

            onTextChanged: {
                validateEmail()
            }

            Rectangle{
                color: defaultColor
                anchors.top: parent.bottom
                anchors.topMargin: 18
                width: parent.width
                height: 20

                Text {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    color: (isValidEmail) ? "red" : "transparent"

                    text: errorEmailMessage
                    font.pixelSize: 28
                }
            }

            function validateEmail() {
                if (emailField.text.trim() === "") {
                    isValidEmail = true
                    errorEmailMessage = "Почта не может быть пустой"
                } else {
                    isValidEmail = false
                }
            }
        }

        TextField {
            id: passwordField
            placeholderText: "Пароль"
            echoMode: TextInput.Password
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            cursorColor: "white"

            onTextChanged: {
                validatePassword()
            }

            Rectangle{
                color: defaultColor
                anchors.top: parent.bottom
                anchors.topMargin: 18
                width: parent.width
                height: 20

                Text {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    color: (isValidPassword) ? "red" : "transparent"

                    text: errorPasswordMessage
                    font.pixelSize: 28
                }
            }

            function validatePassword() {
                if (passwordField.text.trim() === "") {
                    isValidPassword = true
                    errorPasswordMessage = "Пароль не может быть пустой"
                } else {
                    isValidPassword = false
                }
            }
        }

        Button {
            id: auth
            text: "Авторизироваться"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            anchors.left: parent.left
            anchors.leftMargin: 32
            color: "white"
            highlightColor: "white"
            highlightBackgroundColor: "white"
            onClicked: {
                valid = true
                if (emailField.text != correctEmail) {
                    errorEmailMessage = "Неверная почта"
                    isValidEmail = true
                    valid = false
                }

                if (passwordField.text != correctPassword) {
                    errorPasswordMessage = "Неверный пароль"
                    isValidPassword = true
                    valid = false
                }

                if(!valid)
                    return

                windowApp.openPageWithPop("MainPage.qml")
            }
        }

        Button {
            id: goToReg
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            backgroundColor: defaultColor
            highlightColor: "white"
            highlightBackgroundColor: defaultColor
            onClicked: {
                windowApp.openPage("Registration.qml")
            }

            Label {
                text: "У вас нет учетной записи? Зарегистрируйтесь!"
                font.pixelSize: 26
                topPadding: 18
                anchors.horizontalCenter: goToReg.horizontalCenter
                color: "white"
            }
        }
    }
}
