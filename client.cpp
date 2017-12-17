#include "client.h"
#include <book.h>

Database *Client::getDatabase() const
{
    return database;
}

void Client::setDatabase(Database *value)
{
    database = value;
}


void Client::save(QString bookname, QString author, QString imgPath)
{
    qDebug() << bookname;
    qDebug() << author;
    database->save(bookname, author, imgPath);

}

void Client::update()
{
    QList<Book*> bookList =  database->getAll();

    QList<QObject*> list;

    for(int i = 0; i < bookList.size(); i++){
            Book * b = bookList.at(i);

    QObject * obj = dynamic_cast<QObject*>(b);

    list.append(obj);
    }

    qml_root_context->setContextProperty("myModel", QVariant::fromValue(list));
}

QVariant Client::getBookname(QVariant id)
{
    return database->getBookname(id.toInt());

}

QVariant Client::getAuthor(QVariant id)
{
    return database->getAuthor(id.toInt());
}

QVariant Client::getReview(QVariant id)
{
    return database->getReview(id.toInt());
}

void Client::search()
{
    QString path = "/home/artem/Pictures/forBooks";

    QDir * dir = new QDir(path);

    QList<QFileInfo> list = dir->entryInfoList();


        QStringList modelList;

    for (QFileInfo fileInfo : list) {
            qDebug() <<   fileInfo.filePath()  ;
            modelList<< fileInfo.filePath();
        }



//    for(QList<QFileInfo>::const_iterator p = list.constBegin(); p != list.end();  ++p){
//        qDebug() << p->fileName();
//        modelList<< p->fileName();
//    }


     qml_root_context->setContextProperty("modelPhoto", QVariant::fromValue(modelList));


}

void Client::setPicPath(QVariant path)
{
    QObject * obj = qml_root->findChild<QObject*>("addnew");

    if (obj)
    {
         QMetaObject::invokeMethod(obj, "setPicPath", Q_ARG(QVariant, path));
    }
    else
    {
        qDebug() << "there is no object " << qml_root->children();
    }
}

Client::Client(QObject *parent) : QObject(parent)
{
    database = new Database;
    qml_root = NULL;
    qml_root_context = NULL;
}


void Client::setQmlRootContext(QQmlContext *root)
{
    if (qml_root_context == root)
        return;
    qml_root_context = root;


     update();

}


void Client::setQmlRoot(QObject *root)
{
    if (qml_root == root)
        return;

    qml_root = root;
}
