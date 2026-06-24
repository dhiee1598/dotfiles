import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: root
    width: 1920
    height: 1080
    color: "#031014"

    property string fontName: config.font || "FiraCode Nerd Font"
    property string accent: config.accent || "#22d3ee"
    property string accentAlt: config.accentAlt || "#67e8f9"
    property string textColor: config.text || "#d6faff"
    property string mutedColor: config.muted || "#7aa4ad"
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
            GradientStop { position: 0.0; color: "#a0031014" }
            GradientStop { position: 0.52; color: "#7a08242b" }
            GradientStop { position: 1.0; color: "#c0031014" }
        }
    }

    Rectangle {
        id: sidePanel
        width: root.sidePanelWidth
        height: parent.height
        anchors.right: parent.right
        color: "#c0031014"
        border.width: 1
        border.color: "#3022d3ee"

        Rectangle {
            width: 1
            height: parent.height
            anchors.left: parent.left
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#0022d3ee" }
                GradientStop { position: 0.50; color: "#4222d3ee" }
                GradientStop { position: 1.0; color: "#0022d3ee" }
            }
        }
    }

    Rectangle {
        id: loginSurface
        width: root.loginCardWidth
        height: root.loginCardHeight
        radius: 22
        color: "#d008242b"
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
            color: "#3322d3ee"
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
                selectedTextColor: "#031014"
                selectionColor: root.accent
                font.family: root.fontName
                font.pixelSize: 14
                leftPadding: 16
                rightPadding: 16
                background: Rectangle {
                    radius: 14
                    color: username.activeFocus ? "#e30d3440" : "#c008242b"
                    border.width: 1
                    border.color: username.activeFocus ? root.accent : "#3022d3ee"
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
                selectedTextColor: "#031014"
                selectionColor: root.accent
                font.family: root.fontName
                font.pixelSize: 14
                leftPadding: 16
                rightPadding: 16
                background: Rectangle {
                    radius: 14
                    color: password.activeFocus ? "#e30d3440" : "#c008242b"
                    border.width: 1
                    border.color: password.activeFocus ? root.accent : "#3022d3ee"
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
                    color: "#c008242b"
                    border.width: 1
                    border.color: "#3022d3ee"
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
                color: "#ff5f6d"
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
                    color: "#031014"
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
                color: sleepButton.hovered ? "#df0d3440" : "#c008242b"
                border.width: 1
                border.color: sleepButton.hovered ? root.accent : "#3022d3ee"
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
                color: restartButton.hovered ? "#df0d3440" : "#c008242b"
                border.width: 1
                border.color: restartButton.hovered ? root.accent : "#3022d3ee"
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
                color: powerButton.hovered ? "#df0d3440" : "#c008242b"
                border.width: 1
                border.color: powerButton.hovered ? root.accent : "#3022d3ee"
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
