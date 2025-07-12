import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import "root:/config"

Variants {
    id: root

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

            Keys.onPressed: event => {
                if (event.key == Qt.Key_Escape || event.key == Qt.Key_Q) {
                    Qt.quit();
                } else {
                    for (let i = 0; i < buttons.length; i++) {
                        let button = buttons[i];
                        if (event.key == button.keybind)
                            button.exec();
                    }
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
