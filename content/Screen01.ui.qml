import QtQuick 6.5
import QtQuick.Controls 6.5
import Robot_frontend
import QtQuick.Controls.Material 2.15

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    // color: Constants.backgroundColor
    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: "#F5F5F5"
        }
        GradientStop {
            position: 1.0
            color: "#E0E0E0"
        }
    }
    Row {
        id: mainLayout
        anchors.top: parent.top
        anchors.left: parent.left
        spacing: 20 // Adds spacing between the elements

        // Robot Rectangle
        Rectangle {
            id: robot
            width: 950
            height: 770
            color: "lightblue"
            border.color: "#90EE90"
            border.width: 1.5
        }

        // Cartesian Control
        Rectangle {
            id: coordControls
            width: 298
            height: 461
            anchors.top: parent.top
            anchors.topMargin: 15
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: "#F5F5F5"
                }
                GradientStop {
                    position: 1.0
                    color: "#E0E0E0"
                }
            }
            border.color: "#90EE90"
            border.width: 1
            radius: 10

            Column {
                id: cartesianControl
                spacing: 15
                anchors.top: parent.top
                anchors.topMargin: 15
                width: parent.width // Set width to parent's width

                // Center-aligned header row
                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 40 // Increased spacing between texts
                    Text {
                        text: "Cartesian"
                        font.bold: true
                        font.pixelSize: 22
                        color: "black"
                    }
                    Text {
                        text: "Joint"
                        font.bold: true
                        font.pixelSize: 22
                        color: "black"
                    }
                }

                // Center-aligned units row
                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 40 // Match spacing with header
                    Text {
                        text: "(mm)"
                        font.bold: true
                        font.pixelSize: 22
                        color: "black"
                    }
                    Text {
                        text: "(deg)"
                        font.bold: true
                        font.pixelSize: 22
                        color: "black"
                    }
                }

                // Coordinate inputs
                Repeater {
                    model: ["X", "Y", "Z", "Rx", "Ry", "Rz"]
                    delegate: Row {
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: 15
                        Text {
                            text: modelData
                            font.bold: true
                            font.pixelSize: 22
                            width: 30
                        }
                        Rectangle {
                            id: cart
                            width: 90
                            height: 40
                            border.color: "#90EE90"
                            color: "white"
                            radius: 10
                        }
                        Rectangle {
                            width: 90
                            height: 40
                            border.color: "#90EE90"
                            color: "white"
                            radius: 10
                        }
                    }
                }
            }
        }

        // Speed Control Panel
        Rectangle {
            id: speedControls
            width: 298
            height: 461
            anchors.top: parent.top
            anchors.topMargin: 15
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: "#F5F5F5"
                }
                GradientStop {
                    position: 1.0
                    color: "#E0E0E0"
                }
            }
            border.color: "#90EE90"
            border.width: 1
            radius: 10

            Column {
                anchors.fill: parent
                anchors.margins: 15
                spacing: 40

                // Title
                Text {
                    text: "Speed"
                    font.bold: true
                    font.pixelSize: 26
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                // Input fields
                Column {
                    spacing: 15
                    anchors.horizontalCenter: parent.horizontalCenter

                    // mm input
                    Row {
                        spacing: 60
                        Text {
                            text: "mm"
                            font.bold: true
                            font.pixelSize: 22
                            width: 80
                            verticalAlignment: Text.AlignVCenter
                        }
                        Rectangle {
                            width: 90
                            height: 40
                            color: "white"
                            border.color: "#90EE90" // Light green border
                            radius: 10
                        }
                    }

                    // mm/s input
                    Row {
                        spacing: 60
                        Text {
                            text: "mm/s"
                            font.bold: true
                            font.pixelSize: 22
                            width: 80
                            verticalAlignment: Text.AlignVCenter
                        }
                        Rectangle {
                            width: 90
                            height: 40
                            color: "white"
                            border.color: "#90EE90"
                            radius: 10
                        }
                    }

                    // frame input
                    Row {
                        spacing: 60
                        Text {
                            text: "frame"
                            font.bold: true
                            font.pixelSize: 22
                            width: 80
                            verticalAlignment: Text.AlignVCenter
                        }
                        Rectangle {
                            width: 90
                            height: 40
                            color: "white"
                            border.color: "#90EE90"
                            radius: 10
                        }
                    }

                    // Degree input
                    Row {
                        spacing: 60
                        Text {
                            text: "Degree"
                            font.bold: true
                            font.pixelSize: 22
                            width: 80
                            verticalAlignment: Text.AlignVCenter
                        }
                        Rectangle {
                            width: 90
                            height: 40
                            color: "white"
                            border.color: "#90EE90"
                            radius: 10
                        }
                    }

                    // Degree/s input
                    Row {
                        spacing: 60
                        Text {
                            text: "Degree/s"
                            font.bold: true
                            font.pixelSize: 22
                            width: 80
                            verticalAlignment: Text.AlignVCenter
                        }
                        Rectangle {
                            width: 90
                            height: 40
                            color: "white"
                            border.color: "#90EE90"
                            radius: 10
                        }
                    }

                    // Slider section
                    Row {
                        spacing: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        Slider {
                            id: speedSlider
                            width: 148 // Leave space for the value box
                            height: 30
                            from: 0
                            to: 100
                            value: 50

                            background: Rectangle {
                                x: speedSlider.leftPadding
                                y: speedSlider.topPadding
                                   + speedSlider.availableHeight / 2 - height / 2
                                width: speedSlider.availableWidth
                                height: 4
                                radius: 2
                                color: "#C4EFB0"
                                border.color: "#000000"
                            }

                            handle: Rectangle {
                                x: speedSlider.leftPadding + speedSlider.visualPosition
                                   * (speedSlider.availableWidth - width)
                                y: speedSlider.topPadding
                                   + speedSlider.availableHeight / 2 - height / 2
                                width: 20
                                height: 20
                                radius: 10
                                color: "#4CAF50" // Green slider handle
                            }
                        }

                        Rectangle {
                            width: 68
                            height: 40
                            color: "white"
                            border.color: "#90EE90"
                            radius: 10
                        }
                    }
                }
            }
        }

        // // //toggle part
        // Rectangle {
        //     // id: coordControls
        //     width: 298
        //     height: 461
        //     anchors.top: parent.top
        //     anchors.topMargin: 15
        //     // color: "white"
        //     gradient: Gradient {
        //         GradientStop {
        //             position: 0.0
        //             color: "#F5F5F5"
        //         } // Lighter shade
        //         GradientStop {
        //             position: 1.0
        //             color: "#E0E0E0"
        //         } // Original color
        //     }
        //     border.color: "#90EE90"
        //     border.width: 1
        //     radius: 10
        //     Column {
        //         // id: cartesianControl
        //         spacing: 15
        //         anchors.top: parent.top
        //         anchors.topMargin: 15 // Adjust this to control spacing from the top
        //         anchors.horizontalCenter: parent.horizontalCenter

        //         Row {
        //             spacing: 20

        //             Text {
        //                 text: "Cart"
        //                 font.bold: true
        //                 font.pixelSize: 22
        //                 color: "black"
        //                 x: 20
        //             }
        //             Switch {
        //                 id: toggleSwitch
        //                 checked: false
        //                 Material.accent: checked ? "green" : "gray"
        //             }

        //             Text {
        //                 text: "Jog"
        //                 font.bold: true
        //                 font.pixelSize: 22
        //                 color: "black"
        //                 x: 20
        //             }
        //         }
        //     }
        // }

        // Jog Control Panel
        Rectangle {
            id: jogPanel
            width: 298
            height: 461
            anchors.top: parent.top
            anchors.topMargin: 15
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: "#F5F5F5"
                }
                GradientStop {
                    position: 1.0
                    color: "#E0E0E0"
                }
            }
            border.color: "#90EE90"
            border.width: 1
            radius: 10

            // Toggle Switch Row
            Row {
                id: toggleRow
                anchors {
                    top: parent.top
                    topMargin: 15
                    horizontalCenter: parent.horizontalCenter
                }
                spacing: 20

                Text {
                    text: "Cart"
                    font.bold: true
                    font.pixelSize: 26
                    anchors.verticalCenter: parent.verticalCenter
                }

                Switch {
                    id: modeSwitch
                    checked: false
                    width: 60
                    height: 30
                    Material.accent: checked ? "green" : "gray"
                }
                Text {
                    text: "Joint"
                    font.bold: true
                    font.pixelSize: 26
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            // Jog Controls
            Column {
                anchors {
                    top: toggleRow.bottom
                    topMargin: 20
                    horizontalCenter: parent.horizontalCenter
                }
                spacing: 5

                Repeater {
                    model: ["X", "Y", "Z", "Rx", "Ry", "Rz"]
                    delegate: Row {
                        spacing: 15

                        // Plus Button
                        Button {
                            text: "+"
                            font.bold: true
                            font.pixelSize: 30
                            width: 100
                            height: 60
                            background: Rectangle {
                                color: "#D3D3D3"
                                radius: 15
                                border.color: "#90EE90"
                                border.width: 1
                            }
                            onPressed: background.color = "#A9A9A9"
                            onReleased: background.color = "#D3D3D3"
                        }

                        // Axis Label
                        Text {
                            text: modelData
                            font.bold: true
                            font.pixelSize: 20
                            width: 30
                            horizontalAlignment: Text.AlignHCenter
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        // Minus Button
                        Button {
                            text: "-"
                            font.bold: true
                            font.pixelSize: 30
                            width: 100
                            height: 60
                            background: Rectangle {
                                color: "#D3D3D3"
                                radius: 15
                                border.color: "#90EE90"
                                border.width: 1
                            }
                            onPressed: background.color = "#A9A9A9"
                            onReleased: background.color = "#D3D3D3"
                        }
                    }
                }
            }
        }
        //finish
    }
}
