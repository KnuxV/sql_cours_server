## Autres Solutions SQL Mainstream

## Oracle Database

### Perspective pratique

- Oracle Database est fréquemment rencontré dans les grandes entreprises, notamment dans les secteurs bancaire, financier et industriel.
- Vous pourriez travailler avec Oracle lorsque vous rejoignez une grande organisation ou consultez pour des clients d'entreprise.
- Les outils comme Oracle SQL Developer ou SQL*Plus seront votre interface principale pour interroger ces bases de données.

### Différences clés pour les requêtes

- **Types de données** : Oracle utilise `VARCHAR2` au lieu de `VARCHAR`, `NUMBER` au lieu de `INT`/`FLOAT`, et `DATE` stocke à la fois la date et l'heure.
- **Fonctions de date** : Oracle utilise `TO_DATE`, `TO_CHAR` au lieu des fonctions vues dans SQLite ou MySQL.
- **Pagination différente** : Limite des résultats avec `ROWNUM` au lieu de `LIMIT`.

```sql
-- Requête avec limitation des résultats (équivalent de LIMIT)
SELECT * FROM ventes WHERE ROWNUM <= 10;

-- Format de date
SELECT TO_CHAR(date_vente, 'YYYY-MM-DD') FROM ventes;

-- Jointure avec syntaxe Oracle (ancienne syntaxe encore fréquente)
SELECT e.nom, d.nom_departement
FROM employes e, departements d
WHERE e.dept_id = d.dept_id;
```

### Impact sur votre travail quotidien

- Les requêtes analytiques complexes peuvent être plus performantes et offrir plus d'options.
- Oracle propose des fonctions analytiques avancées intégrées (OLAP).
- Vous pourriez rencontrer PL/SQL, le langage procédural d'Oracle, dans des procédures stockées que vous devrez appeler.

### Coûts approximatifs

- **Licence Standard Edition 2** : ~15 000€ par processeur
- **Licence Enterprise Edition** : ~40 000€ par processeur
- **Support annuel** : ~22% du coût de licence
- Des options spécifiques (RAC, Partitioning, etc.) peuvent significativement augmenter le coût

## Microsoft SQL Server

### Perspective pratique

- Probablement la solution que vous rencontrerez le plus souvent dans les entreprises utilisant les technologies Microsoft.
- Très répandu dans les services financiers, l'assurance, la santé, et le retail.
- L'interface principale sera SQL Server Management Studio (SSMS) ou Azure Data Studio.

### Différences clés pour les requêtes

- **T-SQL** : La version Microsoft du SQL avec ses propres particularités.
- **Fonctions de date** : Utilise `GETDATE()` au lieu de `NOW()` ou `CURRENT_TIMESTAMP`.
- **Concaténation** : Utilise `+` au lieu de `||` pour concaténer des chaînes.

```sql
-- Concaténation dans SQL Server
SELECT prenom + ' ' + nom AS nom_complet FROM employes;

-- Date actuelle
SELECT GETDATE();

-- Top N au lieu de LIMIT
SELECT TOP 10 * FROM ventes ORDER BY montant DESC;
```

### Intégration avec l'écosystème d'analyse

- Excel s'intègre nativement avec SQL Server.
- Power BI se connecte directement à SQL Server avec des performances optimisées.
- SSRS (Reporting Services) permet de créer des rapports sur vos analyses SQL.

### Coûts approximatifs

- **Express Edition** : Gratuit (limité à 10GB par base, 1 processeur, 1GB RAM)
- **Standard Edition** : ~3 500€ par cœur (minimum 4 cœurs)
- **Enterprise Edition** : ~12 000€ par cœur
- **Modèle cloud (Azure SQL)** : À partir de ~75€/mois selon la configuration

## IBM Db2 et SAP HANA

### Contextes de rencontre

- **IBM Db2** : Principalement dans les grandes entreprises avec des systèmes historiques, particulièrement dans la banque, l'assurance et les services gouvernementaux.
- **SAP HANA** : Dans les entreprises utilisant les solutions SAP pour la gestion (ERP, CRM, etc.).

### Ce qui change pour vos requêtes

- Ces systèmes sont optimisés pour des volumes de données massifs.
- Les requêtes analytiques peuvent être nettement plus rapides qu'avec SQLite.
- Des fonctions analytiques et statistiques avancées sont disponibles nativement.

```sql
-- Exemple de fonction d'analyse dans Db2
SELECT STDDEV(montant_vente) FROM ventes;

-- Exemple de requête analytique dans SAP HANA
SELECT 
    categorie,
    SUM(montant) AS total,
    SUM(montant) / SUM(SUM(montant)) OVER () AS pourcentage
FROM ventes
GROUP BY categorie;
```

### Coûts approximatifs

- **IBM Db2** :
    - Edition standard : ~5 000€ par cœur
    - Edition avancée : ~12 000€ par cœur
    - Cloud (Db2 on Cloud) : À partir de ~150€/mois

- **SAP HANA** :
    - Parmi les plus coûteuses des bases de données
    - Licences basées sur la mémoire utilisée : ~100 000€ pour 64GB
    - Souvent inclus dans les contrats globaux SAP

## Comparaison simplifiée des solutions SQL

| Caractéristique | SQLite | MySQL | PostgreSQL | Oracle | SQL Server | 
|----------------|--------|-------|------------|--------|------------|
| **Où vous le rencontrerez** | Petites applications | Startups, Web | Entreprises tech | Grandes entreprises, Finance | Entreprises Microsoft |
| **Coût approximatif** | Gratuit | Gratuit - 3K€ | Gratuit | 15K€ - 40K€+ | Gratuit - 12K€+ |
| **Outils d'accès** | DB Browser | MySQLWorkbench | pgAdmin | SQL Developer | SSMS, Power BI |
| **Particularités** | Simple, portable | Simple, rapide | Riche en fonctions | Puissant mais verbeux | Intégration Microsoft |
| **Fonctions analytiques** | Basiques | Moyennes | Bonnes | Excellentes | Très bonnes |
| **Performances sur gros volumes** | Faibles | Moyennes | Bonnes | Excellentes | Très bonnes |

## Ce que vous devez retenir

1. **Syntaxe variable** : Chaque système a ses particularités syntaxiques, notamment pour:
    - Fonctions de date et d'heure
    - Pagination et limitation des résultats
    - Fonctions d'agrégation et analytiques

2. **Performances** : Les bases de données d'entreprise comme Oracle, SQL Server et SAP HANA sont optimisées pour:
    - Gérer des milliards de lignes
    - Exécuter des requêtes analytiques complexes
    - Maintenir les performances avec de nombreux utilisateurs simultanés

3. **Outils d'accès** : Vous utiliserez rarement la ligne de commande, mais plutôt:
    - Des outils spécifiques à chaque SGBD (SQL Developer, SSMS)
    - Des outils d'analyse (Tableau, Power BI) connectés à ces bases
    - Des environnements de notebooks (Jupyter) via des connecteurs SQL

4. **Préparation** : Pour vous adapter à ces différents environnements:
    - Apprenez les particularités syntaxiques de chaque système
    - Familiarisez-vous avec les outils d'accès principaux
    - Comprenez les fonctions analytiques spécifiques disponibles dans chaque système

La bonne nouvelle est que les concepts fondamentaux que vous avez appris avec SQLite restent valables - seuls certains détails changent d'un système à l'autre.