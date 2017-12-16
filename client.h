#ifndef CLIENT_H
#define CLIENT_H

#include <QObject>
#include "QQmlContext"
#include <database.h>

class Client : public QObject
{
    Q_OBJECT

     Database *database;
     QQmlContext *qml_root_context;


public:
    explicit Client(QObject *parent = nullptr);

    void setQmlRootContext(QQmlContext *root);


    Database *getDatabase() const;
    void setDatabase(Database *value);

    void setPicture(QVariant path);

    Q_INVOKABLE void save(QString bookname, QString author, QString img);
    Q_INVOKABLE void update();




    Q_INVOKABLE QVariant getBookname(QVariant id);
    Q_INVOKABLE QVariant getAuthor(QVariant id);
    Q_INVOKABLE QVariant getReview(QVariant id);


    Q_INVOKABLE void search();

signals:

public slots:
};

#endif // CLIENT_H
