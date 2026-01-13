# World Antwoorden

## Gegevensverkenning met SELECT en FROM

Alle kolommen uit elke tabel selecteren:
```sql
SELECT * FROM country;
SELECT * FROM city;
SELECT * FROM countrylanguage;
```


## Resultaten sorteren met ORDER BY

Alle landen gesorteerd op populatie (aflopend):
```sql
SELECT * FROM country ORDER BY Population DESC;
```

Steden binnen elk land alfabetisch gesorteerd:
```sql
SELECT * FROM city ORDER BY CountryCode, Name ASC;
```


## Gegevens filteren met WHERE, AND, OR, NOT

Alle landen in Europa met een populatie groter dan 50 miljoen:
```sql
SELECT * FROM country
WHERE Continent = 'Europe' AND Population > 50000000;
```

Steden in Brazilië of Argentinië:
```sql
SELECT * FROM city
WHERE CountryCode = 'BRA' OR CountryCode = 'ARG';
```

Alternatief met IN:
```sql
SELECT * FROM city
WHERE CountryCode IN ('BRA', 'ARG');
```

Talen in landen die niet in Europa liggen:
```sql
SELECT cl.* FROM countrylanguage cl
JOIN country c ON cl.CountryCode = c.Code
WHERE c.Continent != 'Europe';
```


## Geavanceerd filteren met IN, NOT IN, BETWEEN, LIKE

Landen in de continenten 'Americas' of 'Asia' met IN:
```sql
SELECT * FROM country
WHERE Continent IN ('North America', 'South America', 'Asia');
```

Landen met een populatie tussen 10 en 50 miljoen met BETWEEN:
```sql
SELECT * FROM country
WHERE Population BETWEEN 10000000 AND 50000000;
```

Steden waarvan de naam begint met 'San':
```sql
SELECT * FROM city
WHERE Name LIKE 'San%';
```


## Resultaten beperken met LIMIT

De 10 meest bevolkte steden ter wereld:
```sql
SELECT * FROM city
ORDER BY Population DESC
LIMIT 10;
```


## Omgaan met null-waarden met IS NULL

Landen waar HeadOfState niet is opgegeven:
```sql
SELECT * FROM country
WHERE HeadOfState IS NULL;
```


## Duplicaten verwijderen met SELECT DISTINCT

Alle unieke continenten:
```sql
SELECT DISTINCT Continent FROM country;
```


## Projectscenario: Regionaal Analyseverslag

### 1. Populatiegegevens per continent
```sql
SELECT Continent, SUM(Population) AS totale_populatie
FROM country
GROUP BY Continent
ORDER BY totale_populatie DESC;
```

### 2. Het aantal landen per continent
```sql
SELECT Continent, COUNT(*) AS aantal_landen
FROM country
GROUP BY Continent
ORDER BY aantal_landen DESC;
```

### 3. Grote steden (top 3 op basis van populatie) per continent
```sql
SELECT c.Continent, ci.Name AS stad, ci.Population
FROM city ci
JOIN country c ON ci.CountryCode = c.Code
WHERE ci.Population IN (
    SELECT ci2.Population
    FROM city ci2
    JOIN country c2 ON ci2.CountryCode = c2.Code
    WHERE c2.Continent = c.Continent
    ORDER BY ci2.Population DESC
    LIMIT 3
)
ORDER BY c.Continent, ci.Population DESC;
```

Alternatief met window functies (indien ondersteund):
```sql
SELECT Continent, stad, Population FROM (
    SELECT c.Continent, ci.Name AS stad, ci.Population,
           ROW_NUMBER() OVER (PARTITION BY c.Continent ORDER BY ci.Population DESC) AS rn
    FROM city ci
    JOIN country c ON ci.CountryCode = c.Code
) AS ranked
WHERE rn <= 3
ORDER BY Continent, Population DESC;
```

### 4. Unieke talen per continent
```sql
SELECT DISTINCT c.Continent, cl.Language
FROM countrylanguage cl
JOIN country c ON cl.CountryCode = c.Code
ORDER BY c.Continent, cl.Language;
```

Aantal unieke talen per continent:
```sql
SELECT c.Continent, COUNT(DISTINCT cl.Language) AS aantal_talen
FROM countrylanguage cl
JOIN country c ON cl.CountryCode = c.Code
GROUP BY c.Continent
ORDER BY aantal_talen DESC;
```


## Extra Uitdagingen

### JOINs met filtering en sortering
Landen met hun hoofdstad en populatie, gesorteerd op populatie:
```sql
SELECT c.Name AS land, ci.Name AS hoofdstad, c.Population
FROM country c
JOIN city ci ON c.Capital = ci.ID
ORDER BY c.Population DESC;
```

### Subqueries
Landen waar de hoofdstad groter is dan 5 miljoen inwoners:
```sql
SELECT c.Name AS land, ci.Name AS hoofdstad, ci.Population
FROM country c
JOIN city ci ON c.Capital = ci.ID
WHERE ci.Population > 5000000;
```

### Aggregatiefuncties en GROUP BY
Gemiddelde levensverwachting per continent:
```sql
SELECT Continent, AVG(LifeExpectancy) AS gem_levensverwachting
FROM country
WHERE LifeExpectancy IS NOT NULL
GROUP BY Continent
ORDER BY gem_levensverwachting DESC;
```

Totaal BNP per continent:
```sql
SELECT Continent, SUM(GNP) AS totaal_bnp
FROM country
GROUP BY Continent
ORDER BY totaal_bnp DESC;
```

Landen met meer dan 5 officiële talen:
```sql
SELECT c.Name, COUNT(cl.Language) AS aantal_talen
FROM country c
JOIN countrylanguage cl ON c.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY c.Code
HAVING COUNT(cl.Language) > 5;
```
