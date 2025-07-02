import QtQuick
import Quickshell.Io

QtObject {
    id: button
    required property string text
    required property string icon
    required property string command
    required property string command_text

    required property int index
    property var keybind: null

    readonly property var process: Process {
        command: ["sh", "-c", button.command]
    }

    function exec() {
        process.startDetached();
        Qt.quit();
    }
}
