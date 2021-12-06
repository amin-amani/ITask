import QtQuick 2.12
import QtQuick.Controls 2.5

Rectangle {
    visible: true
    id:mainForm
    width: 640
    height: 480


    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 0

        Page1Form {
            DraggableRect
            {
                id:taskDelegate
                rectWidth: 100;
                rectHeight: 200
                backGroundColor: "red"
                onRectDragFinished:
                {
                    if(taskDelegate.x< mainForm.width/3)
                         taskDelegate.x=0
                    else if(taskDelegate.x>mainForm.width/ 3 && taskDelegate.x<2*mainForm.width/ 3 )
                         taskDelegate.x=200
                   else
                         taskDelegate.x=500

                }

            }

        }

        Page2Form {
        }
    }


}
