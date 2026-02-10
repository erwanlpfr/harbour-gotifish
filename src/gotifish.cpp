#include <QQmlContext>
#include <QQmlEngine>
#include <QQuickView>
#include <QScopedPointer>
#include <QtQuick>
#include <sailfishapp.h>

#include "gotifyclient.h"
#include "healthmodel.h"
#include "healthservice.h"

int main(int argc, char* argv[])
{
    QScopedPointer<QGuiApplication> app(SailfishApp::application(argc, argv));
    QScopedPointer<QQuickView> v(SailfishApp::createView());

    qmlRegisterType<GotifyClient>("harbour.org.gotifish", 1, 0, "GotifyClient");
    qmlRegisterType<HealthService>("harbour.org.gotifish", 1, 0, "HealthService");
    qmlRegisterUncreatableType<HealthModel>("harbour.org.gotifish", 1, 0, "HealthModel", "Used in HealthService");

    v->setSource(SailfishApp::pathTo("qml/harbour-gotifish.qml"));
    v->show();

    return app->exec();
}
