import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.0





Rectangle {

    id : addnew
    objectName: "addnew"

    function info(){
        console.log("cli " + picPath + "+++")
    }


    function setPicPath(path){

        picPath = path
    }


    property string picPath : ":pics/icon.png"


    function save(){
        client.save(bookname.text, textAuthor.text, fileDialog.fileUrl)
        client.update()
    }




color:  "#999999"

Column{

    anchors.top : parent.top
    anchors.left: parent.left
    anchors.right: parent.right


    Rectangle{
        id: bookname

        width: parent.width
        height:  50
        color:  "#999999"

        ScrollView {

            anchors.fill: parent
            clip : true

            TextEdit {
                id : textBookname

                width: bookname.width
                height: 50

                color: "#ffffff"
                font.pixelSize: 25

                property string placeholderText: "Bookname"

                 Text {
                     anchors.verticalCenter: parent.verticalCenter
                     text: textBookname.placeholderText
                     color: "grey"
                     visible: !textBookname.text
                     font.pixelSize: 25
                 }


            }
        }

    } //bookname






    Rectangle { color: "#707070"; width: parent.width; height: 1; }


    Rectangle{
        id: author

        width: parent.width
        height:  50
        color:  "#999999"

        ScrollView {

            anchors.fill: parent
            clip : true

            TextEdit {
                id: textAuthor
                width:  bookname.width

                height: 50
                font.pixelSize: 25
                color: "#ffffff"

                property string placeholderText: "Author"

                 Text {
                     anchors.verticalCenter: parent.verticalCenter
                     text: textAuthor.placeholderText
                     color: "grey"
                     visible: !textAuthor.text
                     font.pixelSize: 25
                 }
            }
        }

    }  //author

    Rectangle { id: line; color: "#707070"; width: parent.width; height: 1; }



Item{
    width: parent.width
    height: 150


    Row{
        anchors.fill: parent

             Image{
                id: picture

                width: parent.width/2.0
                height: parent.height
                sourceSize.width: parent.width/2.0
                sourceSize.height:   parent.height
                source : "image://pathProvider/"  + picPath   // ?  picPath : fileDialog.fileUrl


                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        fileDialog.visible = true

                    }
                }
            }


        Rectangle{
            width: parent.width/2.0
            height: parent.height
            color :  "#999999"


            Column{

               anchors.centerIn: parent
               spacing: 10

                Button {


                    id: buttonGoogle
                    text: "Google"

                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 40
                        color: button.down ? "#d6d6d6" : "#f6f6f6"
                        border.color: "#26282a"
                        border.width: 1
                        radius: 4
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
//                            save()
//                            stackView.pop()

                            client.search()
                            stackView.push(Qt.resolvedUrl("Search.qml"))
                        }
                    }
                }

                Button {
                    id: buttonPhone

                    text: "Phone"

                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 40
                        color: button.down ? "#d6d6d6" : "#f6f6f6"
                        border.color: "#26282a"
                        border.width: 1
                        radius: 4
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                             fileDialog.visible = true
                            //stackView.pop()
                        }

                    }

                }

            }  ///btns

        }


    }
}



      Rectangle {id : lineBeforeReview;  color: "#707070"; width: parent.width; height: 1; }

      Rectangle{
          id: situation
          width: parent.width
          height: 150
           radius: 5

          ScrollView {

              anchors.fill: parent

              TextArea{
                  id: situationText
                  width:  situation.width
                  height: situation.height
                  focus: true
                  placeholderText:  qsTr("here must be your text")
                  wrapMode: Text.WrapAnywhere
              }
          }
      }


}


            FileDialog {
                id: fileDialog
                title: "Please choose a file"
                folder: shortcuts.home
                visible: false
                onAccepted: {
                    console.log("You chose: " + fileDialog.fileUrls)
                    //picture.source =  fileDialog.fileUrl
                    //client.setPicture(fileDialog.fileUrl)
                    //Qt.quit()
                    picPath = fileDialog.fileUrl
                }
                onRejected: {
                    console.log("Canceled")
                   //Qt.quit()
                }
                //Component.onCompleted: visible = true
            }




    Row{
        id : buttonsDown
          anchors.bottom: parent.bottom
          anchors.horizontalCenter: parent.horizontalCenter
          anchors.bottomMargin: 10
          spacing: 10

    Button {
            id: buttonOk
            text: "Save"

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                color: button.down ? "#d6d6d6" : "#f6f6f6"
                border.color: "#26282a"
                border.width: 1
                radius: 4
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    save()
                    stackView.pop()
                }
            }
        }

    Button {
            id: buttonCancel
            text: "Cancel"

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                color: button.down ? "#d6d6d6" : "#f6f6f6"
                border.color: "#26282a"
                border.width: 1
                radius: 4
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                     stackView.pop()
                }

            }

        }
    }



}
