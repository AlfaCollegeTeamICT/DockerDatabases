# Chinook Antwoorden

# Eenvoudige Queries

## SELECT

1. Toon alle artiesten uit de `Artist` tabel.
```sql
SELECT * FROM Artist;
```

2. Toon de naam en composer van alle nummers uit de `Track` tabel.
```sql
SELECT Name, Composer FROM Track;
```

3. Toon alle albums van de artiest met ArtistId 1.
```sql
SELECT * FROM Album WHERE ArtistId = 1;
```

4. Welke nummers duren langer dan 5 minuten? (300000 ms)
```sql
SELECT * FROM Track WHERE Milliseconds > 300000;
```

5. Toon alle klanten uit Brazil.
```sql
SELECT * FROM Customer WHERE Country = 'Brazil';
```

6. Toon alle klanten gesorteerd op achternaam (A-Z).
```sql
SELECT * FROM Customer ORDER BY LastName ASC;
```

7. Welke nummers kosten meer dan €0,99?
```sql
SELECT * FROM Track WHERE UnitPrice > 0.99;
```

8. Toon alle medewerkers die 'Manager' in hun titel hebben.
```sql
SELECT * FROM Employee WHERE Title LIKE '%Manager%';
```

9. Hoeveel nummers zijn er in totaal?
```sql
SELECT COUNT(*) AS aantal_nummers FROM Track;
```

10. Hoeveel verschillende genres zijn er?
```sql
SELECT COUNT(*) AS aantal_genres FROM Genre;
```

11. Toon alle nummers die het woord "Love" in de titel hebben.
```sql
SELECT * FROM Track WHERE Name LIKE '%Love%';
```

12. Welke albums hebben "Greatest" in de titel?
```sql
SELECT * FROM Album WHERE Title LIKE '%Greatest%';
```

13. Toon de 10 langste nummers (titel en lengte in minuten).
```sql
SELECT Name, Milliseconds / 60000 AS lengte_minuten
FROM Track
ORDER BY Milliseconds DESC
LIMIT 10;
```

14. Welke klanten hebben geen bedrijfsnaam?
```sql
SELECT * FROM Customer WHERE Company IS NULL;
```

15. Toon alle facturen uit 2009.
```sql
SELECT * FROM Invoice WHERE YEAR(InvoiceDate) = 2009;
```


## UPDATE & INSERT

1. Voeg een nieuwe artiest toe met de naam "Dutch Band".
```sql
INSERT INTO Artist (Name) VALUES ('Dutch Band');
```

2. Voeg een nieuw genre toe met de naam "Nederpop".
```sql
INSERT INTO Genre (Name) VALUES ('Nederpop');
```

3. Wijzig de naam van het genre "Rock" naar "Rock & Roll".
```sql
UPDATE Genre SET Name = 'Rock & Roll' WHERE Name = 'Rock';
```

4. Update het e-mailadres van de klant met CustomerId 1.
```sql
UPDATE Customer SET Email = 'nieuw@email.com' WHERE CustomerId = 1;
```

5. Voeg een nieuwe klant toe.
```sql
INSERT INTO Customer (FirstName, LastName, Email, Country)
VALUES ('Jan', 'de Vries', 'jan.devries@email.nl', 'Netherlands');
```


# GROUP BY & HAVING

1. Hoeveel albums heeft elke artiest?
```sql
SELECT ar.Name AS artiest, COUNT(al.AlbumId) AS aantal_albums
FROM Artist ar
LEFT JOIN Album al ON ar.ArtistId = al.ArtistId
GROUP BY ar.ArtistId
ORDER BY aantal_albums DESC;
```

2. Hoeveel nummers zijn er per genre?
```sql
SELECT g.Name AS genre, COUNT(t.TrackId) AS aantal_nummers
FROM Genre g
LEFT JOIN Track t ON g.GenreId = t.GenreId
GROUP BY g.GenreId
ORDER BY aantal_nummers DESC;
```

3. Welke genres hebben meer dan 100 nummers?
```sql
SELECT g.Name AS genre, COUNT(t.TrackId) AS aantal_nummers
FROM Genre g
JOIN Track t ON g.GenreId = t.GenreId
GROUP BY g.GenreId
HAVING COUNT(t.TrackId) > 100;
```

4. Wat is de totale speelduur per album in minuten?
```sql
SELECT al.Title AS album, SUM(t.Milliseconds) / 60000 AS totale_duur_min
FROM Album al
JOIN Track t ON al.AlbumId = t.AlbumId
GROUP BY al.AlbumId
ORDER BY totale_duur_min DESC;
```

5. Hoeveel klanten zijn er per land?
```sql
SELECT Country, COUNT(*) AS aantal_klanten
FROM Customer
GROUP BY Country
ORDER BY aantal_klanten DESC;
```

6. Welke landen hebben meer dan 5 klanten?
```sql
SELECT Country, COUNT(*) AS aantal_klanten
FROM Customer
GROUP BY Country
HAVING COUNT(*) > 5;
```

7. Wat is de gemiddelde nummerlengte per genre?
```sql
SELECT g.Name AS genre, AVG(t.Milliseconds) / 60000 AS gem_lengte_min
FROM Genre g
JOIN Track t ON g.GenreId = t.GenreId
GROUP BY g.GenreId
ORDER BY gem_lengte_min DESC;
```


# JOIN Oefeningen

1. Toon alle albums met de naam van de artiest.
```sql
SELECT al.Title AS album, ar.Name AS artiest
FROM Album al
JOIN Artist ar ON al.ArtistId = ar.ArtistId;
```

2. Toon alle nummers met hun genre.
```sql
SELECT t.Name AS nummer, g.Name AS genre
FROM Track t
JOIN Genre g ON t.GenreId = g.GenreId;
```

3. Overzicht van nummers met album en artiest.
```sql
SELECT t.Name AS nummer, al.Title AS album, ar.Name AS artiest
FROM Track t
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId;
```

4. Klanten met hun toegewezen supportmedewerker.
```sql
SELECT c.FirstName AS klant_voornaam, c.LastName AS klant_achternaam,
       e.FirstName AS medewerker_voornaam, e.LastName AS medewerker_achternaam
FROM Customer c
LEFT JOIN Employee e ON c.SupportRepId = e.EmployeeId;
```

5. Welke nummers staan in de playlist "Music"?
```sql
SELECT t.Name AS nummer
FROM Track t
JOIN PlaylistTrack pt ON t.TrackId = pt.TrackId
JOIN Playlist p ON pt.PlaylistId = p.PlaylistId
WHERE p.Name = 'Music';
```

6. Factuurregels met naam van het nummer en de klant.
```sql
SELECT t.Name AS nummer, c.FirstName, c.LastName, il.UnitPrice, il.Quantity
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Invoice i ON il.InvoiceId = i.InvoiceId
JOIN Customer c ON i.CustomerId = c.CustomerId;
```

7. Medewerkers met hun manager.
```sql
SELECT e.FirstName AS medewerker_voornaam, e.LastName AS medewerker_achternaam,
       m.FirstName AS manager_voornaam, m.LastName AS manager_achternaam
FROM Employee e
LEFT JOIN Employee m ON e.ReportsTo = m.EmployeeId;
```


# Subqueries

1. Welke nummers zijn langer dan het gemiddelde?
```sql
SELECT Name, Milliseconds
FROM Track
WHERE Milliseconds > (SELECT AVG(Milliseconds) FROM Track);
```

2. Welke artiesten hebben meer dan 10 albums?
```sql
SELECT ar.Name, COUNT(al.AlbumId) AS aantal_albums
FROM Artist ar
JOIN Album al ON ar.ArtistId = al.ArtistId
GROUP BY ar.ArtistId
HAVING COUNT(al.AlbumId) > 10;
```

3. Klanten die meer dan €40 hebben uitgegeven.
```sql
SELECT c.FirstName, c.LastName, SUM(i.Total) AS totaal_uitgegeven
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
HAVING SUM(i.Total) > 40;
```

4. Nummers duurder dan het duurste Jazz-nummer.
```sql
SELECT t.Name, t.UnitPrice
FROM Track t
WHERE t.UnitPrice > (
    SELECT MAX(t2.UnitPrice)
    FROM Track t2
    JOIN Genre g ON t2.GenreId = g.GenreId
    WHERE g.Name = 'Jazz'
);
```

5. Albums met nummers in meerdere genres.
```sql
SELECT al.Title, COUNT(DISTINCT t.GenreId) AS aantal_genres
FROM Album al
JOIN Track t ON al.AlbumId = t.AlbumId
GROUP BY al.AlbumId
HAVING COUNT(DISTINCT t.GenreId) > 1;
```


# Complexe Queries

1. Top 5 best verkochte nummers.
```sql
SELECT t.Name AS titel, SUM(il.Quantity) AS aantal_verkopen
FROM Track t
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY t.TrackId
ORDER BY aantal_verkopen DESC
LIMIT 5;
```

2. Welke artiest heeft de meeste omzet gegenereerd?
```sql
SELECT ar.Name AS artiest, SUM(il.UnitPrice * il.Quantity) AS totale_omzet
FROM Artist ar
JOIN Album al ON ar.ArtistId = al.ArtistId
JOIN Track t ON al.AlbumId = t.AlbumId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY ar.ArtistId
ORDER BY totale_omzet DESC
LIMIT 1;
```

3. Gemiddelde factuurwaarde per land.
```sql
SELECT c.Country, AVG(i.Total) AS gem_factuurwaarde
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.Country
ORDER BY gem_factuurwaarde DESC;
```

4. Welke klant heeft de meeste nummers gekocht?
```sql
SELECT c.FirstName, c.LastName, SUM(il.Quantity) AS aantal_nummers
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
GROUP BY c.CustomerId
ORDER BY aantal_nummers DESC
LIMIT 1;
```

5. Welke medewerker heeft de meeste klanten ondersteund?
```sql
SELECT e.FirstName, e.LastName, COUNT(c.CustomerId) AS aantal_klanten
FROM Employee e
JOIN Customer c ON e.EmployeeId = c.SupportRepId
GROUP BY e.EmployeeId
ORDER BY aantal_klanten DESC
LIMIT 1;
```

6. Maandelijkse omzet in 2009.
```sql
SELECT MONTH(InvoiceDate) AS maand, SUM(Total) AS omzet
FROM Invoice
WHERE YEAR(InvoiceDate) = 2009
GROUP BY MONTH(InvoiceDate)
ORDER BY maand;
```

7. Welke genres zijn het populairst?
```sql
SELECT g.Name AS genre, SUM(il.Quantity) AS aantal_verkopen
FROM Genre g
JOIN Track t ON g.GenreId = t.GenreId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY g.GenreId
ORDER BY aantal_verkopen DESC;
```

8. Playlists met nummers van meer dan 20 verschillende artiesten.
```sql
SELECT p.Name AS playlist, COUNT(DISTINCT ar.ArtistId) AS aantal_artiesten
FROM Playlist p
JOIN PlaylistTrack pt ON p.PlaylistId = pt.PlaylistId
JOIN Track t ON pt.TrackId = t.TrackId
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
GROUP BY p.PlaylistId
HAVING COUNT(DISTINCT ar.ArtistId) > 20;
```


# Uitdagende Queries

1. Top 10 artiesten met totale omzet en aantal verkochte nummers.
```sql
SELECT ar.Name AS artiest,
       SUM(il.UnitPrice * il.Quantity) AS totale_omzet,
       SUM(il.Quantity) AS aantal_verkocht
FROM Artist ar
JOIN Album al ON ar.ArtistId = al.ArtistId
JOIN Track t ON al.AlbumId = t.AlbumId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY ar.ArtistId
ORDER BY totale_omzet DESC
LIMIT 10;
```

2. Klanten die nummers uit alle genres hebben gekocht.
```sql
SELECT c.FirstName, c.LastName
FROM Customer c
WHERE (
    SELECT COUNT(DISTINCT t.GenreId)
    FROM Invoice i
    JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
    JOIN Track t ON il.TrackId = t.TrackId
    WHERE i.CustomerId = c.CustomerId
) = (SELECT COUNT(*) FROM Genre);
```

3. Hitfactor per artiest (totale verkopen / aantal nummers).
```sql
SELECT ar.Name AS artiest,
       SUM(il.Quantity) AS totale_verkopen,
       COUNT(DISTINCT t.TrackId) AS aantal_nummers,
       SUM(il.Quantity) / COUNT(DISTINCT t.TrackId) AS hitfactor
FROM Artist ar
JOIN Album al ON ar.ArtistId = al.ArtistId
JOIN Track t ON al.AlbumId = t.AlbumId
LEFT JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY ar.ArtistId
HAVING COUNT(DISTINCT t.TrackId) > 0
ORDER BY hitfactor DESC;
```

4. Album-tweelingen: albums met exact hetzelfde aantal nummers én dezelfde totale speelduur.
```sql
SELECT a1.Title AS album1, a2.Title AS album2,
       COUNT(DISTINCT t1.TrackId) AS aantal_nummers,
       SUM(t1.Milliseconds) AS totale_duur
FROM Album a1
JOIN Track t1 ON a1.AlbumId = t1.AlbumId
JOIN Album a2 ON a1.AlbumId < a2.AlbumId
JOIN Track t2 ON a2.AlbumId = t2.AlbumId
GROUP BY a1.AlbumId, a2.AlbumId
HAVING COUNT(DISTINCT t1.TrackId) = COUNT(DISTINCT t2.TrackId)
   AND SUM(t1.Milliseconds) = SUM(t2.Milliseconds);
```

5. Medewerker met hoogste omzet per klant gemiddeld.
```sql
SELECT e.FirstName, e.LastName,
       AVG(klant_totaal.totaal) AS gem_omzet_per_klant
FROM Employee e
JOIN Customer c ON e.EmployeeId = c.SupportRepId
JOIN (
    SELECT CustomerId, SUM(Total) AS totaal
    FROM Invoice
    GROUP BY CustomerId
) AS klant_totaal ON c.CustomerId = klant_totaal.CustomerId
GROUP BY e.EmployeeId
ORDER BY gem_omzet_per_klant DESC
LIMIT 1;
```


# Examenvoorbereiding

1. Hoeveel nummers heeft het album "Let There Be Rock"?
```sql
SELECT COUNT(*) AS aantal_nummers
FROM Track t
JOIN Album a ON t.AlbumId = a.AlbumId
WHERE a.Title = 'Let There Be Rock';
```

2. Wie is de manager van medewerker "Jane Peacock"?
```sql
SELECT m.FirstName, m.LastName
FROM Employee e
JOIN Employee m ON e.ReportsTo = m.EmployeeId
WHERE e.FirstName = 'Jane' AND e.LastName = 'Peacock';
```

3. Wat is de totale omzet van alle facturen uit Canada?
```sql
SELECT SUM(i.Total) AS totale_omzet
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
WHERE c.Country = 'Canada';
```

4. Welke 3 genres hebben de langste gemiddelde nummerlengte?
```sql
SELECT g.Name AS genre, AVG(t.Milliseconds) / 60000 AS gem_lengte_min
FROM Genre g
JOIN Track t ON g.GenreId = t.GenreId
GROUP BY g.GenreId
ORDER BY gem_lengte_min DESC
LIMIT 3;
```

5. Hoeveel procent van alle nummers is in het genre "Rock"?
```sql
SELECT
    (SELECT COUNT(*) FROM Track t JOIN Genre g ON t.GenreId = g.GenreId WHERE g.Name = 'Rock')
    * 100.0 / (SELECT COUNT(*) FROM Track) AS percentage_rock;
```

6. Welke klanten hebben nog nooit iets gekocht?
```sql
SELECT c.FirstName, c.LastName
FROM Customer c
LEFT JOIN Invoice i ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;
```

7. Wat is de duurste factuur en wie is de klant?
```sql
SELECT c.FirstName, c.LastName, i.Total
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
ORDER BY i.Total DESC
LIMIT 1;
```

8. Per jaar het aantal facturen en de totale omzet.
```sql
SELECT YEAR(InvoiceDate) AS jaar,
       COUNT(*) AS aantal_facturen,
       SUM(Total) AS totale_omzet
FROM Invoice
GROUP BY YEAR(InvoiceDate)
ORDER BY jaar;
```
