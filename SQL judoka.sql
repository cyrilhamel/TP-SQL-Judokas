-- CREATE DATABASE judokas;
use judokas;

-- création de la table judoka
CREATE TABLE judoka(
id_judoka INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_judoka VARCHAR(50) NOT NULL,
prenom_judoka VARCHAR(50) NOT NULL,
age_judoka INT NOT NULL,
sexe_judoka varchar(50) NOT NULL,
id_niveau INT NOT NULL
)engine=InnoDB;
-- création de la table niveau
CREATE TABLE niveau(
id_niveau INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
couleur_ceinture VARCHAR(50) NOT NULL
)engine=InnoDB;
-- création de la table compétition
CREATE TABLE competition(
id_competition INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_competition varchar(50) not null,
date_deb_competition DATE NOT NULL,
date_fin_competition DATE NOT NULL
)engine=InnoDB;
-- création de la table association participer
CREATE TABLE participer(
id_judoka INT NOT NULL,
id_competition INT NOT NULL,
PRIMARY KEY(id_judoka, id_competition)
)engine=InnoDB;

-- ajout des contraintes foreign key
ALTER TABLE judoka
ADD CONSTRAINT fk_posseder_niveau
FOREIGN KEY(id_niveau)
REFERENCES niveau(id_niveau);

ALTER TABLE participer
ADD CONSTRAINT fk_participer_competition
FOREIGN KEY(id_competition)
REFERENCES competition(id_competition);

ALTER TABLE participer
ADD CONSTRAINT fk_participer_judoka
FOREIGN KEY(id_judoka)
REFERENCES judoka(id_judoka);

-- ajout niveau
insert into niveau(couleur_ceinture) values
('blanche'),
('jaune'),
('orange'),
('verte'),
('bleu'),
('marron'),
('noire');

-- ajout des judokas
insert into judoka(nom_judoka, prenom_judoka, age_judoka, sexe_judoka, id_niveau) values
('Lachance', 'Dominique', 16, 'F', 2),
('Porter', 'Gilbert', 18, 'H', 3),
('Lemaître', 'Anne', 15, 'F', 4),
('Robert', 'Juliette', 12, 'F', 1),
('Montminy', 'Pierre', 17, 'H', 5),
('Charette', 'Pascal', 21, 'H', 6),
('Guay', 'Emilie', 19, 'F', 6),
('Maheu', 'Louise', 14, 'F', 4),
('Poulin', 'Raymond', 26, 'H', 7),
('Dupret', 'Alain', 20, 'H', 6);

-- ajout des competitions
insert into competition(nom_competition, date_deb_competition, date_fin_competition) values
('judo31', '2021-02-06', '2021-02-07'),
('judo11', '2021-02-27', '2021-02-28'),
('judo81', '2021-03-20', '2021-03-21'),
('judo82', '2021-04-17', '2021-04-18');

-- ajout participations
insert into participer(id_competition, id_judoka) values
(1, 1),
(1, 3),
(1, 4),
(2, 2),
(2, 5),
(2, 6),
(2, 9),
(3, 10),
(3, 9),
(4, 1),
(4, 3),
(4, 8),
(4, 4);

-- modification des 5 premiers judokas

update judoka set id_niveau=id_niveau+1 where id_judoka in (1,2,3,4,5);

-- création de 2 nouveaux judokas

insert into judoka(nom_judoka, prenom_judoka, age_judoka, sexe_judoka, id_niveau) values
('Main dargent', 'Edward', 37, 'H', 7),
('PorteKoi', 'Nain', 107, 'H', 6);

-- suppression des 2 derniers judokas

delete from judoka where id_judoka in (11, 12);

