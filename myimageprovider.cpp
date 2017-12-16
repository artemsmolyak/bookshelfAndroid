#include "myimageprovider.h"


MyImageProvider::MyImageProvider(Client *client): QQuickImageProvider(QQuickImageProvider::Pixmap)
{
    this->client = client;
}

MyImageProvider::~MyImageProvider()
{

}


QPixmap MyImageProvider::requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
{
    Database * database =  client->getDatabase();

    QImage image = database->getImage(id.toInt());

    QPixmap pixmap = QPixmap::fromImage(image);

    return pixmap;
}
