import QtQuick 2.11
import QtQuick.Controls 2.4

ApplicationWindow {
    id: a
    width: {console.log("aa"); return 400}
    height: 800
    visible: true

//    Rectangle {
//        anchors.fill: parent
//        color: "red"
//    }
}
