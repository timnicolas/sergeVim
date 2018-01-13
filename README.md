# sergeVim
SergeVim est une config vim faite pour 42 avec des outils pour mettre a la norme et un generateur de header.
Pour utiliser le header en dehors de 42 il faut modifier les variables PATH USER et MAIL (export USER=name) ou modifier le nom et le mail dans les parametres (`:SergeSetting`).

![SergeVim](http://raw.githubusercontent.com/tarama78/sergeVim/img/SergeVim.png)

## Installation
SergeVim est très simple a installer:
Entrez la commande suivante dans le shell et attendez que sergeVim soit installé.
>`git clone https://github.com/tarama78/sergeVim && cd sergeVim && ./install.sh`

Pour desinstaller sergeVim:
>`./remove.sh`

Pour desinstaller et réinstaller sergeVim:
>`./re_install.sh`

## Mise a jour
SergeVim est sans cesse mis a jour. N'hesitez pas a mettre le mettre a jour en enttrant la commande ci dessous.
>`:SergeUpdate`

Pour que SergeUpdate fonctionne il ne faut pas deplacer ou supprimer le git clone.

/!\ Il existe une commande `:GitSergeUpdate` elle est utile pour mettre a jour sergeVim (uniquement si vous avez les droit pour push sur mon repository). Vous ne devez normalement pas l'utiliser.

## Parametre
Vous pouvez parametrer votre sergeVim en modifiant les variables du fichier `~/.vim/sergeVim/param.vim` que vous pouvez ouvrir en faisant `,s` en mode normal ou `:SergeSetting`. Lorsque vous mettez sergeVim a jour vos parametres seront par defaut ecrasés.

Pour garder vos parametres il faut utiliser l'option `setting` quand vous mettez a jour.
>`:SergeUpdate setting`

/!\ Certaines mise a jour peuvent ajouter des parametres. si sergeVim ne fonctionne plus correctement après une mise a jour vous pouvez essayer de reinitialiser vos parametres (`:SergeUpdate` sans `setting`) 

## Alias
SergeVim dispose aujourd'hui d'alias (par defaut dans `~/.zshrc`). Vous pouvez, dans les parametres (`:SergeSetting`) choisir les alias a activer ou a desactiver. Vous pouvez aussi cree vos propres alias. Si vous mettez un alias en commentaire dans votre fichier d'alias (par defaut `~/.zshrc`) il ne sera pas mis a jour par SergeVim.

Les alias se mettent a jour automatiquement lorsque vous mettez a jour sergeVim (`:SergeUpdate [setting]`). Vous pouvez aussi les mettre a jour avec la commande si dessous.
>`:SergeAlias`

Le fichier ou seront mis les alias peut être modifié dans les parametres (`:SergeSetting`).

## Aide
Pour obtenir de l'aide tappez `,h` en mode normal ou `:SergeHelp` dans vim. Cela ouvrira un fichier d'aide dans un nouvel onglet avec tout les racourcis ajouté sur sergeVim.

## Quelques commandes
### Navigation de fichier
SergeVim propose un systeme de navigation dans les fichiers. Pour l'utiliser vous devez soit executer la commande `vim_init_ctrO` ou `:SergeInitCtrlO`, soit ouvrir vos fichier depuis la racine du projet (`vim srcs/main.c`). Lorsque votre curseur est sur le nom d'une fonction tappez `<C-o>` et vim va chercher dans votre projet le fichier ou la fonction a été ecrite. pour retourner dans le fichier ou vous etiez avant tappez `<C-p>`.
### Header
#### 42Header
SergeVim propose differents header.
#### SergeVimHeader
Le Header de 42 est disponible `<F1>` ou `:Serge42Header`.
Il existe aussi un SergeVim header `<F2>` ou `:SergeHeader` /!\ ce header n'est pas a la norme pour les fichier C. Vous pouvez l'utiliser dans les Makefiles.
#### CowHeader
Vous pouvez utiliser le CowHeader `,<F2>` ou `:SergeCowHeader`. Ce header pour vos fichier `.c` indiques le nom de vos fonction et le nombre de lignes par fonctions (si il y as trop de fonction ou trop de lignes dans une fonction le CowHeader vous l'indique).
#### Mise a jour auto
Par defaut la mise a jour automatique des header (42Header et CowHeader) est desactive. vous pouvez les mettre a jour avec `,<F1>` ou `:SergeUpdateHeader`. Vous pouvez aussi activer la mise a jour auto en modifiant les parametres (voir `parametres`).
### Invertion de signes
SergeVim propose une commande pour inverser des signes (`<C-d>`). Disponible en mode normal ou insetion, elle permet de modifier le texte sous le curseur. Par exemple elle transphorme `>` en `<`, `int` en `unsigned int`, `if` en `else if`, `&&` en `||`, `SUCCESS` en `ERROR`, ...
### Fichier de test
Lorsque vous voulez faire un fichier de test tappez `testt<tab>` en mode normal et ca vous crée un fichier de test.
### Point virgule auto
Lorques vous êtes dans un fichier `.h` vous pouvez tapper `,;` et des `;` se mettrons automatiquement a la fin des prototypes de fonction qui n'en possede pas.

## Coloration syntax
SergeVim ameliore la coloration du texte notament en mettant les nom de fonctions en bleu, certains signes (`||`, `&&`, ...) en orange ...

## Des questions ?
Si vous avez des questions, des idées d'amélioration ou si vous trouvez des bugs contactez moi `tnicolas@student.42.fr`
Si vous etes a 42 vous pouvez me contacter sur slack: `tnicolas`
