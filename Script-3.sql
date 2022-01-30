create table if not exists Artist (
	artist_id serial primary key,
	artist_name varchar(40) unique not null
	);

create table if not exists Genre (
	genre_id serial primary key,
	genre_name varchar(40) unique not null
	);
	
create table if not exists Genre_Artist (
	id serial primary key,
	art_id integer references Artist(artist_id),
	gen_id integer references Genre(genre_id)
	);
	
create table if not exists Albums (
	album_id serial primary key,
	album_name varchar(40) unique not null,
	releaseYear integer not null check (releaseYear>0)
	);
	
create table if not exists Albums_Artist (
	id serial primary key,
	art_id integer references Artist(artist_id),
	alb_id integer references Albums(album_id)
	);
	
create table if not exists Tracks (
	track_id serial primary key,
	title varchar(40) unique not null,
	duration integer not null check (duration>0),
	album_id integer references Albums(album_id)
	);
	
create table if not exists Collection (
	collection_id serial primary key,
	collection_name varchar(40) unique not null,
	releaseYear integer not null check (releaseYear>0)
	);
	
create table if not exists Albums_collection (
	id serial primary key,
	track_id integer references Tracks(track_id),
	collection_id integer references Collection(collection_id)
	);