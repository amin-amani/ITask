import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
GridLayout{

    id:taskGrid
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.fill: parent
    rows: 3
    height:100

    Rectangle
    {
        id:test
    }
//=====================================================================
    function orderX(selectedObject,selectedWidth)
    {

        if(selectedObject.x< selectedWidth/6)
            selectedObject.x=0
        else if(selectedObject.x>selectedWidth/ 6 && selectedObject.x<3*selectedWidth/ 6 )
            selectedObject.x=selectedWidth/3
        else
        {
            selectedObject.x=2*selectedWidth/3
        }
    }
//=====================================================================
    function orderY(selectedObject)
    {
      selectedObject.y=selectedObject.y-(selectedObject.y%selectedObject.height);
    }
//=====================================================================
    function refreshTaskTable(x,y,objectName)
    {
            var selectedObject
        for (var i=0;i<taskGrid.children.length;i++)
        {
            if(  taskGrid.children[i].objectName.includes(objectName)){
                selectedObject=taskGrid.children[i]
                orderX(selectedObject,taskGrid.width)
                orderY(selectedObject)
            }
        }
        for ( i=0;i<taskGrid.children.length;i++)
        {

           if(selectedObject.x ===taskGrid.children[i].x && selectedObject.y === taskGrid.children[i].y
                   && objectName!== selectedObject.objectName  )
           {
               console.log("same location")
           }
          }

    }
//=====================================================================
function createTask()
{
    var component = Qt.createComponent("qrc:/DraggableRect.qml");
    for (var i=0; i<5; i++) {
        var object = component.createObject(taskGrid,
                                            {
                                             backGroundColor: "orange",
                                            }
                                            );
        object.width=taskGrid.width/3
        object.height=object.width*2/3
        object.x = (object.width + 10) * i;
        object.rectID=i
        object.objectName="taskBox"+i;
        object.parent=taskGrid
        object.onRectDragFinished.connect(refreshTaskTable)

                               }
}
//=====================================================================
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
