import QtQuick 2.12
import QtQuick.Controls 2.5

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
function test(x,y,id)
{

 console.log("x:",x," y:",y," id:",objectsModel.get(id).objectName )
    objectsModel.get(2).set=2

//    console.log("applySnapGrid ",id," ",objectsModel.get(id).x)
//    if(x< mainForm.width/6)
//         objectsModel.get(id).x=0
//    else if(x>mainForm.width/ 6 && x<3*mainForm.width/ 6 )
//         objectsModel.get(id).x=mainForm.width/3
//   else
//         objectsModel.get(id).x=2*mainForm.width/3
}




    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 0


        Page1Form {

//            DraggableRect
//            {
//                id:taskDelegate
//                rectWidth: mainForm.width/3;
//                rectHeight: 200
//                backGroundColor: "red"
//                onRectDragFinished:
//                {
//                    applySnapGrid(this,mainForm)
//                }

//            }            DraggableRect
//            {
//                id:taskDelegate2
//                rectWidth: mainForm.width/3;
//                rectHeight: 200
//                backGroundColor: "blue"
//                onRectDragFinished:
//                {
//                    applySnapGrid(this,mainForm)
//                }

//            }
            Component.onCompleted: {
                 var component = Qt.createComponent("DraggableRect.qml");
                 for (var i=0; i<5; i++) {
                     var object = component.createObject(this,
                                                         {
                                                             backGroundColor: "orange",


                                                         }
                                                         );


                     object.x = (object.width + 10) * i;
                     object.rectID=i
                    object.objectName="aa"+i

                    object.onRectDragFinished.connect(test)
                     objectsModel.append(object)
                 }
                }


        }

        Page2Form {
        }
    }


}
