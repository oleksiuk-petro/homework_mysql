-- створюємо базу даних
create database library2;

-- робимо активною базу даних
use library2;

-- створюємо таблицю
create table books2
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
insert into books2 (id, title, description, date, category, isbn, pages, name, surname, email, age, birth, awards) values
	(1, 'Математика', 'Вивчає обчислення.', '2010-01-21', 'наука', '6-10-123456-8', 345, 'Максим', 'Бурда', 'burda@gmail.com', 47, '1974-06-16', 'Золота думка'),
    (2, 'Хімія', 'Вивчає взаємодію речовин.', '2009-02-11', 'наука','5-11-345672-7', 367, 'Марина', 'Величко', 'velichko@ukr.net', 65, '1956-07-15', 'Науковець року'),
    (3, 'Іноземна мова', 'Тренуй пам’ять.', '2000-09-11','гуманітарія', '4-21-968432-0', 123, 'Тетяна', 'Барановська', 'baranovskaya@gmail.com', 60, '1960-12-14', 'Золота думка'),
    (4, 'Біологія', 'Про все живе.', '1995-04-25', 'наука', '1-34-098754-5', 569, 'Марія', 'Котельникова', 'kotelnik@ukr.net', 50, '1970-10-14', null),
    (5, 'Екологія', 'Бережімо природу!', '1990-11-04', 'наука','3-90-567436-2', 443,'Алла','Звягінцева', 'zvyaginceva@gmail.com', 81, '1940-05-13', null),
    (6, 'Етика', 'Будьте ввічливі!', '2021-01-16', 'гуманітарія','2-34-657483-1', 223, 'Олександр','Маяков','mayakov@gmail.com', 46, '1975-05-13', 'Науковець року'),
    (7, 'Інформатика', 'Знай ІТ технології.', '2020-08-14', 'наука','9-23-856473-2', 98, 'Іван','Карачун', 'karachyn@ukr.net', 48, '1973-05-13', 'Золота думка'),
    (8, 'Електрика', 'Умій створювати прилади.', '2018-03-22', 'наука','0-546372-89', 65, 'Петро','Уфімцев','ufimcev@ukr.net', 31, '1990-04-18', 'Науковець року'),
    (9, 'Література', 'Читання розвиває.', '2014-05-31', 'гуманітарія','7-34-456372-1', 367, 'Петро','Кайдаш','kaydash@ukr.net', 41, '1980-05-16', 'Золота думка'),
    (10, 'Географія', 'Про різні країни.', '1994-10-12', 'гуманітарія','8-34-234756-32', 124, 'Марія','Довжанська','dovganskaya@gmail.com', 39, '1982-05-13', null);
    
-- виводимо таблицю на екран
select * from books2;

-- витягнути всі книги
select * from books2;

-- витягнути книги з id 5, 10, 13
select * from books2 where id in (5, 10, 13);

-- витягнути всі книги де кількість сторінок більше 150
select * from books2 where pages > 150;

-- витягнути книги, де автори старше 30 років
select * from books2 where age > 30;

-- витягнути книги, в яких автори не мають нагород
select * from books2 where awards is null;

-- витягнути книгу по email автора
select * from books2 where email = 'kotelnik@ukr.net';

-- витягнути книгу по isbn
select * from books2 where isbn = '2-34-657483-1';

-- витягнути всіх книги які належать до певної категорії
select * from books2 where category = 'наука';
select * from books2 where category = 'гуманітарія';

-- витягнути книги в яких кількість сторінок більше 200 та вік автора більше 25
select * from books2 where pages > 200 and age > 25;

-- витягнути книги, в яких категорія "комедія" або "драма"(назви категорії можете змінити)
select * from books2 where category = 'наука';
select * from books2 where category = 'гуманітарія';

-- витягнути книги та посортувати за назвою
select * from books2 order by title;

-- витягнути книги та посортувати за email автора
select * from books2 order by email;

-- витягнути книги та посортувати за кількістю сторінок(проти алфавіту)
select * from books2 order by pages desc;

-- витягнути унікальні значення категорій
select distinct category from books2;

-- витягнути унікальні імена авторів
select distinct name from books2;

-- витягнути книги які було написано після '2000-01-01'
select * from books2 where date > '2000-01-01';

-- витягнути книги які було написано до '2010-01-01'
select * from books2 where date < '2000-01-01';