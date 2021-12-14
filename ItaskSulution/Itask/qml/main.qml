import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
Rectangle {
    visible: true
    id:mainForm
    width: 640
    height: 480
   // anchors.fill: parent
     //========================================================================================
    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 0
        Page1Form {
            id:mainPage

            TaskBox
            {

            }
        }
        Page2Form {
        }
    }
}
