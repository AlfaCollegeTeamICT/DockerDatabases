# Sakila Antwoorden

# Eenvoudige Queries

## SELECT

1. Laat alle informatie zien van alle films uit de tabel 'films'.
```sql
SELECT * FROM film;
```

2. Laat de titels, jaar en lengte zien van alle films.
```sql
SELECT title, release_year, length FROM film;
```

3. Laat alle informatie zien van alle acteurs uit de tabel 'actors'.
```sql
SELECT * FROM actor;
```

4. Laat alleen de acteurs zien met de voornaam "adam".
```sql
SELECT * FROM actor WHERE first_name = 'ADAM';
```

5. Laat alleen de acteurs zien met de achternaam "Hoffman".
```sql
SELECT * FROM actor WHERE last_name = 'HOFFMAN';
```

6. Laat de titels van de films zien die uitgekomen zijn na 2006.
```sql
SELECT title FROM film WHERE release_year > 2006;
```

7. Laat de titels van de films zien die uitgekomen zijn voor 2006.
```sql
SELECT title FROM film WHERE release_year < 2006;
```

8. Laat de films zien welke langer dan 2 uur duren.
```sql
SELECT * FROM film WHERE length > 120;
```

9. Laat de films zien welke korter dan 1 uur duren.
```sql
SELECT * FROM film WHERE length < 60;
```

10. Laat zien hoeveel films de categorie "Trailers" bevat.
```sql
SELECT COUNT(*) FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Trailers';
```

11. Laat zien welke films het woord "Thrilling" in de omschrijving hebben.
```sql
SELECT * FROM film WHERE description LIKE '%Thrilling%';
```

12. Laat alle titels van alle films zien, van Z-A.
```sql
SELECT title FROM film ORDER BY title DESC;
```

13. Laat alle titels zien van alle films welke goedkoper zijn dan €5,- om te huren.
```sql
SELECT title FROM film WHERE rental_rate < 5;
```

14. Wat is de duurste film om te huren?
```sql
SELECT title, rental_rate FROM film ORDER BY rental_rate DESC LIMIT 1;
```

15. Wat is de goedkoopste film om te huren?
```sql
SELECT title, rental_rate FROM film ORDER BY rental_rate ASC LIMIT 1;
```


## UPDATE & INSERT

1. Verander de naam van de categorie "Children" naar "Kids".
```sql
UPDATE category SET name = 'Kids' WHERE name = 'Children';
```

2. Verander de naam van het land "Netherlands" naar "The Netherlands".
```sql
UPDATE country SET country = 'The Netherlands' WHERE country = 'Netherlands';
```

3. Voeg een nieuwe acteur toe met de naam "Chris Evans".
```sql
INSERT INTO actor (first_name, last_name) VALUES ('CHRIS', 'EVANS');
```

4. Wijzig de naam van "Chris Evans" naar "Chris Pratt".
```sql
UPDATE actor SET last_name = 'PRATT' WHERE first_name = 'CHRIS' AND last_name = 'EVANS';
```

5. Voeg de film "Cyber Heist" toe aan de database.
```sql
INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost)
VALUES ('Cyber Heist', 'A group of hackers steal digital assets.', 2024, 1, 5, 4.99, 120, 19.99);
```

6. Verander de huurprijs en de vervangingswaarde door deze met 5 te verhogen.
```sql
UPDATE film SET rental_rate = rental_rate + 5, replacement_cost = replacement_cost + 5 WHERE title = 'Cyber Heist';
```

7. Voeg een nieuwe taal "Dutch" toe.
```sql
INSERT INTO language (name) VALUES ('Dutch');
```

8. Verander de taal van de film "STAR OPERATION" naar "Dutch".
```sql
UPDATE film SET language_id = (SELECT language_id FROM language WHERE name = 'Dutch') WHERE title = 'STAR OPERATION';
```


# Complexe Queries

1. Geef een top 5 van de meest verhuurde films (titel van de film, hoe vaak gehuurd).
```sql
SELECT f.title, COUNT(r.rental_id) AS aantal_verhuringen
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id
ORDER BY aantal_verhuringen DESC
LIMIT 5;
```

2. Geef een top 10 van de klanten die de meeste films huren.
```sql
SELECT c.first_name, c.last_name, COUNT(r.rental_id) AS aantal_films
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY aantal_films DESC
LIMIT 10;
```

3. Toon alle films die in meerdere categorieën staan.
```sql
SELECT f.title, COUNT(fc.category_id) AS aantal_categorieen
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
GROUP BY f.film_id
HAVING COUNT(fc.category_id) > 1;
```

4. Welke acteur speelt in de meeste films?
```sql
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS aantal_films
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY aantal_films DESC
LIMIT 1;
```

5. Welke films zijn nog nooit verhuurd?
```sql
SELECT f.title
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;
```

6. Films die minder dan de helft van de gemiddelde huurprijs kosten.
```sql
SELECT title
FROM film
WHERE rental_rate < (SELECT AVG(rental_rate) / 2 FROM film);
```


# GROUP BY & HAVING

1. Hoeveel films zijn er per categorie?
```sql
SELECT c.name AS categorie, COUNT(fc.film_id) AS aantal_films
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.category_id;
```

2. Welke categorieën hebben meer dan 60 films?
```sql
SELECT c.name AS categorie, COUNT(fc.film_id) AS aantal_films
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.category_id
HAVING COUNT(fc.film_id) > 60;
```

3. Geef per taal het aantal films en de gemiddelde huurprijs.
```sql
SELECT l.name AS taal, COUNT(f.film_id) AS aantal_films, AVG(f.rental_rate) AS gem_huurprijs
FROM language l
JOIN film f ON l.language_id = f.language_id
GROUP BY l.language_id;
```

4. Welke acteurs hebben in meer dan 30 films gespeeld?
```sql
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS aantal_films
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
HAVING COUNT(fa.film_id) > 30;
```

5. Hoeveel klanten zijn er per winkel?
```sql
SELECT store_id, COUNT(customer_id) AS aantal_klanten
FROM customer
GROUP BY store_id;
```


# JOIN Oefeningen

1. Toon alle films met hun categorie naam.
```sql
SELECT f.title, c.name AS categorie
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;
```

2. Geef een overzicht van alle klanten met hun adres en stad.
```sql
SELECT c.first_name, c.last_name, a.address, ci.city
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id;
```

3. Welke medewerkers werken in welke winkel met adres?
```sql
SELECT s.first_name, s.last_name, st.store_id, a.address, ci.city
FROM staff s
JOIN store st ON s.store_id = st.store_id
JOIN address a ON st.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id;
```

4. Toon alle films met de taal waarin ze beschikbaar zijn.
```sql
SELECT f.title, l.name AS taal
FROM film f
JOIN language l ON f.language_id = l.language_id;
```

5. Geef een lijst van verhuurde films met klant en verhuurdatum.
```sql
SELECT f.title, c.first_name, c.last_name, r.rental_date
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id;
```


# Datum Functies

1. Hoeveel verhuringen per maand in 2005?
```sql
SELECT MONTH(rental_date) AS maand, COUNT(*) AS aantal_verhuringen
FROM rental
WHERE YEAR(rental_date) = 2005
GROUP BY MONTH(rental_date)
ORDER BY maand;
```

2. Welke films zijn verhuurd in de laatste week van juli 2005?
```sql
SELECT DISTINCT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_date BETWEEN '2005-07-25' AND '2005-07-31';
```

3. Wat is de gemiddelde huurtijd per film?
```sql
SELECT f.title, AVG(DATEDIFF(r.return_date, r.rental_date)) AS gem_huurtijd_dagen
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.return_date IS NOT NULL
GROUP BY f.film_id;
```

4. Klanten met meer dan 5 films gehuurd in juni 2005.
```sql
SELECT c.first_name, c.last_name, COUNT(*) AS aantal_films
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
WHERE r.rental_date BETWEEN '2005-06-01' AND '2005-06-30'
GROUP BY c.customer_id
HAVING COUNT(*) > 5;
```


# Subqueries

1. Welke films hebben een hogere huurprijs dan het gemiddelde?
```sql
SELECT title, rental_rate
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);
```

2. Welke acteurs spelen in films uit de categorie "Action"?
```sql
SELECT DISTINCT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE fa.film_id IN (
    SELECT fc.film_id
    FROM film_category fc
    JOIN category c ON fc.category_id = c.category_id
    WHERE c.name = 'Action'
);
```

3. Klanten die meer hebben uitgegeven dan gemiddeld.
```sql
SELECT c.first_name, c.last_name, SUM(p.amount) AS totaal
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING SUM(p.amount) > (SELECT AVG(totaal) FROM (SELECT SUM(amount) AS totaal FROM payment GROUP BY customer_id) AS gem);
```

4. Films die langer duren dan de langste Comedy.
```sql
SELECT title, length
FROM film
WHERE length > (
    SELECT MAX(f.length)
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    WHERE c.name = 'Comedy'
);
```


# CASE Statements

1. Classificeer films op lengte.
```sql
SELECT title, length,
    CASE
        WHEN length < 60 THEN 'Kort'
        WHEN length BETWEEN 60 AND 120 THEN 'Normaal'
        ELSE 'Lang'
    END AS classificatie
FROM film;
```

2. Geef films een prijscategorie.
```sql
SELECT title, rental_rate,
    CASE
        WHEN rental_rate < 3 THEN 'Goedkoop'
        WHEN rental_rate BETWEEN 3 AND 4 THEN 'Gemiddeld'
        ELSE 'Duur'
    END AS prijscategorie
FROM film;
```

3. Tel films per lengte-categorie.
```sql
SELECT
    CASE
        WHEN length < 60 THEN 'Kort'
        WHEN length BETWEEN 60 AND 120 THEN 'Normaal'
        ELSE 'Lang'
    END AS categorie,
    COUNT(*) AS aantal
FROM film
GROUP BY categorie;
```


# Uitdagende Queries

1. Top 3 categorieën met meeste omzet.
```sql
SELECT c.name AS categorie, SUM(p.amount) AS totale_omzet
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN inventory i ON fc.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.category_id
ORDER BY totale_omzet DESC
LIMIT 3;
```

2. Meest voorkomende film-categorie per acteur.
```sql
SELECT a.first_name, a.last_name, c.name AS favoriete_categorie, COUNT(*) AS aantal
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film_category fc ON fa.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY a.actor_id, c.category_id
HAVING COUNT(*) = (
    SELECT MAX(cnt) FROM (
        SELECT COUNT(*) AS cnt
        FROM film_actor fa2
        JOIN film_category fc2 ON fa2.film_id = fc2.film_id
        WHERE fa2.actor_id = a.actor_id
        GROUP BY fc2.category_id
    ) AS sub
);
```

3. Klanten die alle films uit een categorie hebben gehuurd (voorbeeld: Horror).
```sql
SELECT c.first_name, c.last_name
FROM customer c
WHERE NOT EXISTS (
    SELECT f.film_id
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category cat ON fc.category_id = cat.category_id
    WHERE cat.name = 'Horror'
    AND f.film_id NOT IN (
        SELECT i.film_id
        FROM rental r
        JOIN inventory i ON r.inventory_id = i.inventory_id
        WHERE r.customer_id = c.customer_id
    )
);
```

4. Populariteitsscore per film.
```sql
SELECT f.title, COUNT(r.rental_id) AS aantal_verhuringen
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id
ORDER BY aantal_verhuringen DESC;
```

5. Film-tweelingen: films met dezelfde lengte én huurprijs.
```sql
SELECT f1.title AS film1, f2.title AS film2, f1.length, f1.rental_rate
FROM film f1
JOIN film f2 ON f1.length = f2.length AND f1.rental_rate = f2.rental_rate AND f1.film_id < f2.film_id
ORDER BY f1.length, f1.rental_rate;
```


# Examenvoorbereiding

1. Welke acteurs hebben de voornaam 'Scarlett'?
```sql
SELECT * FROM actor WHERE first_name = 'SCARLETT';
```

2. Welke acteurs hebben de achternaam 'Johansson'?
```sql
SELECT * FROM actor WHERE last_name = 'JOHANSSON';
```

3. Hoeveel unieke acteur-achternamen zijn er?
```sql
SELECT COUNT(DISTINCT last_name) FROM actor;
```

4. Welke achternamen zijn uniek?
```sql
SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;
```

5. Welke achternamen komen vaker dan 1x voor?
```sql
SELECT last_name, COUNT(*) AS aantal
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1;
```

6. Welke acteur heeft gespeeld in de meeste films?
```sql
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS aantal_films
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY aantal_films DESC
LIMIT 1;
```

7. Wat is de gemiddelde lengte van alle films?
```sql
SELECT AVG(length) AS gemiddelde_lengte FROM film;
```

8. Wat is de gemiddelde lengte per categorie?
```sql
SELECT c.name AS categorie, AVG(f.length) AS gemiddelde_lengte
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY c.category_id;
```
