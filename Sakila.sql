--What query would you run to get all the customers inside city_id = 312? Your query should return customer first name, last name, email, and address.
SELECT customer.first_name, customer.last_name, customer.email, address.address
FROM customer
LEFT JOIN address ON customer.address_id = address.address_id
WHERE address.city_id = 312

--What query would you run to get all comedy films? Your query should return film title, description, release year, rating, special features, and genre.
SELECT film.title, film.description, 
film.release_year, film.rating, film.special_features, category.name
FROM film
LEFT JOIN film_category ON film.film_id = film_category.film_id
LEFT JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Comedy'

--What query would you run to get all the films joined by actor_id=5? Your query should return the film title, description, and release year.
SELECT film.title, film.description, film.release_year
FROM film
LEFT JOIN film_actor ON film.film_id = film_actor.film_id
WHERE film_actor.actor_id = 5

--What query would you run to get all the customers in store_id = 1 and inside these cities (1, 42, 312 and 459)? Your query should return customer first name, last name, email, and address.
SELECT customer.first_name, customer.last_name, customer.email, address.address
FROM customer
LEFT JOIN address ON customer.address_id = address.address_id
LEFT JOIN store ON customer.store_id = store.store_id
WHERE store.store_id = 1
AND address.city_id in (1,42,312,459)

--What query would you run to get all the films with a "rating = G" and "special feature = behind the scenes", joined by actor_id = 15? Your query should return the film title, description, release year, rate, and special feature. Hint: You may use LIKE function in getting the 'behind the scenes' part.
SELECT film.title, film.rating, film.special_features, film_actor.actor_id
FROM film
LEFT JOIN film_actor ON film.film_id = film_actor.film_id
WHERE film.special_features like '%behind the scenes%'
AND film_actor.actor_id = 15
AND film.rating = 'G'

--What query would you run to get all the actors that joined in the film_id = 369? Your query should return the film_id, title, actor_id, and actor_name.
SELECT film.film_id, film.title, CONCAT(actor.first_name, ' ', actor.last_name) as actor_name
FROM film
LEFT JOIN film_actor ON film.film_id = film_actor.film_id
LEFT JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE film.film_id = 369

--What query would you run to get all drama films with a rental rate of 2.99? Your query should return film title, description, release year, rating, special features, and genre.
SELECT film.title, film.description, film.release_year, film.rating, 
film.special_features, category.name as genre
FROM film
LEFT JOIN film_category ON film.film_id = film_category.film_id
LEFT JOIN category ON film_category.category_id = category.category_id
WHERE film.rental_rate = 2.99
AND category.name = 'DRAMA'

--What query would you run to get all the action films which are joined by SANDRA KILMER? Your query should return film title, description, release year, rating, special features, genre, and actor's first name and last name.
SELECT film.title, film.description, film.release_year, film.rating, 
film.special_features, category.name as genre
FROM film
LEFT JOIN film_category ON film.film_id = film_category.film_id
LEFT JOIN category ON film_category.category_id = category.category_id
LEFT JOIN film_actor ON film.film_id = film_actor.film_id
LEFT JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE actor.first_name = 'SANDRA'
AND actor.last_name = 'KILMER'
AND category.name = 'ACTION'

