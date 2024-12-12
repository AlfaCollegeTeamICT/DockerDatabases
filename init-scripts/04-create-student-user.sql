-- Maakt gebruiker student aan met wachtwoord student
CREATE USER IF NOT EXISTS 'student'@'%' IDENTIFIED BY 'student';

-- Rechten op databases sakila en world
GRANT SELECT, INSERT, UPDATE ON sakila.* TO 'student'@'%';
GRANT SELECT, INSERT, UPDATE ON world.* TO 'student'@'%';

-- Rechten toepassen
FLUSH PRIVILEGES;
