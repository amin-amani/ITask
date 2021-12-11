import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
Rectangle {
    visible: true
    id:mainForm
    width: 640
    height: 480

    function applySnapGrid(item,itemParent )
    {
        console.log("applySnapGrid")
        if(item.x< itemParent.width/6)
            item.x=0
        else if(item.x>itemParent.width/ 6 && item.x<3*itemParent.width/ 6 )
            item.x=itemParent.width/3
        else
            item.x=2*itemParent.width/3
    }


    ListModel {
        id: objectsModel
    }

    function refreshTaskTable(x,y,id)
    {

        for (var i=0;i<mainPage.children.length;i++)
        {

            if(  mainPage.children[i].objectName.includes(objectsModel.get(id).objectName)){
                var selectedObject= mainPage.children[i]
                if(selectedObject.x< mainForm.width/6)
                    mainPage.children[i].x=0;
                else if(selectedObject.x>mainForm.width/ 6 && x<3*mainForm.width/ 6 )
                    selectedObject.x=mainForm.width/3
                else
                    selectedObject.x=2*mainForm.width/3

            }
        }

    }




    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 0


        Page1Form {
            id:mainPage

            Component.onCompleted: {
                var component = Qt.createComponent("DraggableRect.qml");
                for (var i=0; i<5; i++) {
                    var object = component.createObject(mainPage,
                                                        {
                                                            backGroundColor: "orange",



                                                        }
                                                        );


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
