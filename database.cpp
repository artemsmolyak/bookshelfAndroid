#include "database.h"
#include "QBuffer"


Database::Database()
{
    connect();
    createMainTable();
}


QSqlError Database::connect()
{


        if (!QSqlDatabase::drivers().contains("QSQLITE"))
        {
           // QMessageBox::critical(0, "Unable to load database", "needs the SQLITE driver");
        }
        else
        {
            db = QSqlDatabase::addDatabase("QSQLITE");
            qDebug() << "connect!";
        }

         db.setDatabaseName(QDir::homePath()+"/bookshelfA.sqlite");



        if (!db.open())
           {
              qDebug() << "Error: connection with database fail" << db.lastError();
           }
           else
           {
              qDebug() << "Database: connection ok";
           }


        return QSqlError();
}

QSqlError Database::createMainTable()
{
        qDebug() << "check tables";

        QSqlQuery q(db);

        if (!q.exec(QLatin1String("create table IF not EXISTS bookshelfA"
                                  "(id integer primary key,  "
                                   "bookname TEXT, "
                                   "author TEXT,  "
                                    "rating INTEGER, "
                                     "image BLOB, "
                                     "thoughts TEXT, "
                                      "review TEXT"
                                    ")")))
            return q.lastError();

           qDebug() <<" create  Table is ok";



           //
//           q.prepare("INSERT INTO bookshelfA (bookname, author, rating, image, review) VALUES (?, ?, ?, ?, ?)");
//           q.addBindValue("История России в XIX веке");
//           q.addBindValue("История России в XIX веке");
//           q.addBindValue("4");

//           QImage image("/home/artem/Pictures/forBooks/235.jpg");
//           QByteArray ba1;
//           QBuffer buffer1(&ba1);
//           buffer1.open(QIODevice::WriteOnly);
//           image.save(&buffer1, "jpg");
//           q.addBindValue(ba1);
//           q.addBindValue("review");
//           q.exec();


//           q.prepare("INSERT INTO bookshelfA (bookname, author, rating, image, review) VALUES (?, ?, ?, ?, ?)");
//           q.addBindValue("Думай как математик");
//           q.addBindValue("Барбара Оакли");
//           q.addBindValue("4");

//           QImage image2("/home/artem/Pictures/forBooks/701.jpg");
//           QByteArray ba2;
//           QBuffer buffer2(&ba2);
//           buffer2.open(QIODevice::WriteOnly);
//           image2.save(&buffer2, "jpg");
//           q.addBindValue(ba2);
//           q.addBindValue("review");
//           q.exec();


           //


           return q.lastError();
}

QList<Book*> Database::getAll()
{
    QSqlQuery q;
    q.prepare("select * from bookshelfA");
    q.exec();

    QList <Book*> booklist;

    while (q.next()) {
          Book * book = new Book;
          int id =  q.value(0).toInt();
          book->setId(id);

          QString bookname = q.value(1).toString();
          book->setBookname(bookname);

          QString author = q.value(2).toString();
          book->setAuthor(author);

          int rating =  q.value(3).toInt();
          book->setRating(rating);

          QString review = q.value(6).toString();
          book->setReview(review);

          booklist.append(book);
        }

    return booklist;
}

QImage Database::getImage(int id)
{
    QSqlQuery q;
    q.prepare("SELECT image FROM bookshelfA WHERE id = ?");
    q.addBindValue(id);
    q.exec();

    QByteArray imageByteArray;

     while (q.next()) {
          imageByteArray =  q.value(0).toByteArray();
     }

     QImage  image = QImage::fromData(imageByteArray, "jpg");
     return image;
}

void Database::save(QString bookname, QString author, QString imgpath)
{
    QSqlQuery q;
    q.prepare("INSERT INTO bookshelfA (bookname, author, rating, image, review) VALUES (?, ?, ?, ?, ?)");
    q.addBindValue(bookname);
    q.addBindValue(author);
    q.addBindValue("");

    qDebug() << "imgpath " << imgpath;

    QImage image(imgpath.replace("file://", ""));
    QByteArray ba;
    QBuffer buffer(&ba);
    buffer.open(QIODevice::WriteOnly);
    image.save(&buffer, "jpg");
    q.addBindValue(ba);

    q.addBindValue("review");

    q.exec();

}

QString Database::getBookname(int id)
{
    QSqlQuery q;
    q.prepare("SELECT bookname FROM bookshelfA WHERE id = ?");
    q.addBindValue(id);
    q.exec();


    QString bookname;

     while (q.next()) {
          bookname =  q.value(0).toString();
     }


    return bookname;
}

QString Database::getAuthor(int id)
{
    QSqlQuery q;
    q.prepare("SELECT author FROM bookshelfA WHERE id = ?");
    q.addBindValue(id);
    q.exec();


    QString author;

     while (q.next()) {
          author =  q.value(0).toString();
     }


    return author;
}

QString Database::getReview(int id)
{
    QSqlQuery q;
    q.prepare("SELECT review FROM bookshelfA WHERE id = ?");
    q.addBindValue(id);
    q.exec();


    QString review;

     while (q.next()) {
          review =  q.value(0).toString();
     }

    return review;
}
