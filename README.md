# sergeVim
SergeVim est une config vim faite pour 42 avec des outils pour mettre à la norme et un générateur de header.
Pour utiliser le header en dehors de 42 il faut modifier les variables PATH USER et MAIL (export USER=name) ou modifier le nom et le mail dans les paramètres (`:SergeSetting`).

![Serge Vim](https://github.com/tarama78/sergeVim/raw/master/img/SergeVim.png)

## Installation
SergeVim est très simple à installer:
Entrez la commande suivante dans le shell et attendez que sergeVim soit installé.
>`git clone https://github.com/tarama78/sergeVim && cd sergeVim && ./install.sh`

Pour désinstaller sergeVim:
>`./remove.sh`

Pour désinstaller et réinstaller sergeVim:
>`./re_install.sh`

## Mise a jour
SergeVim est sans cesse mis à jour. N'hésitez pas à le mettre à jour en entrant la commande ci-dessous.
>`:SergeUpdate`

Pour que SergeUpdate fonctionne, il ne faut ni déplacer ni supprimer le git clone.

/!\ N'utilisez pas la commande `:GitSergeUpdate` elle n'est utile que pour mettre à jour sergeVim (uniquement si vous avez les droits pour push sur mon repository).

## Paramètres
Vous pouvez paramètrer votre sergeVim en modifiant les variables du fichier `~/.vim/sergeVim/param.vim` que vous pouvez ouvrir en faisant `,s` en mode normal ou `:SergeSetting`. /!\ Lorsque vous mettrez sergeVim à jour, vos paramètres seront par défaut écrasés.

Pour sauvegarder vos paramètres il faut utiliser l'option `setting` quand vous mettez à jour.
>`:SergeUpdate setting`

/!\ Certaines mises à jour peuvent ajouter des paramètres. Si sergeVim ne fonctionne plus correctement après une mise a jour, vous pouvez essayer de réinitialiser vos paramètres (`:SergeUpdate` sans `setting`) 

## Alias
SergeVim dispose aujourd'hui d'alias (par défaut dans `~/.zshrc`). Vous pouvez, dans les paramètres (`:SergeSetting`) choisir les alias à activer ou à désactiver. Vous pouvez aussi créer vos propres alias. Si vous mettez un alias en commentaire dans votre fichier d'alias (par défaut `~/.zshrc`), il ne sera pas mis à jour par SergeVim.

Les alias se mettent à jour automatiquement lorsque vous mettez à jour sergeVim (`:SergeUpdate [setting]`). Vous pouvez aussi les mettre à jour avec la commande ci-dessous.
>`:SergeAlias`

Le fichier dans lequel seront mis les alias peut être modifié dans les paramètres (`:SergeSetting`).

## Aide
Pour obtenir de l'aide tapez `,h` en mode normal ou `:SergeHelp` dans vim. Cela ouvrira un fichier d'aide dans un nouvel onglet avec tous les racourcis ajoutés sur sergeVim.
>https://github.com/tarama78/sergeVim/blob/master/sergeVim/sergeVim_help.vim

## Quelques commandes
### Navigation de fichier
SergeVim propose un système de navigation dans les fichiers. Pour l'utiliser vous devez soit exécuter la commande `vim_init_ctrlO` ou la commande `:SergeInitCtrlO`, soit ouvrir vos fichiers depuis la racine du projet (`vim srcs/main.c`). Lorsque votre curseur est sur le nom d'une fonction tapez `<C-o>` et vim va chercher dans votre projet le fichier dans lequel la fonction a été écrite. Pour retourner dans le fichier dans lequel vous étiez avant, tapez `<C-p>`.
### Header
SergeVim propose différents header.
#### 42Header
Le Header de 42 est disponible `<F1>` ou `:Serge42Header`.

![42 header](https://github.com/tarama78/sergeVim/raw/master/img/42Header.png)
#### SergeVimHeader
Il existe aussi un SergeVim header `<F2>` ou `:SergeHeader`. /!\ Ce header n'est pas à la norme pour les fichier C. Vous pouvez l'utiliser dans les Makefiles.

![Serge Vim Header](https://github.com/tarama78/sergeVim/raw/master/img/SergeVimHeader.png)
#### CowHeader
Vous pouvez utiliser le CowHeader `,<F2>` ou `:SergeCowHeader`. Ce header pour vos fichiers `.c` indique le nom de vos fonctions et le nombre de lignes par fonctions (s'il y a trop de fonctions ou trop de lignes dans une fonction, le CowHeader vous l'indique).

![Cow Header](https://github.com/tarama78/sergeVim/raw/master/img/SergeCowHeader.png)
#### Mise à jour auto
Par défaut la mise à jour automatique des header (42Header et CowHeader) est désactivée. Vous pouvez les mettre à jour avec `,<F1>` ou `:SergeUpdateHeader`. Vous pouvez aussi activer la mise à jour auto en modifiant les paramètres (voir `Paramètres` ci-dessus).

![Auto Update](https://github.com/tarama78/sergeVim/raw/master/img/autoUpdate.png)
### Inversion de signes
SergeVim propose une commande pour inverser des signes (`<C-d>`). Disponible en mode normal ou insertion, elle permet de modifier le texte sous le curseur. Par exemple elle transforme `>` en `<`, `int` en `unsigned int`, `if` en `else if`, `&&` en `||`, `SUCCESS` en `ERROR`, ...
### Fichier de test
Lorsque vous voulez faire un fichier de test, tapez `testt<tab>` en mode insertion.

![Auto Update](https://github.com/tarama78/sergeVim/raw/master/img/testt.png)
### Point virgule auto
Lorsque vous êtes dans un fichier `.h` vous pouvez taper `,;` et des `;` se mettront automatiquement à la fin des prototypes de fonction qui n'en possèdent pas.

## Coloration syntax
SergeVim améliore la coloration syntaxique, notamment en mettant les noms de fonctions en bleu, certains signes (`||`, `&&`, ...) en orange, ...

## Des questions ?
Si vous avez des questions, des idées d'amélioration ou si vous trouvez des bugs, contactez-moi `tnicolas@student.42.fr`.
Si vous êtes à 42, vous pouvez me contacter sur slack: `tnicolas`.
