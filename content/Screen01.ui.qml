import QtQuick 6.5
import QtQuick.Controls 6.5
import Robot_frontend
import QtQuick.Controls.Material 2.15

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor
    // gradient: Gradient {
    //     GradientStop {
    //         position: 0.0
    //         color: "#F5F5F5"
    //     }
    //     GradientStop {
    //         position: 1.0
    //         color: "#E0E0E0"
    //     }
    // }
    Row {
        id: mainLayout
        anchors.top: parent.top
        anchors.left: parent.left
        spacing: 20 // Adds spacing between the elements

        // Robot Rectangle
        Rectangle {
            id: robot
            width: 950
            height: 700
            color: "lightblue"
            border.color: "#90EE90"
            border.width: 1.5
        }

        // Cartesian Control
        Rectangle {
            id: coordControls
            width: 298
            height: 430
            anchors.top: parent.top
            anchors.topMargin: 10
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
                spacing: 10
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
                        spacing: 20
                        Text {
                            text: modelData
                            font.bold: true
                            font.pixelSize: 22
                            width: 30
                        }
                        Rectangle {
                            id: cart
                            width: 90
                            height: 45
                            border.color: "#90EE90"
                            color: "white"
                            radius: 10
                        }
                        Rectangle {
                            width: 90
                            height: 45
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
            width: 260
            height: 430
            anchors.top: parent.top
            anchors.topMargin: 10
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
                spacing: 25

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

        // Jog Control Panel
        Rectangle {
            id: jogPanel
            width: 320
            height: 430
            anchors.top: parent.top
            anchors.topMargin: 10
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
                    topMargin: 10
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
                    topMargin: 5
                    horizontalCenter: parent.horizontalCenter
                }
                spacing: 2

                Repeater {
                    model: ["X", "Y", "Z", "Rx", "Ry", "Rz"]
                    delegate: Row {
                        spacing: 15

                        // Plus Button
                        Button {
                            text: "+"
                            font.bold: true
                            font.pixelSize: 30
                            width: 105
                            height: 60
                            background: Rectangle {
                                color: "#D3D3D3"
                                radius: 15
                                border.color: "#90EE90"
                                border.width: 2
                            }
                            onPressed: background.color = "#A9A9A9"
                            onReleased: background.color = "#D3D3D3"
                        }

                        // Axis Label
                        Text {
                            text: modelData
                            font.bold: true
                            font.pixelSize: 20
                            width: 35
                            horizontalAlignment: Text.AlignHCenter
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        // Minus Button
                        Button {
                            text: "-"
                            font.bold: true
                            font.pixelSize: 30
                            width: 105
                            height: 60
                            background: Rectangle {
                                color: "#D3D3D3"
                                radius: 15
                                border.color: "#90EE90"
                                border.width: 2
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

    Rectangle {
        id: working_buttons
        // width: 939 + 10
        // height: 280
        anchors.top: parent.top
        anchors.topMargin: 715
        anchors.left: parent.left
        anchors.leftMargin: 15
        // gradient: Gradient {
        //     GradientStop {
        //         position: 0.0
        //         color: "#F5F5F5"
        //     }
        //     GradientStop {
        //         position: 1.0
        //         color: "#E0E0E0"
        //     }
        // }
        // border.color: "#90EE90"
        // border.width: 2
        // radius: 10
        Rectangle {
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 0

            // First row
            Button {
                id: simButton
                x: 0
                y: 0
                width: 144
                height: 60
                text: "Sim"
                font.pixelSize: 20
                font.bold: true

                background: Rectangle {
                    color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                    border.color: "#90EE90"
                    border.width: 2
                    radius: 10
                }
            }

            Button {
                id: realButton
                x: simButton.x + simButton.width + 15
                y: 0
                width: simButton.width
                height: simButton.height
                text: "Real"
                font.pixelSize: 20
                font.bold: true

                background: Rectangle {
                    color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                    border.color: "#90EE90"
                    border.width: 2
                    radius: 10
                }
            }

            Button {
                id: onOffButton
                x: realButton.x + realButton.width + 15
                y: 0
                width: simButton.width
                height: simButton.height
                text: "On_off"
                font.pixelSize: 20
                font.bold: true

                background: Rectangle {
                    color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                    border.color: "#90EE90"
                    border.width: 2
                    radius: 10
                }
            }

            Button {
                id: errorClrButton
                x: onOffButton.x + onOffButton.width + 15
                y: 0
                width: simButton.width
                height: simButton.height
                text: "Error_clr"
                font.pixelSize: 20
                font.bold: true

                background: Rectangle {
                    color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                    border.color: "#90EE90"
                    border.width: 2
                    radius: 10
                }
            }

            Button {
                id: markClrButton
                x: errorClrButton.x + errorClrButton.width + 15
                y: 0
                width: simButton.width
                height: simButton.height
                text: "Mark_clr"
                font.pixelSize: 20
                font.bold: true

                background: Rectangle {
                    color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                    border.color: "#90EE90"
                    border.width: 2
                    radius: 10
                }
            }

            Button {
                id: homeButton
                x: markClrButton.x + markClrButton.width + 15
                y: 0
                width: simButton.width
                height: simButton.height
                text: "Home"
                font.pixelSize: 20
                font.bold: true

                background: Rectangle {
                    color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                    border.color: "#90EE90"
                    border.width: 2
                    radius: 10
                }
            }

            // Second row
            Button {
                id: pauseRunButton
                x: 0
                y: simButton.y + simButton.height + 10
                width: simButton.width
                height: simButton.height
                text: "Pause_run"
                font.pixelSize: 20
                font.bold: true

                background: Rectangle {
                    color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                    border.color: "#90EE90"
                    border.width: 2
                    radius: 10
                }
            }

            Button {
                id: startStopButton
                x: pauseRunButton.x + pauseRunButton.width + 15
                y: pauseRunButton.y
                width: simButton.width
                height: simButton.height
                text: "Start_stop"
                font.pixelSize: 20
                font.bold: true

                background: Rectangle {
                    color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                    border.color: "#90EE90"
                    border.width: 2
                    radius: 10
                }
            }

            Button {
                id: exitButton
                x: startStopButton.x + startStopButton.width + 15
                y: pauseRunButton.y
                width: simButton.width
                height: simButton.height
                text: "Exit"
                font.pixelSize: 20
                font.bold: true

                background: Rectangle {
                    color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                    border.color: "#90EE90"
                    border.width: 2
                    radius: 10
                }
            }

            Button {
                id: closeButton
                x: exitButton.x + exitButton.width + 15
                y: pauseRunButton.y
                width: simButton.width
                height: simButton.height
                text: "Close"
                font.pixelSize: 20
                font.bold: true

                background: Rectangle {
                    color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                    border.color: "#90EE90"
                    border.width: 2
                    radius: 10
                }
            }

            Button {
                id: speedOpButton
                x: closeButton.x + closeButton.width + 15
                y: pauseRunButton.y
                width: simButton.width
                height: simButton.height
                text: "Speed op"
                font.pixelSize: 20
                font.bold: true

                background: Rectangle {
                    color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                    border.color: "#90EE90"
                    border.width: 2
                    radius: 10
                }
            }
            Rectangle {
                id: textfield_1
                x: speedOpButton.x + speedOpButton.width + 15
                y: pauseRunButton.y + 5
                width: simButton.width
                height: simButton.height - 10
                color: "white"
                border.color: "#90EE90"
                radius: 10
            }

            // Third row
            Rectangle {
                id: textfield_2
                x: 0
                y: pauseRunButton.y + pauseRunButton.height + 15
                width: simButton.width
                height: simButton.height - 10
                color: "white"
                border.color: "#90EE90"
                radius: 10
            }
            Button {
                id: addToolButton
                x: startStopButton.x
                y: pauseRunButton.y + pauseRunButton.height + 10
                width: simButton.width
                height: simButton.height
                text: "Add tool"
                font.pixelSize: 20
                font.bold: true

                background: Rectangle {
                    color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                    border.color: "#90EE90"
                    border.width: 2
                    radius: 10
                }
            }

            Button {
                id: toolIpButton
                x: exitButton.x
                y: addToolButton.y
                width: simButton.width
                height: simButton.height
                text: "Tool ip"
                font.pixelSize: 20
                font.bold: true

                background: Rectangle {
                    color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                    border.color: "#90EE90"
                    border.width: 2
                    radius: 10
                }
            }
            Rectangle {
                id: textfield_3
                x: toolIpButton.x + toolIpButton.width + 15
                y: pauseRunButton.y + pauseRunButton.height + 15
                width: simButton.width
                height: simButton.height - 10
                color: "white"
                border.color: "#90EE90"
                radius: 10
            }

            // Fourth row
            Rectangle {
                id: textfield_4
                x: 0
                y: textfield_2.y + textfield_2.height + 20
                width: simButton.width
                height: simButton.height - 10
                color: "white"
                border.color: "#90EE90"
                radius: 10
            }
            Button {
                id: tpFileButton
                x: startStopButton.x
                y: textfield_2.y + textfield_2.height + 15
                width: simButton.width
                height: simButton.height
                text: "Tp file"
                font.pixelSize: 20
                font.bold: true

                background: Rectangle {
                    color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                    border.color: "#90EE90"
                    border.width: 2
                    radius: 10
                }
            }
            Rectangle {
                id: textfield_5
                x: exitButton.x
                y: textfield_4.y
                width: simButton.width
                height: simButton.height - 10
                color: "white"
                border.color: "#90EE90"
                radius: 10
            }

            Button {
                id: pgFileButton
                x: closeButton.x
                y: tpFileButton.y
                width: simButton.width
                height: simButton.height
                text: "Pg file"
                font.pixelSize: 20
                font.bold: true

                background: Rectangle {
                    color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                    border.color: "#90EE90"
                    border.width: 2
                    radius: 10
                }
            }
            Rectangle {
                id: textfield_6
                x: speedOpButton.x
                y: textfield_4.y
                width: simButton.width
                height: simButton.height - 10
                color: "white"
                border.color: "#90EE90"
                radius: 10
            }
        }
    }

    Rectangle {
        id: table_1
        anchors.top: parent.top
        anchors.topMargin: 455
        anchors.left: parent.left
        anchors.leftMargin: 970
        width: 920
        height: 180
        color: "#ffffff"
    }
    Rectangle {
        id: rectangle2
        anchors.top: parent.top
        anchors.topMargin: 650
        anchors.left: parent.left
        anchors.leftMargin: 970
        // width: 920
        // height: 350
        // color: "#ffffff"

        //First row
        Button {
            id: insertprg
            x: 0
            y: 0
            width: 125
            height: 50
            text: "Insert_prg"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Button {
            id: deleteprg
            x: insertprg.x + insertprg.width + 8
            y: 0
            width: insertprg.width
            height: insertprg.height
            text: "Delete_prg"
            font.pixelSize: 14
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Button {
            id: newprg
            x: deleteprg.x + deleteprg.width + 8
            y: 0
            width: insertprg.width
            height: insertprg.height
            text: "New_prg_file"
            font.pixelSize: 14
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Button {
            id: delprg
            x: newprg.x + newprg.width + 8
            y: 0
            width: insertprg.width
            height: insertprg.height
            text: "Del_prg_file"
            font.pixelSize: 14
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Button {
            id: openprg
            x: delprg.x + delprg.width + 8
            y: 0
            width: insertprg.width
            height: insertprg.height
            text: "Open_prg_file"
            font.pixelSize: 14
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Button {
            id: runprg
            x: openprg.x + openprg.width + 8
            y: 0
            width: insertprg.width
            height: insertprg.height
            text: "Run_prg"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Button {
            id: trjfile
            x: runprg.x + runprg.width + 8
            y: 0
            width: insertprg.width
            height: insertprg.height
            text: "Trj_file"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }

        //Second row
        Button {
            id: xyz
            x: 0
            y: insertprg.y + insertprg.height + 5
            width: insertprg.width
            height: insertprg.height
            text: "XYZ"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Button {
            id: add_tp
            x: insertprg.x + insertprg.width + 8
            y: xyz.y
            width: insertprg.width
            height: insertprg.height
            text: "Add_Tp"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Button {
            id: insert_tp
            x: deleteprg.x + deleteprg.width + 8
            y: xyz.y
            width: insertprg.width
            height: insertprg.height
            text: "Insert_Tp"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Button {
            id: del_tp
            x: newprg.x + newprg.width + 8
            y: xyz.y
            width: insertprg.width
            height: insertprg.height
            text: "Delete_Tp"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Button {
            id: new_tp
            x: delprg.x + delprg.width + 8
            y: xyz.y
            width: insertprg.width
            height: insertprg.height
            text: "New_Tp"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Button {
            id: open_tp
            x: openprg.x + openprg.width + 8
            y: xyz.y
            width: insertprg.width
            height: insertprg.height
            text: "Open_Tp"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Button {
            id: save_tp
            x: runprg.x + runprg.width + 8
            y: xyz.y
            width: insertprg.width
            height: insertprg.height
            text: "Save_Tp"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
    }
    Rectangle {
        id: rectangle_2
        anchors.top: parent.top
        anchors.topMargin: 765
        anchors.left: parent.left
        anchors.leftMargin: 970
        //First Row
        Button {
            id: prg_ip
            x: 0
            y: 0
            width: 125
            height: 50
            text: "Prg ip"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Rectangle {
            id: textfield_7
            x: prg_ip.x + prg_ip.width + 8
            y: 5
            width: 125
            height: 40
            color: "white"
            border.color: "#90EE90"
            radius: 10
        }

        //Second Row
        Button {
            id: prg_op
            x: 0
            y: prg_ip.x + prg_ip.height + 5
            width: 125
            height: 50
            text: "Prg op"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Rectangle {
            id: textfield_8
            x: prg_ip.x + prg_ip.width + 8
            y: prg_ip.x + prg_ip.height + 10
            width: 125
            height: 40
            color: "white"
            border.color: "#90EE90"
            radius: 10
        }
    }
    Rectangle {
        id: table_2
        anchors.top: parent.top
        anchors.topMargin: 765
        anchors.left: parent.left
        anchors.leftMargin: 1240
        width: 650
        height: 105
        color: "#ffffff"
    }
    Rectangle {
        id: rectangle_3
        anchors.top: parent.top
        anchors.topMargin: 880
        anchors.left: parent.left
        anchors.leftMargin: 970

        //First Row
        Button {
            id: instruction
            x: 0
            y: 0
            width: 108
            height: 50
            text: "Instruction"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Button {
            id: inst
            x: instruction.x + instruction.width + 8
            y: 0
            width: instruction.width
            height: instruction.height
            text: "INST"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Button {
            id: h_l
            x: inst.x + inst.width + 8
            y: 0
            width: instruction.width
            height: instruction.height
            text: "H/L"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Button {
            id: high
            x: h_l.x + h_l.width + 8
            y: 0
            width: instruction.width
            height: instruction.height
            text: "High"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Button {
            id: delay_ms
            x: high.x + high.width + 8
            y: 0
            width: instruction.width
            height: instruction.height
            text: "Delay_ms"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Rectangle {
            id: textfield_9
            x: delay_ms.x + delay_ms.width + 8
            y: 5
            width: instruction.width
            height: instruction.height - 10
            color: "white"
            border.color: "#90EE90"
            radius: 10
        }
        Button {
            id: loop
            x: textfield_9.x + textfield_9.width + 8
            y: 0
            width: instruction.width
            height: instruction.height
            text: "Loop"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Rectangle {
            id: textfield_10
            x: loop.x + loop.width + 8
            y: 5
            width: instruction.width
            height: instruction.height - 10
            color: "white"
            border.color: "#90EE90"
            radius: 10
        }

        //Second Row
        Button {
            id: mm_s
            x: 0
            y: instruction.y + instruction.height + 8
            width: 108
            height: 50
            text: "mm/s"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Rectangle {
            id: textfield_11
            x: instruction.x + instruction.width + 8
            y: mm_s.y + 5
            width: instruction.width
            height: instruction.height - 10
            color: "white"
            border.color: "#90EE90"
            radius: 10
        }
        Button {
            id: radius
            x: inst.x + inst.width + 8
            y: mm_s.y
            width: instruction.width
            height: instruction.height
            text: "Radiu"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Rectangle {
            id: textfield_12
            x: h_l.x + h_l.width + 8
            y: mm_s.y + 5
            width: instruction.width
            height: instruction.height - 10
            color: "white"
            border.color: "#90EE90"
            radius: 10
        }
        Button {
            id: an_ip
            x: high.x + high.width + 8
            y: mm_s.y
            width: instruction.width
            height: instruction.height
            text: "AN_ip"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Rectangle {
            id: textfield_13
            x: delay_ms.x + delay_ms.width + 8
            y: mm_s.y + 5
            width: instruction.width
            height: instruction.height - 10
            color: "white"
            border.color: "#90EE90"
            radius: 10
        }
        Button {
            id: an_op
            x: textfield_9.x + textfield_9.width + 8
            y: mm_s.y
            width: instruction.width
            height: instruction.height
            text: "AN_op"
            font.pixelSize: 16
            font.bold: true

            background: Rectangle {
                color: parent.pressed ? "#A9A9A9" : "#D3D3D3"
                border.color: "#90EE90"
                border.width: 2
                radius: 10
            }
        }
        Rectangle {
            id: textfield_14
            x: loop.x + loop.width + 8
            y: mm_s.y + 5
            width: instruction.width
            height: instruction.height - 10
            color: "white"
            border.color: "#90EE90"
            radius: 10
        }
    }
}
