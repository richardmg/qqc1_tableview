import QtQuick 2.7
import QtQuick.Window 2.3
import QtQml.Models 2.2
import QtQuick.Controls 1.4 as CC1

Window {
    id: window
    width: 640
    height: 480
    visible: true

//    ListView {
//        anchors.fill: parent
//        model: 100
//        delegate: Rectangle {
//            width: 100
//            height: 50
//            color: index % 2 ? "lightGray" : "lightBlue"
//            Text {
//                text: "index: " + index
//            }
//        }
//    }

    //    ObjectModel {
    //        id: objectModel
    //        Text { text: "one" }
    //        Text { text: "two" }
    //        Text { text: "three" }
    //    }

    //    ListView {
    //        anchors.fill: parent
    //        model: objectModel

    //        visible: false
    //    }

    ListModel {
        id: tableModel
        // ListElement is like RowData, with each property being a column in the row
        ListElement {
            titleRole: "title1"
            nameRole: "name1"
        }
        ListElement {
            titleRole: "title2"
            nameRole: "name2"
        }
        ListElement {
            titleRole: "title3"
            nameRole: "name3"
        }
    }

    CC1.TableView {
        anchors.fill: parent
        model: tableModel

        CC1.TableViewColumn {
            title: "Title"
            role: "titleRole"
        }

        CC1.TableViewColumn {
            title: "Name"
            role: "nameRole"
        }

        itemDelegate: Text {
            text: styleData.value
        }
    }
}
