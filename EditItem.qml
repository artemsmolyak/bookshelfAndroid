import QtQuick 2.0

Item {

    function getBooknam(id){

         var bookname = client.getBookname(id)
        console.log("yeah " +  bookname + " "  +  id )
        return bookname
    }

    function example(){

        console.log("teSt")
        return "test"
    }


property int id
    property int widthRec: width/0.5
    property int heightRec: height/5


//    Component.onCompleted: {
//    }

    Rectangle {
        id : concreteRect
        border.width: 1

        width: widthRec
        height:   heightRec
        color : "red"



        Column{
            Row{
               // anchors.verticalCenter: parent.verticalCenter

                Image{
                    width: 100
                    height: heightRec * 0.9
                    source: "image://myprovider/"+id
                }

                Column{
                    Text{
                         text:  getBooknam(id)
                         color : "white"
                    }
                    Text{
                        text:   client.getAuthor(id)
                        color : "white"
                    }
                }
            }
            Rectangle{
                width: parent.width
                height: 100
                color : "grey"
                  Text{
                      text:   client.getReview(id)
                      color : "white"
                  }
            }
        }


    }

    Rectangle{
        anchors.bottom: parent.bottom
        color: "blue"
        width: parent.width
        height: parent.height * 0.1

        Image {
            id: imgBack
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            source: "../pics/navigation_previous_item.png"
            sourceSize.height: parent.height
            sourceSize.width: parent.width * 0.7
        }

        MouseArea {
            id: mouseImg
            anchors.fill: parent
            onClicked:
            {
                stackView.pop()
                //console.log("log " + currentDate )
            }

        }

    }


}
