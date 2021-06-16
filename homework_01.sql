-- створюємо базу даних
create database library1;

-- робимо активною базу даних
use library1;

-- створюємо таблицю
create table books1
(
	id int(2) auto_increment primary key,
    name varchar(120) not null,
    description varchar(20) not null,
    date date not null,
    author varchar(60) not null,
    category varchar(30)
);

-- заповнюємо таблицю даними
insert into books1 (id, name, description, date, author, category) values
	(1, 'Mathemathics', 'Description missing', '2018-01-01', 'Burda K.I.', 'science'),
    (2, 'Chemistry', 'Description missing', '2018-01-01', 'Lomonosov L.D.', 'science'),
    (3, 'Foreign language', 'Description missing', '2018-01-01', 'Baranovskaya A.D.', 'humanities'),
    (4, 'Biology', 'Description missing', '2018-01-01', 'Otto S.V.', 'science'),
    (5, 'Ecology', 'Description missing', '2018-01-01', 'Rayder Q.R.', 'science'),
    (6, 'Ethics', 'Description missing', '2018-01-01', 'Pylypenko A.T.', 'humanities'),
    (7, 'Informathics', 'Description missing', '2018-01-01', 'Vernadskiy A.O.', 'science'),
    (8, 'Electricity', 'Description missing', '2018-01-01', 'Faradey M.D.', 'science'),
    (9, 'Literature', 'Description missing', '2018-01-01', 'Shevchenko T.G.', 'humanities'),
    (10, 'Geography', 'Description missing', '2018-01-01', 'Tretiak A.M.', 'humanities');
    
-- виводимо таблицю на екран
select * from books1;