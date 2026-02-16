DROP DATABASE IF EXISTS movies;
CREATE DATABASE movies;
USE movies;

CREATE TABLE director (
  director_id INT PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  nationality VARCHAR(80),
  birth_year INT
);

CREATE TABLE movie (
  movie_id INT PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  release_year INT,
  director_id INT,
  duration_min INT,
  rating DECIMAL(3,1), 
  FOREIGN KEY (director_id) REFERENCES director(director_id)
);

CREATE TABLE actor (
  actor_id INT PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  country VARCHAR(80)
);

CREATE TABLE cast_member (
  movie_id INT,
  actor_id INT,
  role_name VARCHAR(100),
  PRIMARY KEY (movie_id, actor_id),
  FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
  FOREIGN KEY (actor_id) REFERENCES actor(actor_id)
);

CREATE TABLE stream_log (
  stream_id INT PRIMARY KEY AUTO_INCREMENT,
  movie_id INT NOT NULL,
  user_id INT NOT NULL,
  view_date DATETIME NOT NULL,
  device_type VARCHAR(50), -- 'SmartTV', 'Mobile', 'Web'
  FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);


INSERT INTO director VALUES 
  (1, 'Christopher Nolan', 'British', 1970),
  (2, 'Greta Gerwig', 'American', 1983),
  (3, 'Denis Villeneuve', 'Canadian', 1967),
  (4, 'Peter Jackson', 'New Zealander', 1961),
  (5, 'Quentin Tarantino', 'American', 1963);

INSERT INTO movie VALUES 
  (101, 'Inception', 2010, 1, 148, 8.8),
  (102, 'Oppenheimer', 2023, 1, 180, 8.4),
  (103, 'Barbie', 2023, 2, 114, 6.9),
  (104, 'Dune: Part Two', 2024, 3, 166, 8.6),
  (105, 'The Lord of the Rings: The Return of the King', 2003, 4, 201, 9.0), 
  (106, 'Pulp Fiction', 1994, 5, 154, 8.9),
  (107, 'Interstellar', 2014, 1, 169, 8.7), 
  (108, 'Lady Bird', 2017, 2, 94, 7.4);  

INSERT INTO actor VALUES 
  (50, 'Cillian Murphy', 'Irish'),
  (51, 'Ryan Gosling', 'Canadian'),
  (52, 'Florence Pugh', 'British'),
  (53, 'Zendaya', 'American'),
  (54, 'Robert Downey Jr.', 'American'),
  (55, 'Matt Damon', 'American'),
  (56, 'Elijah Wood', 'American'),
  (57, 'Ian McKellen', 'British'),
  (58, 'Uma Thurman', 'American');

INSERT INTO cast_member VALUES 
  (102, 50, 'J. Robert Oppenheimer'),
  (102, 52, 'Jean Tatlock'),
  (103, 51, 'Ken'),
  (104, 53, 'Chani'),
  (104, 52, 'Princess Irulan'),
  (102, 54, 'Lewis Strauss'),
  (102, 55, 'Leslie Groves'),
  (105, 56, 'Frodo Baggins'),
  (105, 57, 'Gandalf'),
  (106, 58, 'Mia Wallace'),
  (107, 55, 'Dr. Mann'),    
  (107, 50, 'Scarecrow');

INSERT INTO stream_log (movie_id, user_id, view_date, device_type) VALUES 
  (101, 1001, '2026-01-10 21:00:00', 'SmartTV'),
  (102, 1002, '2026-01-11 15:30:00', 'Web'),
  (104, 1001, '2026-02-01 22:15:00', 'Mobile'),
  (102, 1003, '2026-02-05 19:00:00', 'SmartTV');