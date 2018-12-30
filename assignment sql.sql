


#1
SELECT dest
FROM flights
ORDER BY distance DESC LIMIT 1;

#---------------------------------------------------------------------

#2
SELECT engines, tailnum, max(seats)
FROM planes
GROUP BY engines HAVING max(seats);

#---------------------------------------------------------------------

#3
SELECT COUNT(*) 
FROM flights;

#---------------------------------------------------------------------

#4
SELECT carrier, count(*)
FROM flights
GROUP BY carrier;

#---------------------------------------------------------------------

#5
SELECT carrier, count(*) 
FROM flights
GROUP BY carrier
ORDER BY count(*) DESC;

#---------------------------------------------------------------------

#6
SELECT carrier, count(*) 
FROM flights
GROUP BY carrier
ORDER BY count(*) DESC LIMIT 5;

#---------------------------------------------------------------------

#7
SELECT carrier, count(*) 
FROM flights
WHERE distance >= 1000
GROUP BY carrier
ORDER BY count(*) DESC LIMIT 5;


#---------------------------------------------------------------------
#8
/*
#Question:
Show Number of flights by month leaving airports LGA orJFK and arriving at airport MIA,
Departure times are between june 26 5am and dec 31 9pm
and the difference between average air_time of the flight in that month and minimum airtime of the flight in that month is less than 10.
sort by average air_time in ascending order
*/

#Answer
SELECT origin, dest, month, count(*) AS no_of_flights, AVG(air_time), MIN(air_time)
FROM flights
WHERE origin IN ('LGA','JFK')
AND dest = 'MIA'
AND month BETWEEN 6 AND 12
AND (day > 26 AND dep_time >= 500)
AND (day < 31 AND dep_time <= 900)
GROUP BY origin, dest, month HAVING AVG(air_time)-MIN(air_time) < 10
ORDER BY AVG(air_time);

