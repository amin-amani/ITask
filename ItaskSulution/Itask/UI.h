#ifndef UI_H
#define UI_H

#include <QObject>
#include <QDebug>
#include <QMetaObject>
#include <QtQuick/QQuickView>

class UI : public QObject
{
    Q_OBJECT
public:
    QQuickItem *RootObject=nullptr;
    QQuickView  *View=nullptr;
    explicit UI(QObject *parent = nullptr);

    void Init();
signals:

};

#endif // UI_H
