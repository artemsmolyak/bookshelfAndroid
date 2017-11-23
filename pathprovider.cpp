#include "pathprovider.h"
#include "QDebug"
#include <QUrl>


PathProvider::PathProvider(): QQuickImageProvider(QQuickImageProvider::Pixmap)
{

}

PathProvider::~PathProvider()
{

}

QPixmap PathProvider::requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
{
    QString path = id;
    path = path.replace("file://", "");
    QPixmap pixmap(path);


    return pixmap;

   // return QPixmap(200, 200);
}
