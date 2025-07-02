import QtQuick
import Quickshell

ShellRoot {
    Wlogout {
        Button {
            command: "quickshell -p ~/code/lockscreen/"
            keybind: Qt.Key_A
            text: "Lock"
            icon: "lock"
            command_text: "A"
            index: 0
        }

        Button {
            command: "loginctl terminate-user $USER"
            keybind: Qt.Key_S
            text: "Logout"
            icon: "logout"
            command_text: "S"
            index: 1
        }
        Button {
            command: "systemctl reboot"
            keybind: Qt.Key_D
            text: "Reboot"
            icon: "reboot"
            command_text: "D"
            index: 2
        }

        Button {
            command: "systemctl poweroff"
            keybind: Qt.Key_F
            text: "Shutdown"
            icon: "shutdown"
            command_text: "F"
            index: 3
        }
    }
}
