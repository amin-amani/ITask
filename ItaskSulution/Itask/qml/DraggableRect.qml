import QtQuick 2.0


//Item {


Rectangle {
    property color backGroundColor: "red"
    property int rectWidth: 80
    property int rectID: 1
    property int rectHeight: 120
    signal rectClicked()
    signal rectDragFinished(int x,int y,variant obj)
    width: rectWidth;
    height: rectHeight;
    color: backGroundColor
    Drag.active: dragArea.drag.active
    border.color: "black"
    function setPos(xs,ys)
    {
        x=xs
        y=ys
    }
    //Drag.hotSpot.x: 10
    ///Drag.hotSpot.y: 10
    MouseArea
    {
        id:dragArea
        anchors.fill: parent;
        drag.target: parent
        onClicked:
        {
            rectClicked()
        }
        onReleased:
        {

            rectDragFinished(parent.x,parent.y,rectID)
        }




    }



}

//}
