pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property Dimensions dimensions: Dimensions {}
    readonly property Colorschemes colorschemes: Colorschemes {}

    component Dimensions: QtObject {
        property int buttonWidth: 200
        property int buttonHeight: 50
        property int buttonSpacing: 10
        property int buttonsPerRow: 5
        property int rows: 2
    }

    component Colorschemes: QtObject {
        property Gruvbox gruvbox: Gruvbox {}
    }

    component Gruvbox: QtObject {
        property color backgroundColor: "#e60c0c0c"
        property color buttonColor: "#16161D"
        property color buttonBorderColor: "#DCD7BA"

        property color buttonHoverColor: "#54546D"
        property color buttonTextColor: "#9CABCA"
        property color shortcutTextColor: "#9CABCA"
        property color shortcutTextBorderColor: "#2A2A37"
    }
}
