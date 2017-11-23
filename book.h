#ifndef BOOK_H
#define BOOK_H

#include <QObject>
#include "QImage"

class Book : public QObject
{
    Q_OBJECT

    int m_id;
    QString m_bookname;
    QString m_author;
    int m_rating;
   // QImage m_image;
    QString m_review;


    Q_PROPERTY(int id READ id WRITE setId NOTIFY idChanged)
    Q_PROPERTY(QString bookname READ bookname WRITE setBookname NOTIFY booknameChanged)
    Q_PROPERTY(QString author READ author WRITE setAuthor NOTIFY authorChanged)
    Q_PROPERTY(int rating READ rating WRITE setRating NOTIFY ratingChanged)
   // Q_PROPERTY(int image READ image WRITE setImage NOTIFY imageChanged)
    Q_PROPERTY(QString review READ review WRITE setReview NOTIFY reviewChanged)

public:
    Book();
    Book(const Book &book);
    Book operator=(Book v1);


    int id(){return m_id;}
    QString bookname(){return m_bookname;}
    QString author(){return m_author;}
    int rating(){return m_rating;}
  //  QImage image(){return m_image;}
    QString review(){return m_review;}


    void setId(int id){m_id = id;}
    void setBookname(QString bookname){m_bookname = bookname;}
    void setAuthor(QString author){m_author = author;}
    void setRating(int rating){m_rating = rating;}
    //void setImage(QImage image){m_image = image;}
    void setReview(QString review){m_review = review;}





signals:
        void idChanged();
        void booknameChanged();
        void authorChanged();
        void ratingChanged();
        void imageChanged();
        void reviewChanged();

public slots:
};

#endif // BOOK_H
