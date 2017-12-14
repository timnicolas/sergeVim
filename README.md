# sergeVim
SergeVim est une config vim faite pour 42 avec des outils pour mettre a la norme et un generateur de header.
Pour utiliser le header en dehors de 42 il faut modifier les variables PATH USER et MAIL (export USER=name) ou modifier le nom et le mail dans les parametres (`~/.vim/sergeVim/param.vim`).

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

Pour garder vos parametres il faut utiliser l'option `--param` quand vous mettez a jour. /!\ Certaines mise a jour peuvent ajouter des parametres. si sergeVim ne fonctionne plus correctement après une mise a jour vous pouvez essayer de reinitialiser vos parametres (`./update_vim.sh` sans `--param`) 
>`./update_vim.sh --param`


## Aide
Pour obtenir de l'aide tappez `,h` en mode normal ou `:SergeHelp` dans vim. Cela ouvrira un fichier d'aide dans un nouvel onglet avec tout les racourcis ajouté sur sergeVim.

## Des questions ?
Si vous avez des questions, des idées d'amélioration ou si vous trouvez des bugs contactez moi `tnicolas@student.42.fr`
Si vous etes a 42 vous pouvez me contacter sur slack: `tnicolas`
