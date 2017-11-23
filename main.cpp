#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "client.h"
#include "myimageprovider.h"
#include "pathprovider.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);



    QQmlApplicationEngine engine;

    Client client;

    QQmlContext *context =engine.rootContext();
    context->setContextProperty("client", &client);
    client.setQmlRootContext(context);

    MyImageProvider *imageProvider = new MyImageProvider(&client);
    engine.addImageProvider("myprovider",imageProvider);

    PathProvider * pathprivider = new PathProvider;
    engine.addImageProvider("pathProvider", pathprivider);


    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
