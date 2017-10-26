import QtQuick 2.7
import QtQuick.Window 2.3
import QtQml.Models 2.2
import QtQuick.Controls 1.4 as CC1

Window {
    id: window
    width: 640
    height: 480
    visible: true

    property int columns: 20
    property int rows: 1000

    ListModel {
        id: tableModel
        // ListElement is like RowData, with each property being a column in the row
        Component.onCompleted: {
            for (var i = 0; i < window.rows; ++i)
                tableModel.append({ titleRole: "title " + i })
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
            for (var i = 0; i < window.columns; ++i)
                tableView.addColumn(columnComponent.createObject(tableView, { title: "Title: " + i }))
        }
    }

    Component {
        id: columnComponent
        CC1.TableViewColumn {
            width: 100
            role: "titleRole"
        }
    }

}
