--Question 1
SELECT  first_name, last_name, district 
FROM customer c 
JOIN address a 
ON a.address_id  = c.address_id 
WHERE district = 'Texas'
;

--Question 2
SELECT first_name, last_name, amount
FROM customer c
JOIN payment p 
ON c.customer_id = p.customer_id 
WHERE amount>7;

--Question 3 
SELECT first_name, last_name
FROM customer c 
WHERE customer_id IN (
	SELECT customer_id
	FROM payment p 
	GROUP BY customer_id
	HAVING sum(amount)>=175
	ORDER BY customer_id);



--Question 4
SELECT first_name, last_name, country
FROM customer c 
JOIN address a 
ON c.address_id = a.address_id 
JOIN city c2 
ON a.city_id = c2.city_id 
JOIN country c3 
ON c2.country_id = c3.country_id 
WHERE c3.country LIKE 'Argentina';

--Question 5
SELECT  "name", count(*) AS num_movies_in_cat
FROM category c 
JOIN film_category fc 
ON c.category_id = fc.category_id 
GROUP BY c."name"
ORDER BY count(*) DESC;

--Question 6
SELECT f.title, count(a.actor_id)
FROM film f 
JOIN film_actor fa 
ON fa.film_id  = f.film_id 
JOIN actor a 
ON fa.actor_id = a.actor_id 
GROUP BY f.title 
ORDER BY count(a.actor_id) DESC;

--Question 7 *INCOMPLETE*
SELECT first_name, last_name, count(film_id)
FROM actor a 
JOIN film_actor fa 
ON a.actor_id = fa.actor_id 
GROUP BY a.actor_id 
ORDER BY count(fa.film_id)
;

--Question 8
SELECT country, count(city_id)
FROM country c 
JOIN city c2 
ON c.country_id = c2.country_id 
GROUP BY country
ORDER BY count(city_id) DESC 
;

--Question 9 
SELECT a.first_name, a.last_name
FROM actor a 
JOIN film_actor fa 
ON a.actor_id = fa.actor_id 
GROUP BY a.actor_id 
HAVING count(fa.film_id) BETWEEN 20 AND 25