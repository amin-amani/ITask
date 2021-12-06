import QtQuick 2.0


//Item {


    Rectangle {
        property color backGroundColor: "red"
        property int rectWidth: 80
        property int rectHeight: 120
        signal rectClicked()
        signal rectDragFinished(int x,int y)
        id:draggable
        width: rectWidth;
        height: rectHeight;
        color: backGroundColor
         Drag.active: dragArea.drag.active

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

                rectDragFinished(draggable.x,draggable.y)
            }




        }



    }

//}
