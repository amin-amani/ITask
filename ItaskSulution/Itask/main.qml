import QtQuick 2.12
import QtQuick.Controls 2.5

Rectangle {
    visible: true
    width: 640
    height: 480


    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 0

        Page1Form {
        }

        Page2Form {
        }
    }


}
