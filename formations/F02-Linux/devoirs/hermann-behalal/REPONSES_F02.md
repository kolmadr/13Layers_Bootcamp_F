# F02 — Réponses au questionnaire Linux

**Étudiant :BEHALAL HERMANN** 
**GitHub :https://github.com/kolmadr** 
**Branche :** `Bootcamp_F02__hermann_behalal`

Répondez aux 10 questions du fichier [01_CATALOGUE_QUESTIONS.md](../../01_CATALOGUE_QUESTIONS.md) **dans vos propres mots**.

## Question 1 — Linux
Réponse :
Linux est un systeme d'exploitation open-source base sur Unix.
le noyau est le coeur gerant le materiel.
la distribution est un ensemble forme du noyau,des logiciels, et un gestionnaire de paquets.
le terminal est l'interface en ligne de commande pour interagir avec le systeme.
## Question 2 — Système de fichiers
Réponse :
'/':Le repertoire racine.
'/home':le dossier qui contient les repertoires personnels des utilisateurs.
'/etc':est un dossier contenant les fichiers de configurations du systeme.
'/var/log':le dossier qui contient les fichiers de journaux(logs) du systeme et des applications
'/tmp':Le dossier reserve aux fichiers temporaires.

## Question 3 — Navigation
Réponse :
'pwd':Affiche le chemin absolu du repertoire courant.(Ex:pwd renvoie /home/user)
'ls -la': liste le contenu d'un repertoire,y compris les fichiers caches(-a),avec les details(permissions,taille,proprietaire:-l).(Ex: ls -la /etc)
'cd..':Remonte dans le repetoire parent.(Ex:si on est dans /home/user,cela nous amene dans /home)
'cd ~':ramene l'utilisateur directement dans son repertoire personnel(dossier home).(Ex: cd ~/Documents)


## Question 4 — Manipulation de fichiers
Réponse :
'touch':cree un fichier vide s'il n'existe pas,ou met a jour sa date de modification s'il existe.
'mkdir -p':cree un repertoire et cree les dossiers parents si necessaire. 
'cp':copie un fichier ou un dossier.
'mv':deplace un fichier/dossier ou le renomme.
'rm':supprime definitivement un fichier ou un dossier.
precaution avec rm: il n'ya pas de corbeille ,la suppression est irreversible.

## Question 5 — Lecture de fichiers
Réponse :
'cat':Affiche l'integralite du contenu d'un fichier d'un coup.A utliser pour les petits fichiers
'less': Affiche le fichier page par page,permet de faire defiler et de chercher.A utiliser pour les gros fichiers.
'head': Affiche le debut d'un fichier(les 10 premiers lignes par defaut).Utile pour verifier l'en-tete d'un fichier.
'tail -n 10': Affiche les 10 dernieres lignes d'un fichier.Ideal pour lire la fin d'un journal d'erreurs(log) recent.

## Question 6 — Recherche et redirections
Réponse :
'grep':Recherche une chaine de caracteres specifiques dans le contenu d'un fichier.
'|(pipe)':redirige le resultat de la commande de gauche vers l'entree de la commande de droite. 
'>':redirige le resultat vers un fichier  en ecrasant son contenu.
'>>':redirige le resultat vers le fichier en ajoutant a la fin(sans ecraser).
commande pour compter les lignes contenant 'ERROR': grep -c 'ERROR' nom_du_fichier.log

## Question 7 — Permissions
Réponse :
-'r(read)':Droit de lecture.'w(write)':Droit de modification/ecriture. 'x(execute)':Droit d'execution (pour un script ou un programme).
-proprietaire/Groupre:Le proprietaire est l'utilisateur qui possede le fichier.Le groupe est un ensemble d'utilisateurs qui partagent des droits
sur ce fichier.
-'chmod u+x script.sh':Ajoute le droit d'execution(x) au proprietaire(user) du fichier script.sh.
-pourquoi eviter chmod 777:cela donne tous les droits a absolument tout le monde.c'est une faille de securite majeure.

## Question 8 — Utilisateurs
Réponse :
Differences:l'utilisateur normal a des droits limites sur le systeme.Root est le super-administrateur,il a tous les droits absolus.sudo
est une commande qui permet a un utilisateur normal d'executer une action temporaire avec les droits de root.

Moindre privilege: Principe consistant a donner a un utilisateur uniquement les droits limites a son activite.
cela limite les degats en cas d'erreur humaine ou de pirage.

## Question 9 — Surveillance système
Réponse :
'ps aux':liste tous les processus en cours d'execution sur la machine,avec leurs details(utilisateur,PID,%CPU...).
'top':Affiche en temps reel l'activite du systeme(processus consommant le plus de CPU et de RAM,charge moyenne). 
'df -h':Affiche l'espace disque utilise et disponible sur les differents systemes de fichiers.
'free -h':Affiche l'etat de la memoire vive.
'uname -r':Affiche la version du noyau linux en cours d'utilisation.


## Question 10 — Bash et DevOps
Réponse :
-script bash:un fichier texte contenant une serie de commandes Linux qui sont executees sequentiellement par l'interpreteur Bash.
-shebang #!/usr/bin/env bash:c'est la premiere ligne du script.Elle indique au systeme d'exploitation quel interpreteur utiliser

-Deux taches devops automatisables:
1.les sauvegardes(backups) automatiques de bases de donnees.
2.le deploiement d'applications(mise a jour du code,redemarrage des services).
