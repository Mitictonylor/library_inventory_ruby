-- drop the table with the foreign key first
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS publishers;

-- create the table with no secondary key first.
CREATE TABLE publishers(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  active BOOLEAN
);

CREATE TABLE genres(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE authors(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE books(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  description TEXT,
  stock INT,
  buying_cost DECIMAL,
  selling_cost DECIMAL,
  author_id INT REFERENCES authors(id),
  genre_id INT REFERENCES genres(id),
  publisher_id INT REFERENCES publishers(id)
);
