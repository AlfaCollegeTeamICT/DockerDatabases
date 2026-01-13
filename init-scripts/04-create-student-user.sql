-- Maakt gebruiker student aan met wachtwoord student
CREATE USER IF NOT EXISTS 'student'@'%' IDENTIFIED BY 'student';

-- Rechten op databases sakila, world en chinook
GRANT SELECT, INSERT, UPDATE ON sakila.* TO 'student'@'%';
GRANT SELECT, INSERT, UPDATE ON world.* TO 'student'@'%';
GRANT SELECT, INSERT, UPDATE ON Chinook.* TO 'student'@'%';

-- Rechten toepassen
FLUSH PRIVILEGES;
