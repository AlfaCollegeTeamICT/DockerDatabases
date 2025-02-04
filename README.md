# Databases in Docker
Lesmateriaal voor de lessen Databases

Dit is een omgeving welke studenten zelf kunnen draaien met behulp van Docker.
In deze omgeving draait:
- Een database-server
- PHPmyAdmin

## Databases
In de omgeving zijn de volgende voorbeeld-databases beschikbaar:
- Sakila
- World

## Gebruikers
De omgeving heeft standaard 2 verschillende gebruikers, een root-gebruiker en een student-gebruiker.
Beide accounts kunnen worden gebruikt door de student, met behulp van de root-gebruiker kan geoefend worden met het aanpassen van authorisaties (25606/27016 P2-K1-W3) in PHPmyAdmin.

# Installatie
Voor het draaien van de omgeving moet Docker geinstalleerd zijn op het host-systeem.
Gebruik hiervoor bijvoorbeeld [Docker Desktop](https://www.docker.com/).

Hieronder zijn twee installatiemogelijkheden beschreven, een zonder git geinstalleerd op het host-systeem en een die hier wel gebruik van maakt.

Beide varianten hebben een `.env` bestand nodig waarin de gebruikersnamen en wachtwoorden staan, deze is niet standaard meegeleverd. Maak deze aan pas deze eventueel aan:

```.env
MYSQL_ROOT_PASSWORD=admin
MYSQL_DATABASE=sakila
MYSQL_USER=student
MYSQL_PASSWORD=student
PMA_PORT=8080
```


## Installatie met git
Installeer het project met de volgende commando's:
```bash
    git clone https://github.com/AlfaCollegeTeamICT/DockerDatabases.git
    cd DockerDatabases

    # Maak het .env bestand aan volgens bovenstaande instructie

    docker compose up -d
```

## Installatie zonder git
1. [Download het project](https://github.com/AlfaCollegeTeamICT/DockerDatabases/archive/refs/heads/main.zip)
2. Pak het project uit
3. Maak het .env bestand aan volgens bovenstaande instructie.
4. Open een terminal in de map
5. Voer het commando `docker compose up -d` uit


# Gebruik
Het project draait nu op:
[http://127.0.0.1:8080](http://127.0.0.1:8080)

Open bovenstaande link in je browser en log in met de de volgende credentials: `student:student`

Je kunt in deze omgeving je opdrachten maken
