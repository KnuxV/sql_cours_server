# Exercices SQL: Analyse d'une Base de Données de Prénoms

Ce document contient une série d'exercices SQL pour travailler avec une base de données de prénoms. Les corrections sont dans le fichier answers.sql




## Structure de la Base de Données

La table `prenoms` contient les colonnes suivantes:
- `Nombre`: Nombre d'occurrences du prénom pour l'année donnée
- `Sexe`: Le genre ('M' pour masculin, 'F' pour féminin)
- `Annee`: L'année de naissance
- `Prenoms`: Le prénom
- `Nombre total cumule par annee`: Total cumulé (sous forme de texte)

## Instructions de Configuration

Voici un schéma possible pour la table (attention, les types des variables peuvent changer entre SQLite, PostgreSQL et Mysql)

```sql
CREATE TABLE prenoms
(
    Nombre                          INTEGER,
    Sexe                            TEXT,
    Annee                           INTEGER,
    Prenoms                         TEXT,
    "Nombre total cumule par annee" TEXT
);
```

## 3 options de bases de données: SQLite, MySQL, PostgreSQL
- Pour importer vos données CSV avec SQLite

```
.separator "\t"
.import votre_fichier.csv prenoms
```

- Pour import dans MYSQL, vous pouvez utiliser l'outil de PHPMyAdmin (section `import`)
- Idem pour PostgreSQL



## Exercices Faciles

1. Renommez la dernière colonne en "Cumul"

   ```sql
   -- Renommez la dernière colonne "Cumul"
   ALTER TABLE table_name
   RENAME COLUMN old_name TO new_name;
   ```

   

2. Supprimez cette colonne car elle ne sert à rien!

   ```sqlite
   -- Supprimez la colonne Cumul
   ALTER TABLE table_name
   DELETE COLUMN column_name;
   ```

   

3. **Comptez le nombre total d'enregistrements dans la base de données**

   ```sql
   -- Complétez la requête pour compter le nombre total d'enregistrements
   SELECT ... FROM prenoms;
   ```

4. **Trouvez tous les prénoms uniques**

   ```sql
   -- Écrivez une requête qui liste tous les prénoms distincts
   DISTINCT
   -- Écrivez une requête qui compte tous les prénoms distincts
   
   ```

5. **Comptez le nombre de prénoms pour chaque genre**

   ```sql
   -- Écrivez une requête qui compte le total d'attribution pour les garçons et les filles
   ```

6. **Listez les 10 prénoms les plus populaires tous temps confondus**
   ```sql
   -- Trouvez les 10 prénoms avec le plus grand nombre d'occurrences
   ```

7. **Trouvez le nombre total de naissances par année**

   ```sql
   -- Calculez le nombre total de naissances pour chaque année
   ```

8. **Trouvez les prénoms commençant par 'A'**
   ```sql
   -- Listez tous les prénoms distincts qui commencent par la lettre 'A'
   ```

9. **Comptez le nombre de prénoms par initiale**
   ```sql
   -- Comptez combien de prénoms distincts commencent par chaque lettre de l'alphabet
   ```

10. **Trouvez les prénoms qui contiennent exactement 5 lettres**

   ```sql
   -- Recherchez les prénoms distincts dont la longueur est de 5 caractères
   ```

## Exercices Moyens

1. **Analysez la popularité des prénoms au fil du temps**
   ```sql
   -- Pour chaque décennie, trouvez les 3 prénoms les plus populaires
   ```

2. **Identifiez les prénoms qui sont devenus plus populaires**
   
   ```sql
   -- Trouvez les prénoms dont la popularité a augmenté d'au moins 50% entre 2010 et 2020
   ```
   
3. **Calculez le ratio garçons/filles par année**
   ```sql
   -- Pour chaque année, calculez le rapport entre le nombre de naissances de garçons et de filles
   ```

4. **Identifiez les prénoms unisexes**
   ```sql
   -- Trouvez les prénoms qui ont été utilisés à la fois pour les garçons et les filles
   ```

5. **Trouvez les prénoms les plus "stables" en popularité**
   ```sql
   -- Identifiez les prénoms qui ont maintenu une popularité relativement constante sur 10 ans
   ```

6. **Analysez la longueur des prénoms au fil du temps**
   ```sql
   -- Calculez la longueur moyenne des prénoms pour chaque décennie
   ```

7. **Trouvez les prénoms qui contiennent toutes les voyelles (a, e, i, o, u)**
   ```sql
   -- Identifiez les prénoms qui contiennent chacune des voyelles au moins une fois
   ```

8. **Identifiez les prénoms qui sont des palindromes**
   ```sql
   -- Trouvez les prénoms qui se lisent de la même façon à l'endroit et à l'envers
   ```
