import QtQuick 2.2
import QtQuick.Controls 2.2

ApplicationWindow {
    id: a
    width: 500
    height: 500
    visible: true

    Column {
        anchors.fill: parent
        spacing: 10
        y: 5
        x: 15

        Row {
            width: parent.width - parent.leftPadding
            height: parent.height * 0.9
            spacing: 5

            Rectangle {
                width: parent.width * 0.8
                height: parent.height
                anchors.bottom: parent.bottom
                border.color: "black"
                border.width: 1

                ScrollView {
                    id: view
                    anchors.fill: parent

                    TextArea {
                        focus:  Qt.NoFocus
                        readOnly: true
                        text: connector.messages
                    }
                }
            }

            Rectangle {
                width: parent.width * 0.18 - parent.spacing
                height: parent.height
                anchors.bottom: parent.bottom
                border.color: "green"
                border.width: 1

                ListView {
                    model: 3
                    anchors.fill: parent


                    delegate: Text {
                        id: name
                        text: qsTr("text")
                        height: 15
                    }
                }
            }


        }

        Rectangle {
            id: textRectangle
            width: parent.width * 0.95
            height: parent.height * 0.05
            border.color: "black"
            border.width: 1

            TextInput {
                id : input
                width: parent.width * 0.9
                height: parent.height
                text: qsTr("")
                focus: Qt.StrongFocus
            }

            Button {
                text: "Send"
                width: parent.width * 0.1
                height: parent.height
                anchors.left: input.right
                anchors.leftMargin: 5

                onClicked: {
                    connector.sendDatagram(input.text)
                }

            }
        }

    }
}
