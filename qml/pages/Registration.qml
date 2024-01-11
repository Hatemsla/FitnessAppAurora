import QtQuick 2.0
import QtQuick.Layouts 1.1
import Sailfish.Silica 1.0

Page {
    allowedOrientations: Orientation.All
    backgroundColor: defaultColor

    property string defaultColor: "#121212"
    property string defaultSurfaceColor: "#10FFFFFF"
    property bool isValidLogin: false
    property string errorLoginMessage: "Неверные данные"
    property bool isValidEmail: false
    property string errorEmailMessage: "Неверные данные"
    property bool isValidPassword: false
    property string errorPasswordMessage: "Неверные данные"
    property bool isValidConfirmPassword: false
    property string errorConfirmPasswordMessage: "Неверные данные"

    readonly property string existLogin: "test"
    readonly property string existEmail: "test@gmail.com"
    readonly property string existPassword: "test123"

    property bool valid: true

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
            text: "Регистрация"
            font.pixelSize: 36
        }
    }

    Column {
        anchors.top: parent.top
        anchors.topMargin: appbar.height * 3
        width: parent.width
        spacing: 16

        TextField {
            id: loginField
            placeholderText: "Логин"
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            cursorColor: "white"

            onTextChanged: {
                validateLogin()
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
                    color: (isValidLogin) ? "red" : "transparent"

                    text: errorLoginMessage
                    font.pixelSize: 28
                }
            }

            function validateLogin() {
                if (loginField.text.trim() === "") {
                    isValidLogin = true
                    errorLoginMessage = "Почта не может быть пустой"
                } else {
                    isValidLogin = false
                }
            }
        }

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

        TextField {
            id: confirmPasswordField
            placeholderText: "Повторите пароль"
            echoMode: TextInput.Password
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            cursorColor: "white"

            onTextChanged: {
                validateConfirmPassword()
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
                    color: (isValidConfirmPassword) ? "red" : "transparent"

                    text: errorConfirmPasswordMessage
                    font.pixelSize: 28
                }
            }

            function validateConfirmPassword() {
                if (confirmPasswordField.text.trim() === "") {
                    isValidConfirmPassword = true
                    errorConfirmPasswordMessage = "Пароль не может быть пустой"
                } else if(confirmPasswordField.text != passwordField.text) {
                    isValidConfirmPassword = true
                    errorConfirmPasswordMessage = "Пароли не совпдают"
                } else {
                    isValidConfirmPassword = false
                }
            }
        }

        Button {
            id: auth
            text: "Зарегистрироваться"
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
            anchors.left: parent.left
            anchors.leftMargin: 32
            color: "white"
            highlightColor: "white"
            highlightBackgroundColor: "white"
            onClicked: {
                valid = true
                if (loginField.text === existLogin) {
                    errorLoginMessage = "Такой логин уже существует"
                    isValidLogin = true
                    valid = false
                }

                if (emailField.text === existEmail) {
                    errorEmailMessage = "Почта уже используется"
                    isValidEmail = true
                    valid = false
                }

                if (passwordField.text.length < 6) {
                    errorPasswordMessage = "Слишком короткий пароль"
                    isValidPassword = true
                    valid = false
                }

                if (confirmPasswordField.text !== passwordField.text || confirmPasswordField.text.trim() === "") {
                    errorConfirmPasswordMessage = "Неверный пароль"
                    isValidConfirmPassword = true
                    valid = false
                }

                if(!valid)
                    return

                windowApp.openPageWithPop("MainPage.qml")
            }
        }

        Button {
            id: goToAuth
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
            backgroundColor: defaultColor
            highlightColor: "white"
            highlightBackgroundColor: defaultColor
            onClicked: {
                pageStack.pop();
            }

            Label {
                text: "У вас уже есть аккаунт? Авторизируйтесь!"
                font.pixelSize: 26
                topPadding: 18
                anchors.horizontalCenter: goToAuth.horizontalCenter
                color: "white"
            }
        }
    }
}

