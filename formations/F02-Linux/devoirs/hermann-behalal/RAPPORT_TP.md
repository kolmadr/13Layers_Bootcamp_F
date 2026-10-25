# F02 — Rapport des travaux pratiques Linux

**Étudiant :BEHALAL HERMANN** 
**Environnement Linux / version :3.6.10-710e5275.x86_64** 

Reportez les commandes exécutées **et leurs sorties utiles**. Répondez aux questions figurant à la fin de chaque TP dans `02_TRAVAUX_PRATIQUES.md`.

## TP1 — Navigation
Commandes :
```bash
cd ~
mkdir -p ~/13layers-f02/projets ~/13layers-f02/logs ~/13layers-f02/scripts
cd 13layers-f02
pwd
ls -la
```
Résultats :
/c/Users/dominique/13layers-f02
total 24
drwxr-xr-x 1 dominique 197121 0 Oct 25 12:40 ./
drwxr-xr-x 1 dominique 197121 0 Oct 25 12:40 ../
drwxr-xr-x 1 dominique 197121 0 Oct 25 12:40 logs/
drwxr-xr-x 1 dominique 197121 0 Oct 25 12:40 projets/
drwxr-xr-x 1 dominique 197121 0 Oct 25 12:40 scripts/

Questions / explication :
pwd:Affiche le chemin absolu du dossier dans lequel on se trouve actuellement.
ls-la: Liste le contenu du  dossier,y compris les fichiers caches(le -a),avec les details comme les droits et la taille(le -l)
mkdir -p: permet de creer un dossier,et surtout de creer tous les dossiers parents s'ils n'existent pas encore(ici,il cree 13layers-f02
et ses sous-dossiers d'un coup).
différence: un chemin absolu part de la racine(ex /c/Users/Dominique/...).un chemin relatif part de l'endroit ou on se trouve (ex:cd projets
si on est deja dans 13layers-f02).


## TP2 — Fichiers
Commandes :
```bash
echo -e "Ligne 1\nLigne 2\nLigne 3" > projets/notes.txt
cp projets/notes.txt logs/
mv logs/notes.txt logs/notes-archive.txt
cat logs/notes-archive.txt
ls projets/
```
Résultats :
Ligne 1
Ligne 2
Ligne 3
notes.txt

Questions / explication :
Difference entre cp et mv: la commande cp(copier) duplique le fichier.L'original reste a sa place.la commande mv(deplacer/renommer) deplace le fichier
vers un autre dossier ou lui donne un nouveau nom, et l'original disparait de son emplacement initial.
comment verifier que l'original existe toujours?:on utilise la commande ls suivie du chemin du dossier d'origine.Ici,ls projet/ affiche bien le fichier
notes.txt,ce qu'il prouve qu'il n'a pas ete supprime.

## TP3 — Recherche et redirections
Commandes :
```bash
echo -e "INFO:Demarrage du systeme\nERROR:Echec de connexion\nWARM:Espace disque faible\nINFO:Succes de l'operation\nERROR:Timeout du serveur" > logs/app.log
grep "ERROR" logs/app.log
grep "ERROR" logs/app.log | wc -l
echo  "Premiere ligne du test" > test.txt
echo  "Deuxieme ligne du test" >> test.txt
cat test.txt

```
Résultats :
ERROR:Echec de connexion
ERROR:Timeout du serveur
2
Premiere ligne du test
Deuxieme ligne du test

Questions / explication :
la pipe(|) permet de rediriger la sortie d'une commande vers l'entree d'une autre commande.Ici,il prend le resultat de grep(les lignes d'erreur) et l'envoie
a wc -l pour qu'il puisse les compter.
*>* ecrase le contenu du fichier,s'il n'existe pas,il le cree.Tandis que *>>* ajoute le texte a la fin du fichier(il ne supprime rien de ce qui etait deja
ecrit).

## TP4 — Permissions
Commandes :
```bash
echo 'echo "Bonjour 13Layers"' >scripts/demo.sh
ls -l scripts/demo.sh
chmod u+x scripts/demo.sh
ls -l scripts/demo.sh
./scripts/demo.sh

```
Résultats :
-rw-r--r-- 1 dominique 197121 24 Oct 25 14:37 scripts/demo.sh
-rwxr--r-- 1 dominique 197121 24 Oct 25 14:37 scripts/demo.sh
Bonjour 13Layers

Questions / explication :
r(read):le droit de lire le fichier
w(write):le droit de modifier le fichier
x(Execute):Le droit de lancer le fichier comme un programme.

chmod 777 donne tous les droits(lire,ecrire,executer) a absolument tout le monde(le proprietaire,le groupe,les autres utilisateurs).c'est une faille
de securite majeure car n'importe qui pourrait modifier ou detruire le fichier.

## TP5 — Diagnostic
Commandes :
```bash
whoami
uname -r
df -h
free -h
 ps aux | head
```
Résultats :
dominique
3.6.10-710e5275.x86_64

Filesystem            Size  Used Avail Use% Mounted on
C:/Program Files/Git  213G  112G  102G  53% /
D:                    253G   12G  242G   5% /d

bash: free: command not found

 PID    PPID    PGID     WINPID   TTY         UID    STIME COMMAND
      643       1     643      13240  ?         197609 12:36:06 /usr/bin/mintty
      818     644     818      16264  pty0      197609 15:01:26 /usr/bin/ps
      819     644     818       9740  pty0      197609 15:01:26 /usr/bin/head
      644     643     644       8692  pty0      197609 12:36:06 /usr/bin/bash


Questions / explication :

pour examiner le disque:on utilise 'df -h'.L'option '-h' rend les tailles lisibles(en Go).cela montre l'espace total,utilise et disponible.
pour examiner la memoire:on utilise normalement free '-h' sur un vrai systeme Linux.Sur mon environnement windows(Git Bash),la commande n'est pas
reconnue car c'est une limitation de l'emulateur.j'ai donc utilise systeminfo a la place pour trouver l'information.
pour examiner les processus:on utilise' ps aux'.cela liste tous les programmes en cours d'execution avec leur consommation(CPU,RAM). le | head
limite l'affichage aux 4 premieres lignes sur git bash.


## TP6 — Script Bash
Script fourni : `scripts/system_info.sh`
Commandes de test :
```bash
$ echo -e '#!/usr/bin/env bash\nset -euo pipefail\n\necho "Date:$(date)"\necho "Utilisateur:$(whoami)"\necho "Dossier courant: $(pwd)"\necho "Version du noyau: $(uname -r)"\necho "Espace disque:"\ndf -h /'> scripts/system_info.sh

 cat scripts/system_info.sh

chmod +x scripts/system_info.sh

 ./scripts/system_info.sh

```
Résultats :
#!/usr/bin/env bash
set -euo pipefail

echo "Date:$(date)"
echo "Utilisateur:$(whoami)"
echo "Dossier courant: $(pwd)"
echo "Version du noyau: $(uname -r)"
echo "Espace disque:"
df -h /

Date:Sun Oct 25 15:45:28     2026
Utilisateur:dominique
Dossier courant: /c/Users/dominique/13layers-f02
Version du noyau: 3.6.10-710e5275.x86_64
Espace disque:
Filesystem            Size  Used Avail Use% Mounted on
C:/Program Files/Git  213G  112G  102G  53% /

Questions / explication :
le shebang indique au systeme d'exploitation quel interpreteur utiliser pour executer le script.Ici,il dit au systeme d'utiliser l'interpreteur bash.
l'automatisation permet d'executer des tache repetitives sans intervention humaine.En devops,elle fait gagner du temps,evite les erreurs humaines
et garantit des configurations identiques sur tous les serveurs.
