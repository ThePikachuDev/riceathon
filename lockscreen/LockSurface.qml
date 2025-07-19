import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Fusion
import Quickshell.Wayland

Rectangle {
    id: root
    required property LockContext context
    readonly property ColorGroup colors: Window.active ? palette.active : palette.inactive
    color: "black"
    Image {
        id: backgroundImage
        source: "./wall.jpg"
        width: parent.width
        height: parent.height
    }
    Column {
        id: clock
        anchors {
            left: parent.left
            top: parent.top
            topMargin: 360
            leftMargin: 160
        }
        spacing: 4
        Text {
            id: timeText
            text: {
                let hours = clock.date.getHours();
                const minutes = clock.date.getMinutes().toString().padStart(2, '0');
                const ampm = hours >= 12 ? 'PM' : 'AM';
                hours = hours % 12;
                hours = hours ? hours : 12; // 0 should be shown as 12
                const hoursStr = hours.toString().padStart(2, '0');
                return `${hoursStr}:${minutes} ${ampm}`;
            }
            font.pointSize: 40
            font.bold: true
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            id: infoText
            text: {
                const days = ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"];
                const months = ["Jan", "Feb", "March", "April", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"];
                const dayName = days[clock.date.getDay()];
                const dateString = `${clock.date.getDate()} ${months[clock.date.getMonth()]} ${clock.date.getFullYear()}`;
                return `${dayName}, ${dateString}`;
            }
            font.pointSize: 16
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: clock.date = new Date()
        }
        property var date: new Date()
    }

    ColumnLayout {
        anchors {
            top: parent.top
            topMargin: 480
            left: parent.left
            leftMargin: 170
        }
        RowLayout {
            TextField {
                id: passwordBox
                implicitWidth: 200
                implicitHeight: 35
                padding: 10
                color: "#fff"
                background: Rectangle {
                    anchors.fill: parent
                    color: "#fff"
                    opacity: 0.15
                    radius: 10
                }
                placeholderText: "Password"
                placeholderTextColor: "#fff"
                font.pointSize: 10
                focus: true
                enabled: !root.context.unlockInProgress
                echoMode: TextInput.Password
                inputMethodHints: Qt.ImhSensitiveData
                onTextChanged: root.context.currentText = this.text
                onAccepted: root.context.tryUnlock()
                Connections {
                    target: root.context
                    function onCurrentTextChanged() {
                        passwordBox.text = root.context.currentText;
                    }
                }
            }

            Button {
                text: ""
                implicitHeight: 35
                implicitWidth: 35
                background: Rectangle {
                    anchors.fill: parent
                    color: "#fff"
                    opacity: 0.15
                    radius: 10
                }
                Image {
                    id: unlockIcon
                    opacity: 0.8
                    source: "./logout.svg"
                    anchors.fill: parent
                    anchors.margins: 4
                }
                padding: 10
                focusPolicy: Qt.NoFocus
                enabled: !root.context.unlockInProgress && root.context.currentText !== ""
                onClicked: root.context.tryUnlock()
            }
        }

        Text {
            visible: root.context.showFailure
            text: "Incorrect password"
            color: "#fff"
            font.pointSize: 12
            font.weight: 500
        }
    }
}
