-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy.
-- - Movie data includes the movie title, year released, MPAA rating,
--   and studio.
-- - There are many studios, and each studio produces many movies, but
--   a movie belongs to a single studio.
-- - An actor can be in multiple movies.
-- - Everything you need to do in this assignment is marked with TODO!
-- - Note rubric explanation for appropriate use of external resources.

-- User stories
--
-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information.
-- - As a guest, I want to see the movies which a single studio has produced.
-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
-- - As a guest, I want to see the movies which a single actor has acted in.
-- * Note: The "guest" user role represents the experience prior to logging-in
--   to an app and typically does not have a corresponding database table.


-- Deliverables
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
-- - Insertion of "Batman" sample data into tables.
-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
--
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 
--   Hint #1: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.
--   Hint #2: Do NOT name one of your models/tables “cast” or “casts”; this 
--   is a reserved word in sqlite and will break your database! Instead, 
--   think of a better word to describe this concept; i.e. the relationship 
--   between an actor and the movie in which they play a part.
-- 2. Execution of the domain model (CREATE TABLE) - 4 points
-- - Follow best practices for table and column names
-- - Use correct data column types (i.e. TEXT/INTEGER)
-- - Use of the `model_id` naming convention for foreign key columns
-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created
-- - It actually works, i.e. proper INSERT syntax
-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.
-- 5. Using external resources for help with the assignment (including colleagues, AI, internet search, etc):
-- - Engineers look to colleagues and the internet all the time when building software.
--   You are welcome to do the same. However, the solution you submit must utilize
--   the skills and strategies covered in class. Alternate solutions which do not demonstrate
--   an understanding of the approaches used in class will receive significant deductions.
--   Any concern should be raised with faculty prior to assignment due date.

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
--Create new tables, according to your domain model
--  ***completed 04.14.24
DROP TABLE Movies;
DROP TABLE Actors;
DROP TABLE Roles;
DROP TABLE Studios;

CREATE TABLE Studios (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
 name TEXT
 );


CREATE TABLE Movies (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
 Title TEXT,
 Rating TEXT,
 Year_Released TEXT,
 studio_id INTEGER
 );

CREATE TABLE Actors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
 first_last TEXT
 );


CREATE TABLE Roles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
    Movie_id INTEGER,
    Actor_id INTEGER,
    role_played TEXT
  );

  

-- ***note from office hours*** ^^^ = combining info for roles
--

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO! Done 04.14.24

INSERT INTO Studios (
 name 
)
VALUES (
 "Warner Bros."
);

INSERT INTO Movies (
 Title,
 Rating,
 Year_Released,
 studio_id
)
VALUES (
  "Batman Begins",
  "PG-13",
  "2005",
  1 );

  INSERT INTO Movies (
 Title,
 Rating,
 Year_Released,
 studio_id
)
VALUES (
  "The Dark Knight",
  "PG-13",
  "2008",
  1 );

  INSERT INTO Movies (
 Title,
 Rating,
 Year_Released,
 studio_id
)
VALUES (
  "The Dark Knight Rises",
  "PG-13",
  "2012",
  1 );
  --******qoutes are the names we using, 1 = Warner Bros.
--**** (in terminal) SELECT * FROM Movies will show progress of work

INSERT INTO Actors (
    first_last
) VALUES ("Christian Bale");

INSERT INTO Actors (
    first_last
) VALUES ("Michael Caine");

INSERT INTO Actors (
    first_last
) VALUES ("Liam Neeson");

INSERT INTO Actors (
    first_last
) VALUES ("Katie Holmes");

INSERT INTO Actors (
    first_last
) VALUES ("Gary Oldman");

INSERT INTO Actors (
    first_last
) VALUES ("Heath Ledger");

INSERT INTO Actors (
    first_last
) VALUES ("Aaron Eckhart");

INSERT INTO Actors (
    first_last
) VALUES ("Maggie Gyllenhaal");

INSERT INTO Actors (
    first_last
) VALUES ("Tom Hardy");

INSERT INTO Actors (
    first_last
) VALUES ("Joseph Gordon-Levitt");

INSERT INTO Actors (
    first_last
) VALUES ("Anne Hathaway");



--Do this for all 15 Roles: Hint (11 Actors)
INSERT INTO Roles (
    Movie_id,
    Actor_id,
    role_played 
) VALUES (1,1,"Bruce Wayne");

INSERT INTO Roles (
    Movie_id,
    Actor_id,
    role_played 
) VALUES (1,2,"Alfred");

INSERT INTO Roles (
    Movie_id,
    Actor_id,
    role_played 
) VALUES (1,3,"Ra's Al Ghul");

INSERT INTO Roles (
    Movie_id,
    Actor_id,
    role_played 
) VALUES (1,4,"Rachel Dawes");

INSERT INTO Roles (
    Movie_id,
    Actor_id,
    role_played 
) VALUES (1,5,"Commissioner Gordon");


--Dark Knight****
INSERT INTO Roles (
    Movie_id,
    Actor_id,
    role_played 
) VALUES (2,1,"Bruce Wayne");


INSERT INTO Roles (
    Movie_id,
    Actor_id,
    role_played 
) VALUES (2,6,"Joker");

INSERT INTO Roles (
    Movie_id,
    Actor_id,
    role_played 
) VALUES (2,7,"Harvey Dent");

INSERT INTO Roles (
    Movie_id,
    Actor_id,
    role_played 
) VALUES (2,2,"Alfred");

INSERT INTO Roles (
    Movie_id,
    Actor_id,
    role_played 
) VALUES (2,8,"Rachel Dawes");

--Dark Night Rises ***

INSERT INTO Roles (
    Movie_id,
    Actor_id,
    role_played 
) VALUES (3,1,"Bruce Wayne");

INSERT INTO Roles (
    Movie_id,
    Actor_id,
    role_played 
) VALUES (3,5,"Commissioner Gordon");

INSERT INTO Roles (
    Movie_id,
    Actor_id,
    role_played 
) VALUES (3,9,"Bane");

INSERT INTO Roles (
    Movie_id,
    Actor_id,
    role_played 
) VALUES (3,10,"John Blake");

INSERT INTO Roles (
    Movie_id,
    Actor_id,
    role_played 
) VALUES (3,11,"Selina Kyle");


-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""

-- The SQL statement for the movies output
-- TODO!

SELECT Movies.Title, Movies.Year_Released, Movies.Rating, Studios.Name
FROM Movies
INNER JOIN Studios ON Studios.id = Movies.studio_id;
---Good to go!


--movies.title = the column where title is from
--Studios.name made the text come up instead of integer


--GROUP BY listings.neighborhood;
-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""



-- The SQL statement for the cast output
-- TODO! 04.14.2024

SELECT Movies.Title, Actors.first_last, Roles.role_played
FROM Movies
INNER JOIN Roles ON Roles.Movie_id = Movies.id
INNER JOIN Actors ON Actors.id = Roles.Actor_id;

