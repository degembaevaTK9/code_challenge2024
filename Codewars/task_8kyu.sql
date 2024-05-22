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

SELECT SQRT(number1) as root, LOG10(2) as log FROM decimals;

