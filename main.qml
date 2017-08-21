import QtQuick 2.7
import QtQuick.Window 2.3
import QtQml.Models 2.2
import QtQuick.Controls 1.4 as CC1

Window {
    id: window
    width: 640
    height: 480
    visible: true

    ListModel {
        id: tableModel
        // ListElement is like RowData, with each property being a column in the row
        Component.onCompleted: {
            for (var i = 0; i < 1000; ++i)
                tableModel.append({ titleRole: "title " + i })
        }
    }

    Component {
        id: columnComponent
        CC1.TableViewColumn {
            width: 100
            // ListElement will typically have many roles, but one should be used for the column header title
            role: "titleRole"
        }
    }

    CC1.TableView {
        id: tableView
        anchors.fill: parent
        model: tableModel

        itemDelegate: Text {
            text: styleData.value
        }

        Component.onCompleted: {
            for (var i = 0; i < 100; ++i)
                tableView.addColumn(columnComponent.createObject(tableView, { title: "Title: " + i }))
        }
    }
}
