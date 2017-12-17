import QtQuick 2.0

Item {


    GridView{
        id : grid
        anchors.fill: parent
        cellWidth: 100
        cellHeight: 100

        model: modelPhoto

         //highlight: Rectangle { width: 80; height: 80; color: "lightsteelblue"; radius: 5 }


        delegate: Rectangle{
            width:    grid.cellWidth
            height:  grid.cellHeight

           border.width: 1

            Image {
                //anchors.fill: parent
                anchors.centerIn: parent
                id: name
                width: parent.width * 0.9
                height: parent.height * 0.9
                sourceSize.width: 50
                sourceSize.height: 50
                source: "image://pathProvider/"+modelData

            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    client.setPicPath(modelData)
                    stackView.pop()
                }
            }
        }
    }
}


