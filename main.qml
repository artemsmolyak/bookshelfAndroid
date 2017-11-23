import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.1



Window {

    id : mainForm
    visible: true
    width: 320
    height: 480
    title: qsTr("Bookshelf")

    property int widthRec: width/0.5
    property int heightRec: height/5


    StackView {
        id: stackView
        initialItem: page
        anchors.fill: parent

        delegate: StackViewDelegate {
               function transitionFinished(properties)
               {
                   properties.exitItem.x = 0
                   properties.exitItem.rotation = 0
               }

               pushTransition: StackViewTransition {
                   SequentialAnimation {
                       ScriptAction {
                           script: enterItem.rotation = 0
                       }
                       PropertyAnimation {
                           target: enterItem
                           property: "x"
                           from: enterItem.width
                           to: 0
                       }
                       PropertyAnimation {
                           target: enterItem
                           property: "rotation"
                           from: 90
                           to: 0
                       }
                   }
                   PropertyAnimation {
                       target: exitItem
                       property: "x"
                       from: 0
                       to: -exitItem.width
                   }
               }
           }


    }


        Item {
            id: page
            anchors.fill: parent

            Component{
                id : addButton


                Column {
                    width: parent.width


                    Rectangle{
                        id : addRect
                        height: heightRec
                        width: parent.width
                        color:  "#999999"

                        Text {
                            text: "Add new"
                            anchors { left: parent.left; leftMargin: 20 }
                            anchors.verticalCenter: parent.verticalCenter
                            font.pixelSize: 25
                            color: "#ffffff"
                        }

                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                       stackView.push(Qt.resolvedUrl("AddNew.qml"))
                            }
                        }



//                        states:[
//                            State{
//                                name: "State1"
//                                PropertyChanges{target : addRect; x: 0; y: 0}

//                            },
//                            State{
//                                name: "State2"
//                                PropertyChanges{target : addRect; x: 10; y:300}
//                            }
//                        ]
//                        transitions: [
//                        Transition {
//                                from: "State1"
//                                to: "State2"
//                                PropertyAnimation{
//                                    target: addRect
//                                    properties: "x,y"
//                                    easing.type: Easing.InCirc
//                                    duration: 5000
//                                }
//                            }
//                        ]
                    }


                    //Rectangle { color: "#c1c1c1"; width: parent.width; height: 1 }
                     Rectangle { color: "#707070"; width: parent.width; height: 1; }

                    SearchDelegate {
                        id: wordSearch
                        label: "Search by author..."
                        placeHolder: "Enter author"
                        myheight: heightRec
                        onHasOpened: {
                            tagSearch.close()
                            userSearch.close()
                        }
                        onOk: {
                            mainListView.positionViewAtBeginning()
                            mainListView.clear()
                            tweetsModel.from = ""
                            tweetsModel.phrase = searchText
                        }
                    }

                    SearchDelegate {
                        id: userSearch
                        myheight: heightRec
                        label: "Search by title..."
                        placeHolder: "Enter title"
                        prefix: "@"
                        onHasOpened:{
                            tagSearch.close()
                            wordSearch.close()
                        }
                        onOk: {
                            mainListView.positionViewAtBeginning()
                            mainListView.clear()
                            tweetsModel.phrase = ""
                            tweetsModel.from = searchText
                        }
                    }

                    SearchDelegate {
                        id: tagSearch
                        myheight: heightRec
                        label: "Search by hashtag..."
                        placeHolder: "#hashtag"
                        prefix: "#"
                        onHasOpened:{
                            userSearch.close()
                            wordSearch.close()
                        }
                        onOk: {
                            mainListView.positionViewAtBeginning()
                            mainListView.clear()
                            tweetsModel.from = ""
                            tweetsModel.phrase = "#" + searchText
                        }
                    }

                }
            }


            ListView{
                model: myModel
                anchors.fill: parent
                delegate:contactDelegate
                header: addButton
            }

            Component{
                id: contactDelegate

                Rectangle {
                    id : concreteRect
                    border.width: 1

                    width: widthRec
                    height:   heightRec
                    color : "grey"


                    Row{
                        anchors.verticalCenter: parent.verticalCenter

                        Image{
                            width: 100
                            height: heightRec * 0.9
                            source: "image://myprovider/"+modelData.id
                        }

                        Column{
                            Text{  text:     modelData.bookname; color : "white"}
                            Text{  text:     modelData.author  }
                        }


                    }

                    MouseArea{
                        onClicked: {
                            color: "black"
                        }
                    }

                }
            }//delegate


        }
 }
