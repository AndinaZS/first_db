create table if not exists Genres(
id serial primary key,
name text not null unique);

create table if not exists Musicians(
id serial primary key,
name text not null,
id_genre integer not null references Genres(id));

create table if not exists Albums(
id serial primary key,
name text not null,
pub_year integer not null, 
id_musician integer not null references Musicians(id),
constraint chk_pub_year check (1900 < pub_year));

create table if not exists Tracks(
id serial primary key,
duration integer not null,
name text not null,
id_album integer not null references Albums(id),
constraint chk_duration check (duration > 0));