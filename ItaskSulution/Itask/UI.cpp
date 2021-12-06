#include "UI.h"

UI::UI(QObject *parent) : QObject(parent)
{

}
void UI::Init()
{
     View->showNormal();
}
//set object name objectName: "home_page"
//QObject* temp=(QObject*)RootObject;
//    QMetaObject::invokeMethod(temp->findChild<QObject *>("redTrim"), "test",
//                                Q_ARG(QVariant,QVariant::fromValue(1))

//                              );
