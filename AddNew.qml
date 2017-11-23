import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.0





Rectangle {

    function save(){
        client.save(bookname.text, textAuthor.text, fileDialog.fileUrl)
    }



color:  "#999999"

Column{

    anchors.top : parent.top
    anchors.left: parent.left
    anchors.right: parent.right


    Rectangle{
        id: bookname
        property string text : textfield.text


        width: parent.width
        height:  100
        color:  "#999999"

        ScrollView {

            anchors.fill: parent
            clip : true

            TextField {
                id : textfield
                placeholderText: "Book title"
                color: "#ffffff"
                font.pixelSize: 25
                width: bookname.width

                background: Rectangle {
                 color:  "#999999"
              }
            }
        }

    } //bookname






    Rectangle { color: "#707070"; width: parent.width; height: 1; }


    Rectangle{
        id: author

        width: parent.width
        height:  100

        color:  "#999999"

        ScrollView {

            anchors.fill: parent
            clip : true

            TextEdit {
                id: textAuthor
                width: 200
                height: 50
                font.pixelSize: 25
                color: "#ffffff"

                property string placeholderText: "Author"

                Text {
                    text: textAuthor.placeholderText
                    color: "#aaa"
                    visible: !textEdit.text
                    font.pixelSize: 25
                }
            }
        }

    }  //Rectangle

    Rectangle { id: line; color: "#707070"; width: parent.width; height: 1; }


    Rectangle {
        width: 150
        height: 150
        //color : "red"
        border.width: 1

        anchors.horizontalCenter: parent.horizontalCenter

        Image{
            id: picture
            anchors.fill: parent
            sourceSize.width: width
            sourceSize.height: height
            source :"image://pathProvider/" + fileDialog.fileUrl


            MouseArea{
                anchors.fill: parent
                onClicked: {
                    fileDialog.visible = true
                }
            }
        }
    }


      Rectangle {  color: "#707070"; width: parent.width; height: 1; }

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
                }
                onRejected: {
                    console.log("Canceled")
                    Qt.quit()
                }
                //Component.onCompleted: visible = true
            }




    Row{
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