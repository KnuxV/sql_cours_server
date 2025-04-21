## Connexion aux bases de données de l'Université

Pour accéder à votre propre base de données sur les serveurs de l'unistra:
[Suivez les instructions ici](https://documentation.unistra.fr/DNUM/Pedagogie/MAI_VIE/co/connexionApplicationBdD.html)

On vous donne accès à 3 bases: Mysql, Postgresql et Oracle

1. Créer un compte
2. Récupérer l'identifiant et le mot de passe
3. Utilisez une interface web pour interéagir avec les bases:
   - [PHPMyAdmin]( https://osr-adminbase.unistra.fr/mysql) pour gestion des bases de données Mysql 
   - [PHPPGAdmin](https://osr-adminbase.unistra.fr/postgresql) pour les bases de données Postgresql
4. Ou Utilisez un outil comme datagrip, DBBeaver, ou Vscode (en local), [MySQLWorkbench](https://www.mysql.com/products/workbench/)
   - Dans ce cas créez une nouvelle connection :
   - L'addresse IP ou host sera `osr-mysql.unistra.fr` ou `osr-postgresql.unistra.fr`
   - Le port sera respectivement 3306 pour MySQL ou 5432 pour PostgreSQL
   - Utilisateur : votre login BDD
   - Mot de passe : votre mot de passe BDD
   - Base de données : votre login BDD (par défaut)

