import QtQuick 2.0
Rectangle {
    property color backGroundColor: "orange"
    property int rectWidth: 80
    property int rectID: 1
    property int rectHeight: 120
    signal rectClicked()
    signal rectDragFinished(int x,int y,variant obj)
    id:mainRect
    width: rectWidth;
    height: rectHeight;
    color: backGroundColor
    objectName: "a1"
    Drag.active: dragArea.drag.active


    function setPos(xs,ys)
    {
        x=xs
        y=ys
    }

    Rectangle
    {
        anchors.centerIn: parent
        width: parent.width-20
        height:  parent.height-20
        radius: 5
        clip: true
        color: "red"
    }
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

            rectDragFinished(parent.x,parent.y,mainRect.objectName)
        }

    }

}
