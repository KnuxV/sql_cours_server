-- Renommez la dernière colonne "Cumul"
ALTER TABLE prenoms
RENAME COLUMN "Nombre total cumule par annee" TO "Cumul";

Supprimez cette colonne car elle ne sert à rien!
ALTER TABLE prenoms
DROP COLUMN "Cumul";

-- Complétez la requête pour compter le nombre total d'enregistrements
SELECT COUNT(*) FROM prenoms;

-- Écrivez une requête qui compte tous les prénoms distincts
SELECT COUNT(prenoms.Prenoms), COUNT(DISTINCT(prenoms.Prenoms)) from prenoms;

-- Écrivez une requête qui compte le total d'attribution pour les garçons et les filles
SELECT Sexe, COUNT(*) as total from prenoms
group by Sexe;

-- Trouvez les 10 prénoms avec le plus grand nombre d'occurrences
SELECT Prenoms, COUNT(*) as total from prenoms
group by Prenoms
ORDER BY total DESC;

-- Calculez le nombre total de naissances pour chaque année
SELECT prenoms.Annee, SUM(prenoms.Nombre) as total
from prenoms
group by Annee
order by total desc ;

-- Listez tous les prénoms distincts qui commencent par la lettre 'A'
SELECT DISTINCT(prenoms.Prenoms) from prenoms
WHERE substring(Prenoms, 1, 1) = 'A';

-- Comptez combien de prénoms distincts commencent par chaque lettre de l'alphabet
SELECT substring(Prenoms, 1, 1) as initial, COUNT(DISTINCT prenoms.Prenoms) as total_prenom from prenoms
GROUP BY substring(Prenoms, 1, 1);

-- Recherchez les prénoms distincts dont la longueur est de 5 caractères
SELECT * from prenoms
WHERE length(Prenoms) = 5;

-- Pour chaque décennie, trouvez les 3 prénoms les plus populaires
SELECT
    -- Cette expression CASE divise les années en décennies
    CASE
        WHEN prenoms.Annee >= 2020 THEN '2020s'
        WHEN prenoms.Annee >= 2010 THEN '2010s'
        WHEN prenoms.Annee >= 2000 THEN '2000s'
        ELSE 'Avant 2000'
    END as decennie,
    -- Nom du prénom
    prenoms.Prenoms,
    -- Calcule le nombre total d'occurrences de chaque prénom par décennie
    SUM(prenoms.Nombre) as total_per_decennie,

    -- Cette fonction de fenêtrage (ROW_NUMBER) attribue un classement aux prénoms
    -- dans chaque décennie, basé sur leur popularité
    -- PARTITION BY divise les données en groupes (ici par décennie)
    -- ORDER BY détermine comment les rangs sont attribués (ici par popularité décroissante)
    ROW_NUMBER() OVER (PARTITION BY
        CASE
            WHEN prenoms.Annee >= 2020 THEN '2020s'
            WHEN prenoms.Annee >= 2010 THEN '2010s'
            WHEN prenoms.Annee >= 2000 THEN '2000s'
            ELSE 'Avant 2000'
        END ORDER BY SUM(prenoms.Nombre) DESC
    ) as rang
from prenoms
-- Regroupe les données par décennie et prénom pour les agréger
GROUP BY decennie, Prenoms
-- Trie les résultats par rang croissant (les plus populaires d'abord)
-- et limite à 9 résultats (ce qui donne les 3 premiers prénoms de 3 décennies)
ORDER BY rang ASC
LIMIT 9;


-- Trouvez les prénoms dont la popularité a augmenté d'au moins 50% entre 2012 et 2020
WITH comp AS (
SELECT prenoms.Prenoms,
       SUM(prenoms.Nombre) filter ( where prenoms.Annee='2012' ) '2012',
       SUM(prenoms.Nombre) filter ( where prenoms.Annee='2020' ) '2020'
FROM prenoms
GROUP BY prenoms.Prenoms
having "2012" IS NOT NULL and "2020" IS NOT NULL)
SELECT
    Prenoms,
    ("2020" * 1.0 / "2012") - 1 as incr_ratio,  -- Multiplie par 1.0 pour forcer une division décimale
    "2012",
    "2020"
FROM comp
WHERE incr_ratio > 0.5
ORDER BY incr_ratio DESC;

-- Pour chaque année, calculez le rapport entre le nombre de naissances de garçons et de filles
SELECT prenoms.Annee,
       SUM(Nombre) filter ( where Sexe='F' ) as F,
       SUM(Nombre) filter ( where Sexe='M' ) as M,
       ROUND(
               SUM(Nombre) filter ( where Sexe='M' )* 1.0 /
               SUM(Nombre) filter ( where Sexe='F' )
           ,2) as ratio_M_F
FROM prenoms
GROUP BY prenoms.Annee;

-- Trouvez les prénoms qui ont été utilisés à la fois pour les garçons et les filles
SELECT prenoms.Prenoms, COUNT(DISTINCT (Sexe))
from prenoms
group by prenoms.Prenoms
HAVING COUNT(DISTINCT Sexe) > 1
ORDER BY COUNT(DISTINCT (Sexe)) DESC ;


-- Calculez la longueur moyenne des prénoms pour chaque décennie
SELECT
    -- Cette expression CASE divise les années en décennies
    CASE
        WHEN prenoms.Annee >= 2020 THEN '2020s'
        WHEN prenoms.Annee >= 2010 THEN '2010s'
        WHEN prenoms.Annee >= 2000 THEN '2000s'
        ELSE 'Avant 2000'
    END as decennie,
    AVG(length(prenoms.Prenoms)) as longueur_prenom
from prenoms
group by decennie;

-- Identifiez les prénoms qui contiennent chacune des voyelles au moins une fois
SELECT DISTINCT (prenoms.Prenoms)
from prenoms
WHERE Prenoms LIKE '%a%' AND
      Prenoms LIKE '%e%' AND
      Prenoms LIKE '%i%' AND
      Prenoms LIKE '%o%' AND
      Prenoms LIKE '%u%';

-- Trouvez les prénoms qui se lisent de la même façon à l'endroit et à l'envers
SELECT DISTINCT(prenoms.Prenoms)
from prenoms
where reverse(lower(Prenoms)) = lower(Prenoms);