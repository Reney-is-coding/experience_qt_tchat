#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "include/Connector.h"

int main ( int argc, char** argv )
{
    QGuiApplication app ( argc, argv );

    QQmlApplicationEngine engine;
    Connector *connector = new Connector(1200, "127.0.0.1");

    engine.rootContext()->setContextProperty("connector", connector);
    engine.load ( QUrl ( QStringLiteral ( "qrc:/qml/main.qml" ) ) );
    return app.exec();
}
