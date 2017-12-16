#include "book.h"

Book::Book()
{

}


Book::Book(const Book &book)
{
     m_id = book.m_id;
     m_bookname = book.m_bookname;
    m_author = book.m_author;
    m_rating = book.m_rating;
    m_review = book.m_review;
}

Book Book::operator=(Book book)
{
    this->m_id = book.m_id;
    this->m_author = book.m_author;
    this->m_bookname = book.m_bookname;
    this->m_rating = book.m_rating;
    this->m_review = book.m_review;

    return *this;
}
