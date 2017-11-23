#ifndef MYIMAGEPROVIDER_H
#define MYIMAGEPROVIDER_H


//#include <qqmlextensionplugin.h>
//#include <qqmlengine.h>



#include <qquickimageprovider.h>
#include <client.h>
#include <QPixmap>

class MyImageProvider : public QQuickImageProvider
{
    Client * client;

public:

    MyImageProvider(Client * client);

   // MyImageProvider(ImageType type, Flags flags = 0);
       ~MyImageProvider();
      QPixmap  requestPixmap(const QString & id, QSize * size, const QSize & requestedSize);



};

#endif // MYIMAGEPROVIDER_H
