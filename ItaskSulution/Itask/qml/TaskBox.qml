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
    function refreshTaskTable(x,y,id)
    {
        for (var i=0;i<taskGrid.children.length;i++)
        {
            if(  taskGrid.children[i].objectName.includes(objectsModel.get(id).objectName)){

                orderX(taskGrid.children[i],taskGrid.width)
                orderY(taskGrid.children[i])
            }
        }
    }
//=====================================================================
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
        object.height=object.width*2/3
        object.x = (object.width + 10) * i;
        object.rectID=i
        object.objectName="aa"+i

        object.onRectDragFinished.connect(refreshTaskTable)
        objectsModel.append(object)

}}
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
