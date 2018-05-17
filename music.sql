CREATE TABLE song (
id SERIAL PRIMARY KEY,
name VARCHAR,
writer_id VARCHAR,
artist_id VARCHAR
);

CREATE TABLE artist (
id SERIAL PRIMARY KEY,
name VARCHAR
);

CREATE TABLE writer (
id SERIAL PRIMARY KEY,
name VARCHAR
);

CREATE TABLE album (
id SERIAL PRIMARY KEY,
name VARCHAR
);

CREATE TABLE track (
id SERIAL PRIMARY KEY,
track_number INTEGER CHECK (track_number >0),
album_id INTEGER,
song_id INTEGER
);