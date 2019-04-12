DROP TABLE category;
DROP TABLE artists;
DROP TABLE exhibits;


CREATE TABLE artists(
id SERIAL PRIMARY KEY,
name VARCHAR,
bio TEXT
);


CREATE TABLE exhibits(
  id SERIAL PRIMARY KEY,
  title VARCHAR,
  photo TEXT, -- url
  category VARCHAR
);



CREATE TABLE category(
  id SERIAL PRIMARY KEY,
  artists_id INT REFERENCES artists(id),
  exhibits_id INT REFERENCES exhibits(id)
);
