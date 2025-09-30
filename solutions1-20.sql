/*
1. Revising the Select Query I
Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
*/

SELECT * FROM CITY WHERE CountryCode = 'USA' AND Population > 100000;

/*
2. Revising the Select Query II
Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
*/

SELECT NAME FROM CITY WHERE CountryCode = 'USA' AND Population > 120000;

/*
3. Select All
Query all columns (attributes) for every row in the CITY table.
*/

SELECT * FROM CITY;

/*
4. Select By ID
Query all columns for a city in CITY with the ID 1661.
*/

SELECT * FROM CITY WHERE ID = 1661;

/*
5. Japanese Cities' Attributes
Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
*/

SELECT * FROM CITY WHERE CountryCode = 'JPN';

/*
6. Japanese Cities' Names
Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
*/  

SELECT NAME FROM CITY WHERE CountryCode = 'JPN';

/*
7. Weather Observation Station 1
Query a list of CITY and STATE from the STATION table.
where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

SELECT CITY, STATE FROM STATION;

/*
8. Weather Observation Station 3
Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

SELECT DISTINCT CITY FROM STATION WHERE MOD(ID, 2) = 0;

/*
9. Weather Observation Station 4
Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION;

/*
10. Weather Observation Station 5
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
where LAT_N is the northern latitude and LONG_W is the western longitude.
Sample Input
For example, CITY has four entries: DEF, ABC, PQRS and WXY.
Sample Output
ABC 3
PQRS 4
Explanation
When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with lengths  and . The longest name is PQRS, but there are  options for shortest named city. Choose ABC, because it comes first alphabetically.
Note
You can write two separate queries to get the desired output. It need not be a single query.
*/

SELECT CITY, LENGTH(CITY) AS LEN
FROM STATION
ORDER BY LEN ASC, CITY ASC
LIMIT 1;

SELECT CITY, LENGTH(CITY) AS LEN
FROM STATION
ORDER BY LEN DESC, CITY ASC
LIMIT 1;

/*
11. Weather Observation Station 6
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

#Oracle
SELECT DISTINCT CITY
FROM STATION
WHERE REGEXP_LIKE(CITY, '^[AEIOU]', 'i')
ORDER BY CITY;

#MySQL
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[AEIOUaeiou]'
ORDER BY CITY;

/*
12. Weather Observation Station 7
Query the list of CITY names ending in vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

#MySQL
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '[AEIOUaeiou]$'
ORDER BY CITY; 

#Oracle
SELECT DISTINCT CITY
FROM STATION
WHERE REGEXP_LIKE(CITY, '[AEIOU]$', 'i')
ORDER BY CITY;

/*
13. Weather Observation Station 8
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

#MySQL
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[AEIOUaeiou].*[AEIOUaeiou]$'
ORDER BY CITY;

#Oracle
SELECT DISTINCT CITY
FROM STATION
WHERE REGEXP_LIKE(CITY, '^[AEIOU].*[AEIOU]$', 'i')
ORDER BY CITY;

/*
14. Weather Observation Station 9
Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

#MySQL
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[^AEIOUaeiou]'
ORDER BY CITY;

#Oracle
SELECT DISTINCT CITY
FROM STATION
WHERE REGEXP_LIKE(CITY, '^[^AEIOU]', 'i')
ORDER BY CITY;  

/*
15. Weather Observation Station 10
Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
where LAT_N is the northern latitude and LONG_W is the western longitude.
*/      

#MySQL
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '[^AEIOUaeiou]$'  
ORDER BY CITY;

#Oracle
SELECT DISTINCT CITY
FROM STATION        
WHERE REGEXP_LIKE(CITY, '[^AEIOU]$', 'i')
ORDER BY CITY;

/*
16. Weather Observation Station 11
Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

#MySQL
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[^AEIOUaeiou]|[^AEIOUaeiou]$'
ORDER BY CITY;

#Oracle
SELECT DISTINCT CITY
FROM STATION
WHERE REGEXP_LIKE(CITY, '^[^AEIOU]|[^AEIOU]$', 'i')
ORDER BY CITY; 

/* 
17. Weather Observation Station 12
Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

#MySQL
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[^AEIOUaeiou].*[^AEIOUaeiou]$'
ORDER BY CITY;  

#Oracle
SELECT DISTINCT CITY
FROM STATION
WHERE REGEXP_LIKE(CITY, '^[^AEIOU].*[^AEIOU]$', 'i')
ORDER BY CITY;

/*
18. Higher Than 75 Marks
Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
*/

#MySQL
SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID;   

#Oracle
SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY SUBSTR(Name, -3), ID;  

/*
19. Employee Names
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
*/

SELECT name
FROM Employee
ORDER BY name ASC;

/*
20. Employee Salaries
Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id.
*/

SELECT name
FROM Employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id ASC;
