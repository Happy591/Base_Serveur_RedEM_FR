<a name="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<br />
<div align="center">
  <a href="https://github.com/Happy591/Base_Serveur_RedEM_FR">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Base Serveur RedEM FR</h3>

  <p align="center">
    Base de serveur qui utilise le Framework RedEM.
    <br />
    <a href="https://sinatra.gitbook.io/redemrp/installation"><strong>Voir la docs</strong></a>
    <br />
    <br />
    <a href="https://x">Tebex</a>
    ·
    <a href="https://discord.gg/FKH4uwb">Discord</a>
    ·
    <a href="https://github.com/Happy591/Base_Serveur_RedEM_FR/issues">Signaler un Bug</a>
  </p>
</div>

<details>
  <summary>Sommaire</summary>
  <ol>
    <li>
      <a href="#a-propros-de-la-base-">A propros de la base</a>
      <ul>
        <li><a href="#languages-et-environnement-de-d%C3%A9velopement-utilis%C3%A9-">Languages et Environnement de dévelopement utilisé</a></li>
      </ul>
    </li>
    <li>
      <a href="#installation-">Installation</a>
      <ul>
        <li><a href="#pr%C3%A9-requis-">Pré-requis</a></li>
        <li><a href="#t%C3%A9l%C3%A9chargement-">Téléchargement</a></li>
        <li><a href="#extension-de-vs-code-">Extension de VS Code</a></li>
        <li><a href="#cr%C3%A9er-son-projet-git-">Créer son projet Git</a></li>
        <li><a href="#par-feu--port-">Par-feu & Port</a></li>
        <li><a href="#key-">Key</a></li>
        <li><a href="#modification-de-servercfg-">Modification de server.cfg</a></li>
        <li><a href="#base-de-donn%C3%A9e-">Base de Donnée</a></li>
        <li><a href="#ex%C3%A9cutable-">Exécutable</a></li>
      </ul>
    </li>
    <li><a href="#tutoriel-video-">Tutoriel Vidéo</a></li>
    <li><a href="#contribution-">Contribution</a></li>
    <li><a href="#license-">License</a></li>
    <li><a href="#support-">Support</a></li>
  </ol>
</details>

## A propros de la Base :
[![Product Name Screen Shot][product-screenshot]](https://github.com/orgs/RedEM-RP/repositories)

Cette base n'est pas une ressource officielle. Elle devra être également être mis à jour par vos soins lors de nouvelles mise à jour du Framework RedEM. Vous devez également apporter certaines modifications aux fichiers indiquer pour pouvoir lancer votre serveur.

<p align="right">(<a href="#readme-top">Haut de page</a>)</p>

### Languages et Environnement de dévelopement utilisé :

Nous utilisons nos propres machine pour déveloper avec Visual Studio Code, ainsi qu'une machine virtuelle sous windows 11 qui héberge la base de données avec le serveur.

* [Lua](https://www.lua.org/)
* [Javascript](https://www.javascript.com/)
* [Node](https://nodejs.org/en/)
* [Vespura](https://vespura.com/doc/natives/)
* [Heidisql](https://www.heidisql.com/)

<p align="right">(<a href="#readme-top">Haut de page</a>)</p>

## Installation :

La procédure qui permet de déveloper son propre serveur peut-être compliqué au premier abord, mais si vous suivez à la lettre les indications qui seront énoncer ci-dessous, vous obtiendrez en un rien de temps la base qui vous permettra de commencer.

<p align="right">(<a href="#readme-top">Haut de page</a>)</p>

### Pré-requis :

Il est `INDISPENSABLE` d'avoir les éléments suivant avant toute chose, sans quoi votre procédure d'installation sera vouée à l'échec.
* Avoir <a href="https://www.rockstargames.com/fr/games/reddeadredemption2">Red Dead Redmemption 2 </a>ou <a href="https://www.rockstargames.com/fr/reddeadonline">Red Dead Online</a>
* Être connecté sur <a href="https://store.steampowered.com/?l=french">Steam</a>
* Être connecté sur le <a href="https://socialclub.rockstargames.com/rockstar-games-launcher">Rockstar Games Launcher</a>
* Créer un compte sur <a href="https://github.com/">GitHub</a>

<p align="right">(<a href="#readme-top">Haut de page</a>)</p>

### Téléchargement :

Les téléchargements ci-dessous ne sont pas tous obligatoires, mais vous aideront grandement pour déveloper votre projet.
* <a href="https://code.visualstudio.com/Download">Visual Code Studio</a> ou tout autre éditeur de code
* <a href="https://desktop.github.com/">GitHub</a> qui vous facilitera la vie lors des commits
* <a href="https://www.apachefriends.org/">XAMPP</a> pour ne pas à installer vous même apache et sql sur votre pc (pas besoin si vous n'héberger pas le serveur)
* <a href="https://www.heidisql.com/download.php">HEIDI SQL</a> ou tout autre éditeur de sql, pour gérer votre base de donnée mysql (pas besoin si vous n'héberger pas le serveur)

<p align="right">(<a href="#readme-top">Haut de page</a>)</p>

### Extension de VS Code :

Encore une fois, il n'est pas obligatoire d'installer ses extensions basiques, mais elles vous permettront de coder plus facilement.
* <a href="https://marketplace.visualstudio.com/items?itemName=sumneko.lua">Lua</a>
* <a href="https://marketplace.visualstudio.com/items?itemName=UnderworldServers.redm-vscode">Redm Natives</a>
* <a href="https://marketplace.visualstudio.com/items?itemName=bierner.markdown-preview-github-styles">Markdown Preview</a>
* <a href="https://marketplace.visualstudio.com/items?itemName=ecmel.vscode-html-css">HTML CSS Support</a>
* <a href="https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode">Prettier</a>
* <a href="https://marketplace.visualstudio.com/items?itemName=pranaygp.vscode-css-peek">CSS Peek</a>
* <a href="https://marketplace.visualstudio.com/items?itemName=TabNine.tabnine-vscode">Tabnine AI</a>

<p align="right">(<a href="#readme-top">Haut de page</a>)</p>

### Créer son projet Git :

Dans un premier temps, dans un dossier localisé de préférence à la racine de votre disque, que vous pouvez nommer comme vous le souhaitez, importer le fork du projet Git principal en faisant la commande associée dans une console de commande.

```sh
git clone https://github.com/Happy591/Base_Serveur_RedEM_FR.git
```

<p align="right">(<a href="#readme-top">Haut de page</a>)</p>

### Par-feu & Port :

Voici le majeur problème que vous rencontrerez `Comment ouvrir ses port pour FXServer ?`. Normalement il suffit de suivre les étapes qui vont suivre.
* Ouvrir Pare-feu Windows Defender avec fonctions avancées de sécurité
* Ouvrir Règles de trafic entrant
* Créer une `Nouvelle règle...` avec comme options : `Port`, `TCP` avec `Port locaux spécifiques : 30120`, `Autoriser la connexion`, `Domaine Privé et Public`, `Nom : 30120 TCP`
* Répéter l'étape 3, mais sélectionnez `UDP` dans le protocole de port, puis `Nom : 30120 UDP`
* Faire un `Ipconfig` ou vous allez copier coller l'`adresse passerelle` dans votre navigateur. En fonction de votre opérateur internet, allez dans `NAT` et ouvrez le port `30120` (IP statique de la machine requise).
* Refaire toutes ses étapes pour ouvrir le port 40120 (pour pouvoir accéder à TxAdmin d'un autre poste)

Le problème ici, c'est qu'il est impossible pour chez certains opérateurs de changer ses paramètres NAT (coucou à SFR :clown_face:) ou alors vous devrez changer votre abonnement internet pour pouvoir le faire, contre des billets en plus (coucou à Orange :clown_face:). Seul solution dans ce cas, louer une machine virtuelle pour héberger votre serveur.

<p align="right">(<a href="#readme-top">Haut de page</a>)</p>

### KEY :

Chaque serveur à deux clés unique que vous allez devoir générer.
* Sur Steam elle se nomme <a href="https://steamcommunity.com/dev/apikey">API KEY</a>
* Sur RedM elle se nomme <a href="https://keymaster.fivem.net/server/">KEYMASTER</a>

Il va falloir créer votre compte <a href="https://forum.cfx.re/">CFX</a> si ce n'est pas déjà fait pour obtenir la KEYMASTER. Rappelez vous bien de vos identifiant, ils vous seront utile dans le futur. Un fois fait, allez sur le lien ci-dessus, vous faites `New Server` et vous remplissez le formulaire en fonction de vos paramètres. Une fois terminé, copier le code de votre clé, nous nous en resservirons.

<p align="right">(<a href="#readme-top">Haut de page</a>)</p>

### Modification de server.cfg :

Dans le fichier `server.cfg` localisé dans le dossier `Serveur_RedEM/server-data/server.cfg` vous allez devoir modificher les clés uniques par celle que vous avez générez un peu plus tôt, mais également modifier les adresses IP par celle de votre machine.
* Ligne 19 
```js
endpoint_add_tcp "TON.IP:30120"
```
* Ligne 20 
```js
endpoint_add_udp "TON.IP:30120"
```
* Ligne 83
```js
set steam_webApiKey "APIKEY"
``` 
* Ligne 86
```js
sv_licenseKey "KEYMASTER"
```

**N'oubliez pas de sauvegarder les modifications.**

<p align="right">(<a href="#readme-top">Haut de page</a>)</p>

### Base de donnée :

MariaDB est le langage utilisé au niveau de la base de donnée. Pour pouvoir faire en sort que le serveur fonction il faut donc lancer la base de donnée associée.
* Lancer `XAMPP` et `start` Apache et MySQL
* Lancer `HEIDI SQL` créez votre session avec le nom que vous souhaitez
* Lancez la session, créer une nouvelle base de donnée que vous nommerez `redemrp`
* Une fois à l'interieur, celle-ci est vide, faite `File`, `Run SQL file...` et exécuter le fichier `RedEM_PreBuild.sql` localisé dans `Serveur_RedEM/server-sql/RedEM_PreBuild.sql`

**Ignorez les warnings s'il y en a.**

<p align="right">(<a href="#readme-top">Haut de page</a>)</p>

### Exécutable : 

Une fois toutes ses opérations terminée, lancer `FXServer.exe` localisé dans `Serveur_RedEM/server/FXServer.exe`. Une console s'affiche à l'écran et elle vous amènera sur une nouvelle page web pour installer TX Admin. Choisissez bien le chemin pour votre fichier ici `Serveur_RedEM/server-data/server.cfg` pas besoin d'en créer un nouveau. Après un petit moment d'attente, lorsque le cache est installé, et après avoir relancé votre éxécutable, vous pouvez enfin vous connecter au serveur !

Vous devez être connecter à Redm ainsi qu'à votre licence avec le même compte pour avoir les permissions admin.

## Tutoriel Vidéo :

_Dans le futur..._

<p align="right">(<a href="#readme-top">Haut de page</a>)</p>

## Contribution :

Les contributions font avancer le projet plus vite qu'une personne seule. Toutes les contributions que vous faites sont donc **grandement appréciées**. Si vous avez une suggestion qui améliorerait le projet, n'hésitez pas à créer une demande de fork.

N'oubliez pas de mettre une étoile au projet ! Merci !

1. Fork le Projet
2. Créer une Branch par feature (`git checkout -b feature/NomdeFeature`)
3. Commiter vos Changements (`git commit -m 'Description de feature'`)
4. Push vers la Branch (`git push origin feature/NomdeFeature`)
5. Ouvrir une requête Pull

<p align="right">(<a href="#readme-top">Haut de page</a>)</p>

## License :

Distribué sous la GNU License. Voir `LICENSE.txt` pour plus d'informations.

<p align="right">(<a href="#readme-top">Haut de page</a>)</p>

## Support :

Pour plus assistance sur de potentiels problèmes avec le framework consultez leur [discord](https://discord.gg/FKH4uwb)<br />
Pour plus assistance sur de potentiels problèmes avec CFX consultez leur [discord](https://discord.gg/fivem)<br />
Pour plus assistance sur de potentiels problèmes avec TxAdmin consultez leur [discord](https://discord.gg/yWxjt9zPWR)<br />

<p align="right">(<a href="#readme-top">Haut de page</a>)</p>

[contributors-shield]: https://img.shields.io/github/contributors/Happy591/Serveur_RedEM.svg?style=for-the-badge
[contributors-url]: https://github.com/Happy591/Serveur_RedEM/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Happy591/Serveur_RedEM.svg?style=for-the-badge
[forks-url]: https://github.com/Happy591/Serveur_RedEM/network/members
[stars-shield]: https://img.shields.io/github/stars/Happy591/Serveur_RedEM.svg?style=for-the-badge
[stars-url]: https://github.com/Happy591/Serveur_RedEM/stargazers
[issues-shield]: https://img.shields.io/github/issues/Happy591/Serveur_RedEM.svg?style=for-the-badge
[issues-url]: https://github.com/Happy591/Serveur_RedEM/issues
[product-screenshot]: images/giphy.gif
