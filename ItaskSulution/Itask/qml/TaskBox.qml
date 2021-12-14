import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
GridLayout{

    id:taskGrid
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.fill: parent

    rows: 3
    height:100
    ListModel {
        id: objectsModel
    }
    function order(selectedObject,selectedWidth)
    {
 console.log(selectedWidth)
        if(selectedObject.x< selectedWidth/6)
            selectedObject.x=0;
        else if(selectedObject.x>selectedWidth/ 6 && selectedObject.x<3*selectedWidth/ 6 )
            selectedObject.x=selectedWidth/3
        else
        {selectedObject.x=2*selectedWidth/3

        }

    }

    function refreshTaskTable(x,y,id)
    {

        for (var i=0;i<taskGrid.children.length;i++)
        {

            if(  taskGrid.children[i].objectName.includes(objectsModel.get(id).objectName)){


                order(taskGrid.children[i],taskGrid.width)
//                var selectedObject= taskGrid.children[i]
//                if(selectedObject.x< mainForm.width/6)
//                    taskGrid.children[i].x=0;
//                else if(selectedObject.x>mainForm.width/ 6 && x<3*mainForm.width/ 6 )
//                    selectedObject.x=mainForm.width/3
//                else
//                    selectedObject.x=2*mainForm.width/3

            }
        }

    }

function createTask()
{
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

}}

    Text {

        text: qsTr("ToDo")
        MouseArea
        {
        anchors.fill: parent

        }
    }
    Text {

        text: qsTr("Doing")
    }
    Text {

        text: qsTr("Done")
    }
    Component.onCompleted: {
        createTask()
        }


}
