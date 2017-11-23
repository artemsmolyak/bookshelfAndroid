#ifndef PATHPROVIDER_H
#define PATHPROVIDER_H

#include "QPixmap"
#include <qquickimageprovider.h>


class PathProvider : public QQuickImageProvider
{
public:
    PathProvider();
    ~PathProvider();

    QPixmap  requestPixmap(const QString & id, QSize * size, const QSize & requestedSize);

};

#endif // PATHPROVIDER_H
