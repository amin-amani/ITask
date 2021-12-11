import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
Rectangle {
    visible: true
    id:mainForm
    width: 640
    height: 480
    ListModel {
        id: objectsModel
    }

    function refreshTaskTable(x,y,id)
    {

        for (var i=0;i<taskGrid.children.length;i++)
        {

            if(  taskGrid.children[i].objectName.includes(objectsModel.get(id).objectName)){
                var selectedObject= taskGrid.children[i]
                if(selectedObject.x< mainForm.width/6)
                    taskGrid.children[i].x=0;
                else if(selectedObject.x>mainForm.width/ 6 && x<3*mainForm.width/ 6 )
                    selectedObject.x=mainForm.width/3
                else
                    selectedObject.x=2*mainForm.width/3

            }
        }

    }

    //========================================================================================
    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 0
        Page1Form {
            id:mainPage

            GridLayout{

                id:taskGrid
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width-40

                rows: 3
                height:100
                Text {

                    text: qsTr("ToDo")
                }
                Text {

                    text: qsTr("Doing")
                }
                Text {

                    text: qsTr("Done")
                }


            }
            Component.onCompleted: {
                var component = Qt.createComponent("DraggableRect.qml");
                for (var i=0; i<5; i++) {
                    var object = component.createObject(taskGrid,
                                                        {
                                                            backGroundColor: "orange",
                                                        }
                                                        );

                    object.width=taskGrid.width/3
                    object.x = (object.width + 10) * i;
                    object.rectID=i
                    object.objectName="aa"+i

                    object.onRectDragFinished.connect(refreshTaskTable)
                    objectsModel.append(object)
                }
            }




        }

        Page2Form {
        }
    }
}
