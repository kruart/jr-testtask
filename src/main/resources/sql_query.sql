DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;
CREATE TABLE user
        (
          id int(8) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
          name varchar(25) NOT NULL,
          age int(3)unsigned DEFAULT NULL,
          isAdmin boolean DEFAULT FALSE,
          createdDate timestamp NULL DEFAULT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO USER(name,age,isAdmin,createdDate) VALUES
  ('Super Man',30,true, 20150101),
  ('Ghost Rider',40,false,20150101),
  ('Jessica Jones',50,true,20150101),
  ('Black Panther',60,false,20150101),
  ('Nick Fury',70,true,20000101),
  ('The Invisible Woman',80,false,20150101),
  ('Iron Man',37,true,20150101),
  ('Professor X',48,false,20150101),
  ('Daredevil',50,true,20030205),
  ('Captain America',70,true, 20100215),
  ('Bucky Barnes',69,true, 20100215),
  ('Amadeus Cho',45,true, 19990215),
  ('Spider-Man',40,true,20150101),
  ('Alex Wilder',73,true,20150101),
  ('Spider-Man',73,true,20150101),
  ('Crossbones',73,true,20150101),
  ('Nico Minoru',25,true,20150101),
  ('Quicksilver',29,true,20150101),
  ('The Pride',113,true,20150101),
  ('Molly Hayes',51,true,20150101),
  ('Silver Surfer',51,true,20150101),
  ('Red Skull',64,true,20150101),
  ('Beta Ray Bill',45,true,20150101),
  ('Juggernaut',40,true,20150101);