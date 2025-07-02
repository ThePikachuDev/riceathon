import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland

Variants {
    id: root

    // Somewhere in your root QML item

    property color backgroundColor: "#e60c0c0c"
    property color buttonColor: "#16161D"
    property color buttonBorderColor: "#DCD7BA"

    property color buttonHoverColor: "#54546D"
    property color buttonTextColor: "#9CABCA"
    property color shortcutTextColor: "#9CABCA"
    property color shortcutTextBorderColor: "#2A2A37"

    property int focusIndex: 0

    default property list<Button> buttons
    model: Quickshell.screens

    PanelWindow {
        id: window

        property var modelData
        screen: modelData

        exclusionMode: ExclusionMode.Ignore
        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

        color: "transparent"

        contentItem {
            focus: true

            // Keys.onPressed: event => {
            //     const maxIndex = model - 1;
            //     if (event.key === Qt.Key_Left || event.key === Qt.Key_H) {
            //         focusIndex = focusIndex == 0 ? 0 : (focusIndex - 1);
            //     } else if (event.key === Qt.Key_Right || event.key === Qt.Key_L) {
            //         focusIndex = focusIndex == buttons.length - 1 ? 0 : (focusIndex + 1);
            //     } else if (event.key === Qt.Key_Up || event.key === Qt.Key_K) {
            //         if( focusIndex == (buttons.length / 2) - 1 ){
            //
            //
            //         }
            //         focusIndex = || focusIndex == 0 ? 0 : (focusIndex + 2);
            //
            //     } else if (event.key === Qt.Key_Down || event.key === Qt.Key_J) {} else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
            //         buttons[focusIndex].exec();
            //     }
            //     event.accepted = true;
            // }
            Keys.onPressed: event => {
                if (event.key == Qt.Key_Escape || event.key == Qt.Key_Q) {
                    Qt.quit();
                } else {
                    for (let i = 0; i < buttons.length; i++) {
                        let button = buttons[i];
                        if (event.key == button.keybind)
                            button.exec();
                    }

                    // arrow keys and hjkl to move around
                    // left,right or hl -> +i -i
                    // up , down or jk -> +2i -2i

                }
            }
        }

        anchors {
            top: true
            bottom: true
            right: true
            left: true
        }

        Rectangle {
            color: backgroundColor
            anchors.fill: parent

            MouseArea {
                anchors.fill: parent
                onClicked: Qt.quit()

                GridLayout {
                    anchors.centerIn: parent

                    width: parent.width * 0.5
                    height: parent.height * 0.5

                    columns: 2
                    rowSpacing: 0
                    columnSpacing: 0

                    Repeater {
                        model: buttons
                        delegate: Rectangle {
                            id: actionRect
                            required property Button modelData
                            property int radius: 25

                            topLeftRadius: modelData.index == 0 ? radius : 0
                            topRightRadius: modelData.index == 1 ? radius : 0
                            bottomLeftRadius: modelData.index == 2 ? radius : 0
                            bottomRightRadius: modelData.index == 3 ? radius : 0

                            // Visual feedback for focus
                            border.width: index === focusIndex ? 0 : 0.5
                            border.color: index === focusIndex ? buttonBorderColor : "transparent"

                            Keys.forwardTo: [ma]  // Allow focus inside mouse area if needed
                            focus: index === focusIndex

                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            opacity: 0.8

                            MouseArea {
                                id: ma
                                anchors.fill: parent
                                hoverEnabled: true
                                onClicked: modelData.exec()
                            }

                            color: ma.containsMouse ? buttonHoverColor : buttonColor
                            // border.color: buttonBorderColor
                            // border.width: ma.containsMouse ? 0 : 0.5

                            // Shortcut Rectangle
                            Rectangle {
                                anchors {
                                    top: parent.top
                                    left: parent.left
                                    topMargin: 10
                                    leftMargin: 10
                                }

                                color: "transparent"
                                border {
                                    pixelAligned: true
                                    color: shortcutTextBorderColor
                                    width: 3
                                }

                                width: parent.width * 0.1
                                height: parent.height * 0.2

                                Text {
                                    anchors {
                                        horizontalCenter: parent.horizontalCenter
                                        verticalCenter: parent.verticalCenter
                                    }
                                    text: modelData.command_text
                                    color: shortcutTextColor

                                    font.pointSize: 15
                                    font.bold: true
                                }
                            }

                            Image {
                                id: icon
                                anchors.centerIn: parent
                                source: `icons_white/${modelData.icon}.svg`
                            }

                            Text {
                                anchors {
                                    top: icon.bottom
                                    // topMargin: 20
                                    horizontalCenter: parent.horizontalCenter
                                }

                                text: modelData.text
                                font.pointSize: 20
                                color: buttonTextColor
                                font.weight: 600
                            }
                        }
                    }
                }
            }
        }
    }
}

// base00 = "#1B2A26";
//     base01 = "#355E3B";
//     base02 = "#79A86E";
//     base03 = "#C7D8A3";
//     base04 = "#2E474F";
//     base05 = "#3AAFA9";
//     base06 = "#7DE3C1";
//     base07 = "#E3FAF4";
//     base08 = "#3D2E24";
//     base09 = "#796C5D";
//     base0A = "#D4B58F";
//     base0B = "#F2DBA1";
//     base0C = "#6283C5";
//     base0D = "#2B3A62";
//     base0E = "#A4B0CC";
//     base0F = "#F9F9F9";
