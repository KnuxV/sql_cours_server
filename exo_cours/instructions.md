## Instructions exo cours // correction exam

Connectez-vous sur mon server unistra:

1. Par accès direct via une connexion (vscode en local avec un plugin, Datagrip, DBeaver etc.)
- Host: beta-seed.unistra.fr
- Port: 3306
- DBMS: mariadb
- username: votre prénom
- password: votre date de naissance
- nom de la database: notation

2. Par accès "web" avec PHP: 
- URL: [https://beta-seed.unistra.fr/phpmyadmin/](https://beta-seed.unistra.fr/phpmyadmin/)
- username: votre prénom
- password: votre date de naissance

3. En utilisant python et une librairie de connexion SQL comme mariadb (https://mariadb.com/resources/blog/how-to-connect-python-programs-to-mariadb/)
   - Voir le jupyter notebook [demo_sql_alchemy.ipynb](demo_sql_alchemy.ipynb) qui est dans le même dossier

4. Une fois que vous êtes connecté, il s'agit de :
   1. Vous inscrire en tant qu'étudiant
   2. Vous inscrire à plusieurs cours
   3. Ajouter des notes à ces cours
   4. Modifier (update) les notes d'un ou plusieurs de vos collègues
   5. Créer un utilisateur factice, l'inscrire à des cours, et lui ajouter des notes, puis supprimer l'étudiant pour voir ce qu'il se passe.

5. Vous pouvez aussi inscrire votre projet dans la table projet, tout seul, à deux ou à trois.

6. Une fois que vous êtes à l'aise avec les INSERT, UPDATE and DELETE: 
   - connectez-vous sur ce site [https://beta-seed.unistra.fr/flask-sql/login](https://beta-seed.unistra.fr/flask-sql/login).
   - Naviguez sur les différentes pages, tout ce qui est affiché vient de la base de données, donc les modifications se répercutent d'un côté comme de l'autre.
   