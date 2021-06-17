-- створюємо базу даних
create database library4;

-- робимо активною базу даних
use library4;

-- додаємо першу таблицю
create table books(
	id int not null auto_increment primary key,
    name_book varchar(20) not null unique,
    description varchar(50) not null,
    price int not null,
    isbn varchar(20) not null unique,
    -- один жанр може стосуватися багатьох книг
    genres_id int not null,
    -- поле таблиці "книги" посилається на поле таблиці "жанри"
    foreign key (genres_id) references genres(id)
);

-- додаємо другу таблицю
create table genres(
	id int not null auto_increment primary key,
    name_genre varchar(20) not null unique
);

-- створюємо третю таблицю
create table authors(
	id int not null auto_increment primary key,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    email varchar(50) unique,
    address varchar(150) not null,
    birth date not null,
    -- одну книгу може писати багато авторів
    books_id int not null,
    -- поле таблиці "автори" посилається на поле таблиці "книги"
    foreign key (books_id) references books(id)
);