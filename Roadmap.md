# Roadmap

Dit document beschrijft mogelijke uitbreidingen voor het DockerDatabases project.

## Automatische Query Tests

### Optie 1: Resultaat-vergelijking (Python)

**Complexiteit:** Laag

Een simpel Python script dat student queries vergelijkt met model-antwoorden door de resultaten naast elkaar te leggen.

```python
# test_queries.py
import mysql.connector

def test_query(student_query, expected_query):
    conn = mysql.connector.connect(
        host='localhost',
        user='root',
        password='admin',
        database='sakila'
    )
    cursor = conn.cursor()

    cursor.execute(student_query)
    student_result = set(cursor.fetchall())

    cursor.execute(expected_query)
    expected_result = set(cursor.fetchall())

    return student_result == expected_result
```

**Voordelen:**
- Eenvoudig te implementeren
- Geen extra dependencies nodig
- Werkt met elke SQL-variant

**Nadelen:**
- Geen gedetailleerde feedback
- Volgorde van resultaten wordt genegeerd


### Optie 2: pytest-sql Framework

**Complexiteit:** Gemiddeld

Een gestructureerd test framework met pytest voor uitgebreide validatie.

```python
# tests/test_sakila.py
import pytest
import mysql.connector

@pytest.fixture
def db():
    conn = mysql.connector.connect(
        host='localhost',
        user='root',
        password='admin',
        database='sakila'
    )
    yield conn.cursor()
    conn.close()

def test_vraag_1_alle_films(db):
    """Alle films uit de film tabel"""
    student_answer = open('student_answers/vraag1.sql').read()
    db.execute(student_answer)
    result = db.fetchall()

    assert len(result) == 1000, "Verwacht 1000 films"

def test_vraag_2_film_kolommen(db):
    """Titels, jaar en lengte van alle films"""
    student_answer = open('student_answers/vraag2.sql').read()
    db.execute(student_answer)

    # Check kolommen
    columns = [desc[0] for desc in db.description]
    assert 'title' in columns
    assert 'release_year' in columns
    assert 'length' in columns
```

**Voordelen:**
- Gedetailleerde test rapportages
- Herbruikbare fixtures
- Integratie met CI/CD mogelijk

**Nadelen:**
- Vereist pytest kennis
- Meer setup nodig


### Optie 3: Docker-based Testing

**Complexiteit:** Gemiddeld

Een geïsoleerde test-omgeving die in Docker draait.

```yaml
# docker-compose.test.yml
services:
  mariadb:
    image: mariadb:latest
    environment:
      MYSQL_ROOT_PASSWORD: admin
    volumes:
      - ./init-scripts:/docker-entrypoint-initdb.d

  test-runner:
    image: python:3.11
    volumes:
      - ./tests:/tests
      - ./student_answers:/answers
    command: pytest /tests --tb=short -v
    depends_on:
      mariadb:
        condition: service_healthy
```

**Voordelen:**
- Geïsoleerde test-omgeving
- Reproduceerbare resultaten
- Geen lokale installatie nodig

**Nadelen:**
- Langere opstarttijd
- Meer resources nodig


### Optie 4: Webinterface met Directe Feedback

**Complexiteit:** Hoog

Een webapplicatie waar studenten queries kunnen invoeren en direct feedback krijgen.

**Architectuur:**
```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│   Frontend      │────▶│   Backend       │────▶│   MariaDB       │
│   (HTML/JS)     │     │   (Python/PHP)  │     │                 │
└─────────────────┘     └─────────────────┘     └─────────────────┘
```

**Features:**
- Query editor met syntax highlighting
- Directe uitvoering en resultaat weergave
- Vergelijking met model-antwoord
- Hints bij foute antwoorden
- Voortgang per student bijhouden

**Technologie opties:**
- Frontend: HTML/CSS/JavaScript of React
- Backend: Python (Flask/FastAPI) of PHP
- Bestaande tools: SQLZoo, HackerRank-style

**Voordelen:**
- Beste gebruikerservaring
- Directe feedback voor studenten
- Voortgang tracking mogelijk

**Nadelen:**
- Meeste ontwikkeltijd
- Extra hosting/onderhoud nodig


## Overige Uitbreidingen

### Extra Databases
- [ ] Northwind (e-commerce)
- [ ] Eigen ontwerp-opdracht voor studenten

### Documentatie
- [ ] ER-diagrammen voor alle databases
- [ ] SQL cheat sheet
- [ ] Theorie documenten per onderwerp

### Geavanceerde Onderwerpen
- [ ] Opdrachten voor Views
- [ ] Opdrachten voor Stored Procedures
- [ ] Opdrachten voor Triggers
- [ ] Opdrachten voor Indexen en Performance
- [ ] Opdrachten voor Transacties (BEGIN, COMMIT, ROLLBACK)
- [ ] Opdrachten voor Database Normalisatie

### Tooling
- [ ] Database reset script
- [ ] Adminer als alternatief voor PHPMyAdmin
- [ ] Backup/restore handleiding
