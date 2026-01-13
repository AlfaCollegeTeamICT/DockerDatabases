# Sakila Opgaven 

# Eenvoudige Queries

## SELECT
1. Laat alle informatie zien van alle films uit de tabel 'films'.
2. Laat de titels, jaar en lengte zien van alle films.
3. Laat alle informatie zien van alle acteurs uit de tabel 'actors'.
4. Laat alleen de acteurs zien met de voornaam "adam".
5. Laat alleen de acteurs zien met de achternaam "Hoffman".
6. Laat de titels van de films zien die uitgekomen zijn na 2006.
7. Laat de titels van de films zien die uitgekomen zijn voor 2006.
8. Laat de films zien welke langer dan 2 uur duren.
9. Laat de films zien welke korter dan 1 uur duren.
10. Laat zien hoeveel films de categorie "Trailers" bevat.

11. Laat zien welke films het woord "Thrilling" in de omschrijving hebben.
12. Laat alle titels van alle films zien, van Z-A.
13. Laat alle titels zien van alle films welke goedkoper zijn dan €5,- om te huren.
14. Wat is de duurste film om te huren?
15. Wat is de goedkoopste film om te huren?


## UPDATE && INSERT
1. Verander de naam van de categorie "Children" naar "Kids".
2. Verander de naam van het land "Netherlands" naar "The Netherlands".
3. Voeg een nieuwe acteur toe met de naam "Chris Evans".
4. Wijzig de naam van "Chris Evans" naar "Chris Pratt".
5. Voeg de film "Cyber Heist" toe aan de database met de volgende informatie:
    - Titel: "Cyber Heist"
    - Description: "A group of hackers steal digital assets."
    - Jaar: 2024
    - Taal: Engels
    - Rental Duration: 5
    - Rental Rate: 4.99
    - Lengte: 120 minuten
    - Replacement Cost: 19.99

6. Verander (met een querie) de huurprijs en de vervangingswaarde door deze met 5 te verhogen
7. Voeg een nieuwe taal "Dutch" toe
8. Verander de taal van de film "STAR OPERATION" naar "Dutch".


# Complexe Queries
1. Geef een top 5 van de meest verhuurde films (titel van de film, hoe vaak gehuurd)
2. Geef een top 10 van de klanten die de meeste films huren (voornaam, achternaam, aantal films gehuurd)
3. Toon alle films die in meerdere categorieen staan (titel, aantal categorieen)
4. Welke acteur speelt in de meeste films? (voornaam, achternaam)
5. Welke films zijn nog nooit verhuurd? (titel)
6. Maak een overzicht van films die verhuurd kunnen worden welke minder dan de helft van de gemiddelde huurprijs kosten. (titel)


# GROUP BY & HAVING
1. Hoeveel films zijn er per categorie? (categorie naam, aantal films)
2. Welke categorieën hebben meer dan 60 films?
3. Geef per taal het aantal films en de gemiddelde huurprijs.
4. Welke acteurs hebben in meer dan 30 films gespeeld? (voornaam, achternaam, aantal films)
5. Hoeveel klanten zijn er per winkel (store)?


# JOIN Oefeningen
1. Toon alle films met hun categorie naam (titel, categorie).
2. Geef een overzicht van alle klanten met hun adres en stad (voornaam, achternaam, adres, stad).
3. Welke medewerkers (staff) werken in welke winkel? Toon ook het adres van de winkel.
4. Toon alle films met de taal waarin ze beschikbaar zijn (titel, taal).
5. Geef een lijst van alle verhuurde films met de klant die ze gehuurd heeft en de verhuurdatum.


# Datum Functies
1. Hoeveel verhuringen zijn er gedaan per maand in 2005?
2. Welke films zijn verhuurd in de laatste week van juli 2005?
3. Wat is de gemiddelde huurtijd (in dagen) per film?
4. Welke klanten hebben in juni 2005 meer dan 5 films gehuurd?


# Subqueries
1. Welke films hebben een hogere huurprijs dan het gemiddelde?
2. Welke acteurs spelen in films uit de categorie "Action"?
3. Welke klanten hebben meer uitgegeven dan de gemiddelde klant? (gebruik de `payment` tabel)
4. Toon films die langer duren dan de langste film in de categorie "Comedy".


# CASE Statements
1. Classificeer films als "Kort" (<60 min), "Normaal" (60-120 min), of "Lang" (>120 min).
2. Geef films een prijscategorie: "Goedkoop" (<3), "Gemiddeld" (3-4), "Duur" (>4).
3. Tel hoeveel films er in elke lengte-categorie vallen.


# Uitdagende Queries
1. Welke 3 categorieën leveren de meeste omzet op? (categorie, totale omzet)
2. Geef per acteur hun meest voorkomende film-categorie.
3. Welke klanten hebben alle films uit een bepaalde categorie gehuurd?
4. Bereken de "populariteitsscore" van elke film (aantal verhuringen × gemiddelde rating indien beschikbaar).
5. Vind "film-tweelingen": films met exact dezelfde lengte én huurprijs.


# Examenvoorbereiding
Onder dit kopje staat een mix tussen eenvoudige en complexe queries.

1. Welke acteurs hebben de voornaam 'Scarlett'?
2. Welke acteurs hebben de achternaam 'Johansson'?
3. Hoeveel unieke acteur-achternamen zijn er?
4. Welke achternamen zijn uniek? (niet repeterend)?
5. Welke achternamen komen vaker dan 1x voor?
6. Welke acteur heeft gespeeld in de meeste films?
7. Wat is de gemiddelde lengte van alle films in de database?
8. Wat is de gemiddelde lengte van alle films op categorie?