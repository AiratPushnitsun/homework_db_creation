CREATE TABLE IF NOT EXISTS genre (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS singer (
	singer_id SERIAL PRIMARY KEY,
	singer_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre_singer (
	genre_id INT REFERENCES genre(genre_id),
	singer_id INT REFERENCES singer(singer_id),
	
	CONSTRAINT genre_singer_pk PRIMARY KEY (genre_id, singer_id)
);

CREATE TABLE IF NOT EXISTS album (
	album_id SERIAL PRIMARY KEY, 
	album_name VARCHAR(60) NOT NULL,
	production_year INT NOT NULL
);

CREATE TABLE IF NOT EXISTS singer_album (
	singer_id INT REFERENCES singer(singer_id),
	album_id INT REFERENCES album(album_id),
	
	CONSTRAINT singer_album_pk PRIMARY KEY (singer_id, album_id)
);

CREATE TABLE IF NOT EXISTS track (
	track_id SERIAL PRIMARY KEY,
	track_name VARCHAR(60),
	duration NUMERIC NOT NULL, 
	album_id INT REFERENCES album(album_id)
	 );


CREATE TABLE IF NOT EXISTS collection (
	collection_id SERIAL PRIMARY KEY,
	collection_name VARCHAR(60),
	production_year INT NOT NULL 
);

CREATE TABLE IF NOT EXISTS track_collection (
	track_id INT REFERENCES track(track_id),
	collection_id INT REFERENCES collection(collection_id),
	
	CONSTRAINT track_collection_pk PRIMARY KEY (track_id, collection_id)
);