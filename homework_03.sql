-- створюємо базу даних
create database library3;

-- робимо активною базу даних
use library3;

-- створюємо таблицю
create table books3
(
	id int not null auto_increment primary key,
    title varchar(120) not null,
    description varchar(50) not null,
    date date not null,
    category varchar(30),
    isbn varchar(20) not null unique,
    pages int(4) not null,
    name varchar(45) not null,
    surname varchar(45) not null,
    email varchar(50) not null,
    age int(3) not null,
    birth date not null,
    awards varchar(120)
);

-- заповнюємо таблицю даними
insert into books3 (id, title, description, date, category, isbn, pages, name, surname, email, age, birth, awards) values
	(1, 'Математика', 'Вивчає обчислення.', '2010-01-21', 'наука', '6-10-123456-8', 345, 'Максим', 'Бурда', 'burda@gmail.com', 47, '1974-06-16', 'Золота думка'),
    (2, 'Хімія', 'Вивчає взаємодію речовин.', '2009-02-11', 'наука','5-11-345672-7', 367, 'Марина', 'Величко', 'velichko@ukr.net', 65, '1956-07-15', 'Науковець року'),
    (3, 'Іноземна мова', 'Тренуй пам’ять.', '2000-09-11','гуманітарія', '4-21-968432-0', 123, 'Тетяна', 'Барановська', 'baranovskaya@gmail.com', 60, '1960-12-14', 'Золота думка'),
    (4, 'Біологія', 'Про все живе.', '1995-04-25', 'наука', '1-34-098754-5', 569, 'Марія', 'Котельникова', 'kotelnik@ukr.net', 50, '1970-10-14', null),
    (5, 'Екологія', 'Бережімо природу!', '1990-11-04', 'наука','3-90-567436-2', 443,'Алла','Звягінцева', 'zvyaginceva@gmail.com', 81, '1940-05-13', null),
    (6, 'Етика', 'Будьте ввічливі!', '2021-01-16', 'гуманітарія','2-34-657483-1', 223, 'Олександр','Маяков','mayakov@gmail.com', 46, '1975-05-13', 'Науковець року'),
    (7, 'Інформатика', 'Знай ІТ технології.', '2020-08-14', 'наука','9-23-856473-2', 98, 'Іван','Карачун', 'karachyn@ukr.net', 48, '1973-05-13', 'Золота думка'),
    (8, 'Електрика', 'Умій створювати прилади.', '2018-03-22', 'побут','0-546372-89', 65, 'Петро','Уфімцев','ufimcev@ukr.net', 31, '1990-04-18', 'Науковець року'),
    (9, 'Література', 'Читання розвиває.', '2014-05-31', 'побут','7-34-456372-1', 367, 'Петро','Кайдаш','kaydash@ukr.net', 41, '1980-05-16', 'Золота думка'),
    (10, 'Географія', 'Про різні країни.', '1994-10-12', 'гуманітарія','8-34-234756-32', 124, 'Марія','Довжанська','dovganskaya@gmail.com', 39, '1982-05-13', null);
    
-- виводимо таблицю на екран
select * from books3;

-- витягнути всі книжки
select * from books3;

-- змінити прізвище автора в 2х книжках
update books3 set surname = 'Burda' where id = 1;
update books3 set surname = 'Mayakov' where id = 6;
select * from books3;

-- підрахувати кількість книжок, в яких автори мають нагороди
select count(*) from books3 where awards is not null;

-- вивести інформацію про книжку з найменшою кількістю сторінок
select * from books3 where pages = (select min(pages) from books3);

-- вивести максимальну кількість сторінок
select max(pages) from books3;

-- вивести середню ціну книжки
-- для цього добавимо стовпець із цінами на книги
alter table books3 add price decimal(6,2);
select * from books3;
update books3 set price = 24.55 where id = 1;
update books3 set price = 124.32 where id = 2;
update books3 set price = 1035.50 where id = 3;
update books3 set price = 935.40 where id = 4;
update books3 set price = 15.50 where id = 5;
update books3 set price = 120.00 where id = 6;
update books3 set price = 35.40 where id = 7;
update books3 set price = 890.50 where id = 8;
update books3 set price = 600.00 where id = 9;
update books3 set price = 135.90 where id = 10;
select * from books3;
-- ось тепер виводимо середню ціну книги
select avg(price) from books3;
-- оглуглимо ціну до двох знаків після коми
select round(avg(price), 2) from books3;

-- порахувати суму книжок за категорією
-- порахуємо кількість книг з категорією "побут"
select count(*) from books3 where category = 'побут';

-- вивести мінімальну ціну книжки
select min(price) from books3;

-- вивести інформацію про книжку з найменшою ціною
select * from books3 where price = (select min(price) from books3);

-- написати 3 запити, використавши різні види пошуку за співпадіннями(like)
select * from books3 where email like '%gmail%';
select * from books3 where email like 'k%net';
select * from books3 where title like '_н%';

-- вивести книжки де ціна на проміжку: 1. 50-120, 
select * from books3 where price between 50 and 120;
-- вивести книжки де ціна на проміжку: 2. не включаючи проміжок 200-600.
select * from books3 where price > 200 and price < 600;

-- написати 3 запити на видалення книжки(за id, name, isbn)
delete from books3 where id = 1;
select * from books3;
-- на цьому етапі виникала помилка 1175
delete from books3 where title = 'Електрика';
select * from books3;
delete from books3 where isbn = '7-34-456372-1';
select * from books3;

-- Cпробувати змінити назву колонок, деякі записи з бази даних
alter table books3 rename column title to book_name;
select * from books3;
-- нехай всі книги подорожчають на 3.50 грн
update books3 set price = price + 3.50;
select * from books3;

-- Спробувати видалити деякі записи з БД.
-- видалимо наявність премії 'Науковець року'
update books3 set awards = null where awards = 'Науковець року';
select * from books3;