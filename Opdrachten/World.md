# MySQL-oefening: Analyse van de World-database

## Doel

Het doel van deze oefening is om diep in te gaan op de fundamentele concepten van MySQL door middel van analyse van de ingebouwde world-database. Deze database bevat tabellen met betrekking tot landen, steden en talen. Je onderzoekt deze datasets met complexe queries, gericht op gegevensselectie, sortering, filtering en het identificeren van unieke waarden.

## Vereisten
- Toegang tot de World-database.
- Basiskennis van SQL-syntaxis en databaseconcepten.
- Bekendheid met het MySQL world-database schema.
## Overzicht van Taken
- Gegevensverkenning met SELECT en FROM
- Resultaten sorteren met ORDER BY
- Gegevens filteren met WHERE, AND, OR, NOT
- Geavanceerd filteren met IN, NOT IN, BETWEEN, LIKE
- Resultaten beperken met LIMIT
- Omgaan met null-waarden met IS NULL
- Duplicaten verwijderen met SELECT DISTINCT
## Gedetailleerde Stappen en Richtlijnen

### Gegevensverkenning met SELECT en FROM
**Doel:**
Maak kennis met de structuur en inhoud van de tabellen in de world-database.

**Taak:**
Schrijf queries om alle kolommen uit elke tabel (country, city, countrylanguage) te selecteren. Analyseer de kolommen en het type gegevens.

### Resultaten sorteren met ORDER BY
**Doel:**
Begrijp hoe je queryresultaten sorteert op basis van één of meerdere kolommen.

**Taak:**
Schrijf een query om alle landen te selecteren en sorteer ze op populatie in aflopende volgorde. Sorteer vervolgens steden binnen elk land alfabetisch.


### Gegevens filteren met WHERE, AND, OR, NOT
**Doel:** 
Leer resultaten filteren met verschillende voorwaarden.

**Taak:** 
Maak queries om:
- Alle landen in Europa met een populatie groter dan 50 miljoen te selecteren.
- Steden in Brazilië of Argentinië te selecteren.
- Talen te selecteren in landen die niet op het continent 'Europe' liggen.


  

### Geavanceerd filteren met IN, NOT IN, BETWEEN, LIKE
**Doel:** 
Beheers complexe filtertechnieken.

**Taak:** 
Stel queries op om:
- Landen in de continenten 'Americas' of 'Asia' te selecteren met IN.
- Landen met een populatie tussen 10 en 50 miljoen te selecteren met BETWEEN.
- Steden te vinden waarvan de naam begint met 'San' met LIKE.

> Best practice: Gebruik % voor nul of meer tekens en _ voor één teken in LIKE-patronen.

  

### Resultaten beperken met LIMIT
**Doel:** 
Leer het aantal geretourneerde rijen te beperken.

**Taak:** 
Schrijf een query om de 10 meest bevolkte steden ter wereld te selecteren.

Uitleg: LIMIT wordt vaak gebruikt in combinatie met ORDER BY om top-n resultaten te verkrijgen.

  

### Omgaan met null-waarden met IS NULL
**Doel:** 
Begrijp hoe je null-waarden verwerkt in queryvoorwaarden.

**Taak:** 
Vind landen waar 'HeadOfState' niet is opgegeven (IS NULL).

> Let op: Vergelijkingen met NULL via = of <> werken niet zoals verwacht. Gebruik altijd IS NULL of IS NOT NULL.

  

### Duplicaten verwijderen met SELECT DISTINCT
**Doel:** 
Verwijder dubbele waarden uit queryresultaten.

**Taak:** 
Geef alle unieke continenten weer waarin landen zich bevinden.

> Uitleg: SELECT DISTINCT wordt gebruikt om alleen verschillende (unieke) waarden te retourneren.

  

## Projectscenario: Regionaal Analyseverslag

  

**Doel:** 
Stel een uitgebreid verslag samen waarin verschillende regio’s (continenten) worden geanalyseerd op basis van populatie, aantal landen, grote steden en gesproken talen.

**Stappen:**

1. Populatiegegevens per continent weergeven.
2. Het aantal landen per continent tellen.
3. Grote steden (top 3 op basis van populatie) per continent identificeren.
4. Unieke talen per continent weergeven.

Resultaat: SQL-queries die de gegevens voor het verslag opleveren en een schriftelijke samenvatting van je bevindingen.

  

## Extra Uitdagingen

- Combineer JOINs met filtering en sortering om gegevens uit verschillende tabellen te correleren.
- Gebruik subqueries en tijdelijke tabellen voor tussentijdse resultaten.
- Verken het gebruik van aggregatiefuncties (SUM, AVG, COUNT, enz.) en GROUP BY voor gegevenssamenvatting.