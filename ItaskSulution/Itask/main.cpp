#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQuick/qquickview.h>
#include <QtQml/qqmlcontext.h>
#include "UI.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    UI ui;
    QQuickView view;
    view.engine()->rootContext()->setContextProperty("ui", &ui);
    view.setSource(QUrl(QLatin1String("qrc:/main.qml")));
    ui.RootObject=view.rootObject();
    ui.View=&view;
    ui.Init();
    return app.exec();
}
