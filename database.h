#ifndef DATABASE_H
#define DATABASE_H

#include <QtSql/QSqlDatabase>
#include <QtSql/qsqlerror.h>
#include <QSqlQuery>
#include <QSqlDatabase>
#include <QDebug>
#include  <QDir>
#include <book.h>

class Database
{

    QSqlDatabase db;

public:
    Database();

    QSqlError connect();
    QSqlError createMainTable();

    QList <Book*> getAll();
    QImage getImage(int id);

    void save(QString bookname, QString author, QString imgpath);
    QString getBookname(int id);
    QString getAuthor(int id);
    QString getReview(int id);

};

#endif // DATABASE_H
