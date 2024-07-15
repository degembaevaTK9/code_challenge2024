/* For this challenge you need to create a simple SELECT statement that will return all columns from the people table WHERE their age is over 50
You should return all people fields where their age is over 50 and order by the age descending*/

/*1-task*/
SELECT id, name, age FROM people
WHERE age > 50 ORDER BY age desc;


/* Given the following table 'decimals'.Return a table with one column (mod) which is the output of number1 modulus number2.*/

/*2-task*/

SELECT MOD(number1, number2) as mod from decimals;
 /*or*/
 SELECT (number1 % number2) as mod from decimals;

 
/* Given the following table 'decimals'. Return a table with two columns (root, log) where the values in root are the square root of those provided in number1 and the values in log are changed to a base 10 logarithm from those in number2.*/

/*3-task*/

SELECT SQRT(number1) as root, LOG10(number2) as log FROM decimals;

/* Return a table with two columns (number1, number2), the value in number1 should be rounded down and the value in number2 should be rounded up.*/

/*4-task*/

/*
Округление к ближайшему целому:
SELECT ROUND(число) FROM таблица;

Округление всегда в меньшую сторону (вниз):
SELECT FLOOR(число) FROM таблица;

Округление всегда в большую сторону (вверх):
SELECT CEIL(число) FROM таблица;

Усечение числа до указанного количества десятичных знаков (округление к ближайшему нулю):
SELECT TRUNC(число, количество_десятичных_знаков) FROM таблица;

Округление к указанному количеству десятичных знаков:
SELECT ROUND(число, количество_десятичных_знаков) FROM таблица;*/

SELECT FLOOR(number1) as number1, CEIL(number2) as number2 FROM decimals;

/* you need to return the same table where all letters are lowercase in the race column.*/

/*5-task*/

select id, name, birthday,lower(race) as race from demographics;

/*lower and upper*/

/* Your task is to sort the information in the provided table 'companies' by number of employees (high to low)*/

/*6-task*/

SELECT id, ceo, motto, employees FROM companies
order by employees desc;

/*You are working for a local school, and you are responsible for collecting tuition from students. You have a list of all students, some of them have already paid tution and some haven't. Write a select statement to get a list of all students who haven't paid their tuition yet. The list should include all the data available about these students.*/
/*7-task*/
SELECT name, age, semester, mentor, tuition_received FROM students
where tuition_received = false;


/*You are working for a local school, and you are responsible for collecting tuition from students. You have a list of all students, some of them have already paid tution and some haven't. Write a select statement to get a list of all students who haven't paid their tuition yet. The list should include all the data available about these students.*/
/*7-task*/
SELECT name, age, semester, mentor, tuition_received FROM students
where tuition_received = false;
