import QtQuick 2.11
import QtQuick.Controls 2.4

ApplicationWindow {
    id: a
    width: 500
    height: 500
    visible: true

    Column {
        anchors.fill: parent
        spacing: 10
        topPadding: 5
        leftPadding: 15

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
                        text: "TextArea\n...\n...\n...\n...\n...\n...\n...\n...\n...\n...\n...\n...\n...\n...\n...\n...\n...\n...\n"
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
                anchors.fill: parent
                text: qsTr("aaa")
                focus: Qt.StrongFocus
            }
        }
    }
}
