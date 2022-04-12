-- Generated by xo for the booktest schema.

-- table authors
CREATE TABLE authors (
  author_id INT(11) AUTO_INCREMENT,
  name VARCHAR(255) DEFAULT '' NOT NULL,
  PRIMARY KEY (author_id)
) ENGINE=InnoDB;

-- index authors_name_idx
CREATE INDEX authors_name_idx ON authors (name);

-- table books
CREATE TABLE books (
  book_id INT(11) AUTO_INCREMENT,
  author_id INT(11) NOT NULL REFERENCES authors (author_id),
  isbn VARCHAR(255) DEFAULT '' NOT NULL,
  book_type ENUM('FICTION', 'NONFICTION') DEFAULT 'FICTION' NOT NULL,
  title VARCHAR(255) DEFAULT '' NOT NULL,
  year INT(11) DEFAULT 2000 NOT NULL,
  available DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  description TEXT DEFAULT '' NOT NULL,
  tags TEXT DEFAULT '' NOT NULL,
  UNIQUE (isbn),
  PRIMARY KEY (book_id)
) ENGINE=InnoDB;

-- index author_id
CREATE INDEX author_id ON books (author_id);

-- index books_title_idx
CREATE INDEX books_title_idx ON books (title, year);

-- function say_hello
CREATE FUNCTION say_hello(name VARCHAR(255)) RETURNS VARCHAR(255)
BEGIN
  RETURN CONCAT('hello ', name)\;
END;
