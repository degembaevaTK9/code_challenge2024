/*1.4 Вложенные запросы*/

/*Вывести информацию о самых дешевых книгах, хранящихся на складе.*/

SELECT title, author, price, amount
FROM book
WHERE price = (
         SELECT MIN(price) 
         FROM book
      );

/*Вывести информацию (автора, название и цену) о  книгах, цены которых меньше или равны средней цене книг на складе. 
Информацию вывести в отсортированном по убыванию цены виде. Среднее вычислить как среднее по цене книги.*/
SELECT author, title, price 
FROM book
WHERE price <= (
         SELECT AVG(price) 
         FROM book
      )
ORDER BY price DESC;

/*Вывести информацию о книгах, количество экземпляров которых отличается от среднего количества экземпляров книг на складе более чем на 3. 
То есть нужно вывести и те книги, количество экземпляров которых меньше среднего на 3, или больше среднего на 3.*/

SELECT title, author, amount 
FROM book
WHERE ABS(amount - (SELECT AVG(amount) FROM book)) >3;

/*Вывести информацию (автора, название и цену) о тех книгах, 
цены которых превышают минимальную цену книги на складе не более чем на 150 рублей в отсортированном по возрастанию цены виде.*/
SELECT author, title, price 
FROM book
WHERE price - (SELECT MIN(price) from book)<=150 
ORDER BY price asc

/*Вывести информацию о книгах тех авторов, общее количество экземпляров книг которых не менее 12.*/
SELECT title, author, amount, price
FROM book
WHERE author IN (
        SELECT author 
        FROM book 
        GROUP BY author 
        HAVING SUM(amount) >= 12
      );

/*Вывести информацию (автора, книгу и количество) о тех книгах, количество экземпляров которых в таблице book не дублируется.*/
SELECT author, title, amount 
FROM book
WHERE amount IN(SELECT amount
              FROM book
              group by amount
              having COUNT(amount)=1
            )

/*Вывести информацию о тех книгах, количество которых меньше самого маленького среднего количества книг каждого автора.*/
SELECT title, author, amount, price
FROM book
WHERE amount < ALL (
        SELECT AVG(amount) 
        FROM book 
        GROUP BY author 
      );

/*Вывести информацию о тех книгах, количество которых меньше самого большого среднего количества книг каждого автора.*/

SELECT title, author, amount, price
FROM book
WHERE amount < ANY (
        SELECT AVG(amount) 
        FROM book 
        GROUP BY author 
      );

/*Вывести информацию о книгах(автор, название, цена), цена которых меньше самой большой из минимальных цен, вычисленных для каждого автора.*/
SELECT author, title, price 
FROM book
WHERE price < ANY(
               SELECT MIN(price)
                FROM book 
                group by author)

/*Вывести информацию о книгах, количество экземпляров которых отличается от среднего количества экземпляров книг на складе более чем на 3,  а также указать среднее значение количества экземпляров книг.*/
SELECT title, author, amount, 
      FLOOR((SELECT AVG(amount) FROM book)) AS Среднее_количество 
FROM book
WHERE ABS(amount - (SELECT AVG(amount) FROM book)) >3;


/*Посчитать сколько и каких экземпляров книг нужно заказать поставщикам, чтобы на складе стало одинаковое количество экземпляров 
каждой книги, равное значению самого большего количества экземпляров одной книги на складе. Вывести название книги, ее автора, 
текущее количество экземпляров на складе и количество заказываемых экземпляров книг. Последнему столбцу присвоить имя Заказ. 
В результат не включать книги, которые заказывать не нужно.*/

SELECT title, author, amount, 
        (select max(amount) from book) - amount as Заказ from book
where amount != (select max(amount) from book)