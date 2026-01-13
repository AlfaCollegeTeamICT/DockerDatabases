# Chinook Opgaven

De Chinook database representeert een digitale muziekwinkel, vergelijkbaar met iTunes. De database bevat informatie over artiesten, albums, nummers, klanten, medewerkers en verkopen.

## Tabellen overzicht
- `Artist` - Artiesten
- `Album` - Albums (gekoppeld aan Artist)
- `Track` - Nummers (gekoppeld aan Album, Genre, MediaType)
- `Genre` - Muziekgenres
- `MediaType` - Bestandsformaten
- `Playlist` - Afspeellijsten
- `PlaylistTrack` - Koppeling tussen Playlist en Track
- `Customer` - Klanten
- `Employee` - Medewerkers
- `Invoice` - Facturen
- `InvoiceLine` - Factuurregels


# Eenvoudige Queries

## SELECT
1. Toon alle artiesten uit de `Artist` tabel.
2. Toon de naam en composer van alle nummers uit de `Track` tabel.
3. Toon alle albums van de artiest met ArtistId 1.
4. Welke nummers duren langer dan 5 minuten? (lengte staat in milliseconden)
5. Toon alle klanten uit Brazil.
6. Toon alle klanten gesorteerd op achternaam (A-Z).
7. Welke nummers kosten meer dan €0,99?
8. Toon alle medewerkers die 'Manager' in hun titel hebben.
9. Hoeveel nummers zijn er in totaal?
10. Hoeveel verschillende genres zijn er?

11. Toon alle nummers die het woord "Love" in de titel hebben.
12. Welke albums hebben "Greatest" in de titel?
13. Toon de 10 langste nummers (titel en lengte in minuten).
14. Welke klanten hebben geen bedrijfsnaam (Company is NULL)?
15. Toon alle facturen uit 2009.


## UPDATE & INSERT
1. Voeg een nieuwe artiest toe met de naam "Dutch Band".
2. Voeg een nieuw genre toe met de naam "Nederpop".
3. Wijzig de naam van het genre "Rock" naar "Rock & Roll".
4. Update het e-mailadres van de klant met CustomerId 1 naar "nieuw@email.com".
5. Voeg een nieuwe klant toe met de volgende gegevens:
   - Voornaam: Jan
   - Achternaam: de Vries
   - Email: jan.devries@email.nl
   - Land: Netherlands


# GROUP BY & HAVING
1. Hoeveel albums heeft elke artiest? (artiest naam, aantal albums)
2. Hoeveel nummers zijn er per genre? (genre naam, aantal nummers)
3. Welke genres hebben meer dan 100 nummers?
4. Wat is de totale speelduur per album in minuten? (album titel, totale duur)
5. Hoeveel klanten zijn er per land?
6. Welke landen hebben meer dan 5 klanten?
7. Wat is de gemiddelde nummerlengte per genre?


# JOIN Oefeningen
1. Toon alle albums met de naam van de artiest (album titel, artiest naam).
2. Toon alle nummers met hun genre (nummer titel, genre naam).
3. Geef een overzicht van alle nummers met album en artiest (nummer, album, artiest).
4. Toon alle klanten met hun toegewezen supportmedewerker (klant naam, medewerker naam).
5. Welke nummers staan in de playlist "Music"?
6. Toon alle factuurregels met de naam van het nummer en de klant.
7. Geef een overzicht van alle medewerkers met hun manager (medewerker naam, manager naam).


# Subqueries
1. Welke nummers zijn langer dan het gemiddelde?
2. Welke artiesten hebben meer dan 10 albums?
3. Welke klanten hebben meer uitgegeven dan €40 in totaal?
4. Toon nummers die duurder zijn dan het duurste nummer in het genre "Jazz".
5. Welke albums bevatten nummers in meerdere genres?


# Complexe Queries
1. Wat zijn de top 5 best verkochte nummers? (titel, aantal verkopen)
2. Welke artiest heeft de meeste omzet gegenereerd?
3. Wat is de gemiddelde factuurwaarde per land?
4. Welke klant heeft de meeste nummers gekocht?
5. Welke medewerker heeft de meeste klanten ondersteund?
6. Geef een overzicht van de maandelijkse omzet in 2009.
7. Welke genres zijn het populairst (meeste verkopen)?
8. Welke playlists bevatten nummers van meer dan 20 verschillende artiesten?


# Uitdagende Queries
1. Maak een top 10 van artiesten met hun totale omzet en aantal verkochte nummers.
2. Welke klanten hebben nummers gekocht uit alle beschikbare genres?
3. Bereken de "hitfactor" per artiest: (totale verkopen / aantal nummers).
4. Vind "album-tweelingen": albums met exact hetzelfde aantal nummers én dezelfde totale speelduur.
5. Welke medewerker heeft de hoogste omzet per klant gemiddeld?


# Examenvoorbereiding
1. Hoeveel nummers heeft het album "Let There Be Rock"?
2. Wie is de manager van medewerker "Jane Peacock"?
3. Wat is de totale omzet van alle facturen uit Canada?
4. Welke 3 genres hebben de langste gemiddelde nummerlengte?
5. Hoeveel procent van alle nummers is in het genre "Rock"?
6. Welke klanten hebben nog nooit iets gekocht?
7. Wat is de duurste factuur en wie is de klant?
8. Geef per jaar het aantal facturen en de totale omzet.
