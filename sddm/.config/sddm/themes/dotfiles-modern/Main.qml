import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: root
    width: 1920
    height: 1080
    color: "#090b10"

    property string fontName: config.font || "FiraCode Nerd Font"
    property string accent: config.accent || "#7dd3fc"
    property string accentAlt: config.accentAlt || "#5eead4"
    property string textColor: config.text || "#e8edf7"
    property string mutedColor: config.muted || "#8992a7"
    property date now: new Date()
    property int sidePanelWidth: Math.min(root.width - 56, Math.max(520, root.width * 0.34))
    property int loginCardWidth: Math.min(sidePanelWidth - 96, 390)
    property int loginCardHeight: Math.min(root.height - 160, 500)

    function submitLogin() {
        message.text = ""
        sddm.login(username.text, password.text, session.currentIndex)
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: root.now = new Date()
    }

    Image {
        anchors.fill: parent
        source: config.background
        fillMode: Image.PreserveAspectCrop
        asynchronous: true
        cache: true
    }

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#8f05070b" }
            GradientStop { position: 0.52; color: "#6607111a" }
            GradientStop { position: 1.0; color: "#b805070b" }
        }
    }

    Rectangle {
        id: sidePanel
        width: root.sidePanelWidth
        height: parent.height
        anchors.right: parent.right
        color: "#b3070a10"
        border.width: 1
        border.color: "#16ffffff"

        Rectangle {
            width: 1
            height: parent.height
            anchors.left: parent.left
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#00ffffff" }
                GradientStop { position: 0.50; color: "#30ffffff" }
                GradientStop { position: 1.0; color: "#00ffffff" }
            }
        }
    }

    Rectangle {
        id: loginSurface
        width: root.loginCardWidth
        height: root.loginCardHeight
        radius: 22
        color: "#c80d111b"
        border.width: 0
        anchors {
            horizontalCenter: sidePanel.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

        Rectangle {
            width: 88
            height: 3
            radius: 2
            anchors {
                top: parent.top
                topMargin: 14
                horizontalCenter: parent.horizontalCenter
            }
            gradient: Gradient {
                GradientStop { position: 0.0; color: root.accent }
                GradientStop { position: 1.0; color: root.accentAlt }
            }
        }
    }

    ColumnLayout {
        width: loginSurface.width - 58
        spacing: 14
        anchors.centerIn: loginSurface

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 4

            Label {
                text: Qt.formatTime(root.now, "hh:mm AP")
                color: root.textColor
                font.family: root.fontName
                font.pixelSize: 40
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
            }

            Label {
                text: Qt.formatDate(root.now, "dddd, MMMM d")
                color: root.mutedColor
                font.family: root.fontName
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            color: "#22ffffff"
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 14

            Label {
                Layout.fillWidth: true
                text: "Welcome back"
                color: root.textColor
                font.family: root.fontName
                font.pixelSize: 22
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
            }

            Label {
                Layout.fillWidth: true
                text: "Enter your password"
                color: root.mutedColor
                font.family: root.fontName
                font.pixelSize: 13
                horizontalAlignment: Text.AlignHCenter
            }

            Item { Layout.preferredHeight: 6 }

            TextField {
                id: username
                Layout.fillWidth: true
                Layout.preferredHeight: 46
                text: userModel.lastUser
                placeholderText: "Username"
                color: root.textColor
                selectedTextColor: "#081017"
                selectionColor: root.accent
                font.family: root.fontName
                font.pixelSize: 14
                leftPadding: 16
                rightPadding: 16
                background: Rectangle {
                    radius: 14
                    color: username.activeFocus ? "#e3212636" : "#b9141924"
                    border.width: 1
                    border.color: username.activeFocus ? root.accent : "#2affffff"
                }
                onAccepted: password.forceActiveFocus()
            }

            TextField {
                id: password
                Layout.fillWidth: true
                Layout.preferredHeight: 46
                placeholderText: "Password"
                echoMode: TextInput.Password
                color: root.textColor
                selectedTextColor: "#081017"
                selectionColor: root.accent
                font.family: root.fontName
                font.pixelSize: 14
                leftPadding: 16
                rightPadding: 16
                background: Rectangle {
                    radius: 14
                    color: password.activeFocus ? "#e3212636" : "#b9141924"
                    border.width: 1
                    border.color: password.activeFocus ? root.accent : "#2affffff"
                }
                onAccepted: root.submitLogin()
                Component.onCompleted: forceActiveFocus()
            }

            ComboBox {
                id: session
                Layout.fillWidth: true
                Layout.preferredHeight: 44
                model: sessionModel
                textRole: "name"
                currentIndex: sessionModel.lastIndex
                font.family: root.fontName
                font.pixelSize: 13
                background: Rectangle {
                    radius: 14
                    color: "#b9141924"
                    border.width: 1
                    border.color: "#2affffff"
                }
                contentItem: Text {
                    text: session.displayText
                    color: root.textColor
                    font: session.font
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 16
                    rightPadding: 38
                    elide: Text.ElideRight
                }
            }

            Label {
                id: message
                Layout.fillWidth: true
                Layout.preferredHeight: 18
                color: "#fb7185"
                font.family: root.fontName
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                elide: Text.ElideRight
            }

            Button {
                id: loginButton
                Layout.fillWidth: true
                Layout.preferredHeight: 48
                text: "Log In"
                font.family: root.fontName
                font.pixelSize: 14
                font.bold: true
                onClicked: root.submitLogin()
                contentItem: Text {
                    text: loginButton.text
                    color: "#071017"
                    font: loginButton.font
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                background: Rectangle {
                    radius: 14
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: root.accent }
                        GradientStop { position: 1.0; color: root.accentAlt }
                    }
                }
            }
        }
    }

    RowLayout {
        spacing: 12
        anchors {
            left: parent.left
            leftMargin: 28
            bottom: parent.bottom
            bottomMargin: 26
        }

        Button {
            id: sleepButton
            text: "Sleep"
            Layout.preferredWidth: 88
            Layout.preferredHeight: 38
            font.family: root.fontName
            font.pixelSize: 12
            onClicked: sddm.suspend()
            contentItem: Text {
                text: sleepButton.text
                color: root.textColor
                font: sleepButton.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            background: Rectangle {
                radius: 12
                color: sleepButton.hovered ? "#df202433" : "#bd181c27"
                border.width: 1
                border.color: sleepButton.hovered ? root.accent : "#24ffffff"
            }
        }

        Button {
            id: restartButton
            text: "Restart"
            Layout.preferredWidth: 96
            Layout.preferredHeight: 38
            font.family: root.fontName
            font.pixelSize: 12
            onClicked: sddm.reboot()
            contentItem: Text {
                text: restartButton.text
                color: root.textColor
                font: restartButton.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            background: Rectangle {
                radius: 12
                color: restartButton.hovered ? "#df202433" : "#bd181c27"
                border.width: 1
                border.color: restartButton.hovered ? root.accent : "#24ffffff"
            }
        }

        Button {
            id: powerButton
            text: "Power Off"
            Layout.preferredWidth: 112
            Layout.preferredHeight: 38
            font.family: root.fontName
            font.pixelSize: 12
            onClicked: sddm.powerOff()
            contentItem: Text {
                text: powerButton.text
                color: root.textColor
                font: powerButton.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            background: Rectangle {
                radius: 12
                color: powerButton.hovered ? "#df202433" : "#bd181c27"
                border.width: 1
                border.color: powerButton.hovered ? root.accent : "#24ffffff"
            }
        }
    }

    Connections {
        target: sddm
        function onLoginFailed() {
            password.text = ""
            message.text = "Login failed"
            password.forceActiveFocus()
        }
    }
}
