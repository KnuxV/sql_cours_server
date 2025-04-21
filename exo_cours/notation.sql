-- Création de la base de données
CREATE DATABASE IF NOT EXISTS notation;

-- Utilisation de la base de données
USE notation;

-- Création des tables
CREATE TABLE IF NOT EXISTS etudiants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL
);
CREATE TABLE cours (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom_cours VARCHAR(100) NOT NULL,
    description TEXT,
    ects INT DEFAULT 3
);


CREATE TABLE IF NOT EXISTS inscriptions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_etudiant INT,
    id_cours INT,
    date_inscription DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_etudiant) REFERENCES etudiants(id) ON DELETE CASCADE,
    FOREIGN KEY (id_cours) REFERENCES cours(id) ON DELETE CASCADE,
    UNIQUE KEY unique_inscription (id_etudiant, id_cours)
);

CREATE TABLE IF NOT EXISTS notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_inscription INT,
    note DECIMAL(4,2) NOT NULL,
    type_note ENUM('écrit', 'oral', 'partiel') NOT NULL,
    coefficient INT DEFAULT 1,
    date_evaluation DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_inscription) REFERENCES inscriptions(id) ON DELETE CASCADE
);

-- Création des utilisateurs MySQL avec date de naissance comme mot de passe
CREATE USER IF NOT EXISTS 'laifa'@'%' IDENTIFIED BY '02/08/2002';
CREATE USER IF NOT EXISTS 'aymane'@'%' IDENTIFIED BY '01/01/2003';
CREATE USER IF NOT EXISTS 'nawel'@'%' IDENTIFIED BY '01/06/2003';
CREATE USER IF NOT EXISTS 'dalia'@'%' IDENTIFIED BY '06/22/2002';
CREATE USER IF NOT EXISTS 'quentin'@'%' IDENTIFIED BY '09/02/2000';
CREATE USER IF NOT EXISTS 'essi'@'%' IDENTIFIED BY '11/18/2001';
CREATE USER IF NOT EXISTS 'lucien'@'%' IDENTIFIED BY '12/22/2003';
CREATE USER IF NOT EXISTS 'ali'@'%' IDENTIFIED BY '12/29/2003';
CREATE USER IF NOT EXISTS 'aurelien'@'%' IDENTIFIED BY '08/08/2002';
CREATE USER IF NOT EXISTS 'ugo'@'%' IDENTIFIED BY '10/17/2001';
CREATE USER IF NOT EXISTS 'alpha'@'%' IDENTIFIED BY '08/20/2024';
CREATE USER IF NOT EXISTS 'mamadou'@'%' IDENTIFIED BY '05/08/2000';
CREATE USER IF NOT EXISTS 'gregoire'@'%' IDENTIFIED BY '12/05/2000';
CREATE USER IF NOT EXISTS 'mona'@'%' IDENTIFIED BY '12/16/2001';
CREATE USER IF NOT EXISTS 'noah'@'%' IDENTIFIED BY '08/06/2002';
CREATE USER IF NOT EXISTS 'laurentiu'@'%' IDENTIFIED BY '01/27/2002';
CREATE USER IF NOT EXISTS 'arnaud'@'%' IDENTIFIED BY '04/11/2002';
CREATE USER IF NOT EXISTS 'lenny'@'%' IDENTIFIED BY '01/07/2003';
CREATE USER IF NOT EXISTS 'zineb'@'%' IDENTIFIED BY '07/19/2002';
CREATE USER IF NOT EXISTS 'vasile-stefan'@'%' IDENTIFIED BY '02/08/2002';
CREATE USER IF NOT EXISTS 'lucie'@'%' IDENTIFIED BY '11/02/2003';
CREATE USER IF NOT EXISTS 'thomas'@'%' IDENTIFIED BY '09/20/1999';
CREATE USER IF NOT EXISTS 'erleta'@'%' IDENTIFIED BY '12/26/2003';
CREATE USER IF NOT EXISTS 'thihongnhung'@'%' IDENTIFIED BY '10/22/1999';
CREATE USER IF NOT EXISTS 'jeancy'@'%' IDENTIFIED BY '03/28/2002';
CREATE USER IF NOT EXISTS 'antoine'@'%' IDENTIFIED BY '01/10/2002';
CREATE USER IF NOT EXISTS 'marie'@'%' IDENTIFIED BY '12/01/2001';
CREATE USER IF NOT EXISTS 'sayqin'@'%' IDENTIFIED BY '09/02/2024';
CREATE USER IF NOT EXISTS 'eelai'@'%' IDENTIFIED BY '08/02/2003';
CREATE USER IF NOT EXISTS 'hugo'@'%' IDENTIFIED BY '05/26/2003';
CREATE USER IF NOT EXISTS 'edden'@'%' IDENTIFIED BY '09/22/1999';
CREATE USER IF NOT EXISTS 'theotime'@'%' IDENTIFIED BY '07/27/2003';
CREATE USER IF NOT EXISTS 'eric'@'%' IDENTIFIED BY '05/26/1998';
CREATE USER IF NOT EXISTS 'kevin'@'%' IDENTIFIED BY '18/02/1989';

-- Attribution des droits sur la base notation
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'laifa'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'aymane'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'nawel'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'dalia'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'quentin'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'essi'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'lucien'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'ali'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'aurelien'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'ugo'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'alpha'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'mamadou'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'gregoire'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'mona'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'noah'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'laurentiu'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'arnaud'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'lenny'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'zineb'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'vasile-stefan'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'lucie'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'thomas'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'erleta'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'thihongnhung'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'jeancy'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'antoine'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'marie'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'sayqin'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'eelai'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'hugo'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'edden'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'theotime'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'eric'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON notation.* TO 'kevin'@'%';

-- Insertion des étudiants avec leurs dates de naissance
INSERT INTO etudiants (prenom, nom) VALUES
('Kevin', 'Michoud');



-- Insertion des cours
INSERT INTO cours (nom_cours, description, ects) VALUES
('Politique économique', 'Analyse des politiques économiques, de lemploi et du marché du travail', 6),
('Innovation', 'Étude des processus dinnovation et facteurs de croissance économique', 6),
('Comportement', 'Analyse du comportement des agents économiques et systèmes dincitation', 6),
('Stratégie', 'Étude des interactions stratégiques entre agents et fonctionnement des marchés', 3),
('Econométrie I', 'Introduction aux méthodes quantitatives appliquées à léconomie', 6),
('ITI MAKERS', 'Projet pratique de développement et innovation numérique', 3),
('Tech prog I', 'Introduction aux langages de programmation et algorithmes fondamentaux', 3),
('Gestion projet', 'Méthodologies de gestion de projet et planification stratégique', 3),
('Econométrie II', 'Méthodes économétriques avancées et analyse de données', 6),
('Enjeux éco', 'Analyse des enjeux économiques contemporains et histoire de la pensée économique', 3),
('Tech prog II', 'Programmation avancée et développement dapplications', 3),
('Econométrie avancée', 'Méthodes destimation avancées et modélisation économétrique', 6),
('Data science', 'Introduction aux infrastructures de données et méthodes danalyse', 6),
('Anglais', 'Communication professionnelle et technique en anglais', 3);




-- Appliquer les privilèges
FLUSH PRIVILEGES;
