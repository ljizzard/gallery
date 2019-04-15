DROP TABLE artex;
DROP TABLE artists;
DROP TABLE exhibits;


CREATE TABLE artists(
id SERIAL PRIMARY KEY,
name VARCHAR,
biography TEXT
);

CREATE TABLE exhibits(
  id SERIAL PRIMARY KEY,
  title VARCHAR,
  image TEXT, -- url
  category VARCHAR
);

CREATE TABLE artex(
  id SERIAL PRIMARY KEY,
  artist_id INT REFERENCES artists(id) ON DELETE CASCADE,
  exhibit_id INT REFERENCES exhibits(id) ON DELETE CASCADE
);
