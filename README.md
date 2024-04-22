# GameList Editor 2023 is here!
This repository intends to contribute to GameList Editor development and bring it back to life as NeeeeB is not planning to build it anymore and it is no longer scraping or recognizing new systems.

GameList Editor is now in the best shape it ever had! 
* **Full Video support!** with playback! -also buttons for changing and deleting the video. Also basic **video scraping** and a new Missing Videos filter 
* **Recognize ANY system.** No longer limited to a few preconfigured folder names.
* **Batch editing (NEW 2023!)** so that you can set fields like region, genre, favorite, hidden, date, developer or even description to all selected games with one button click.
* **More filters (NEW 2023!)** like Same Genre, Same or Lower Rating, Same Publisher, etc. so it is easier than ever to explore, edit or delete similar games.
* **Mass deletion (NEW 2023!)** especially powerful when combined with the new filters. Easier than ever to delete games of a specific Genre, or low rating, etc.
* **Support for kidgame tag (NEW 2023!)** so it is easier to mark or filter kid friendly games. 
* **Scraping is now in top shape!** It now supports TLS 1.3 to be able to talk to the server again. The former implementation was obsolete and no longer working due to new security requirements from the server. It is now up to date.
* **Scraping is much more resilient** -far less crashes when malformed XML or unexpected structure came from the server.
* **Languages are back better than ever!** The translations were not included in this fork releases before (by mistake). The resources are added back with the latest new labels in all supported languages.
* Adds **logos and scraping** info for **20 more systems**: '3do', 'amiga' (generic), 'amigacd32', 'arcade', 'atari5200', 'atarilynx', 'cdtv', 'coleco', 'daphne', 'gx4000', 'intellivision', 'naomi', 'neogeocd', 'openbor', 'ports', 'saturn', 'snescd', 'x68000', 'atomiswave', 'ti99', 'snesmsu1', 'gameandwatch', 'nds', 'odyssey2', 'tg16', 'tg16cd', 'pspminis'. 
* **Active support.** Feel free to open Issues or participate in Discussions to share feedback about the tool and make it better. Those sections are now available in this fork.

**NOTE**: On high resolution screens you may want to right click on Properties in GameListEditor.exe, click on Compatibility, Change high DPI settings button, mark Override high DPI scaling behavior... to System (dropdown). Ok and Ok. 

**Requirement Warning** It requires Windows Media Player installed. If you see an error message EOleSysError / Class not registered when launching, please check https://github.com/andresdelcampo/GameList_Editor/issues/18 

### Quickstart for New users:
- Select your language in Options / Language.
- If you want to scrape games, enter your Screenscraper.fr user and password in Options / Network / Configure.
- Select File / Choose folder and point to your PC folder or even network RetroPie / Recalbox containing your game systems folders with roms, etc.
- Note: This tool is not intended for massive scraping but for collection refining - you may use https://www.skraper.net/ for massive scraping purposes.

![GameListEditor1](https://user-images.githubusercontent.com/33843515/147408123-9b64fbbb-200e-4188-9f26-b7ee55af07d5.png)
![GameListEditor2](https://user-images.githubusercontent.com/33843515/147408203-ff75b5da-4b4a-484c-b771-fa0eb2b887c1.png)

### Info for developers / contributors:
There are some very significant changes to the inner workings of GameList Editor as most of the tooling was 5+ years old and in many cases obsolete.
* GameList Editor is now in Delphi 10.4
* Internet Direct (Indy) did not support TLS 1.3, so it has been migrated to TNetHttpClient (included in Delphi 10.4). It no longer requires additional DLLs in the main directory.
* Dependency on Windows Media Player ActiveX (included in Windows 7 and later -including Windows 11). Implemented in your development environment following: https://chapmanworld.com/windows-media-player-in-delphi/
* DxGetText used for translations is also deprecated and not working in Windows 10/11, but J. Rathlev has made his own Windows 10/11 version -you can download it from https://personal-backup.rathlev-home.de/translate.html . Translations can be made using the same process as described in http://dxgettext.po.dk/documentation/how-to


# Original readme
![alt text](https://github.com/NeeeeB/GameList_Editor/blob/master/Images/logo.png)

***NOTE: NeeeeB is no longer supporting the project. The fork https://github.com/andresdelcampo/GameList_Editor is now supporting it and keeping it up to date with newer systems and additional features.***

GameList Editor is a tool written in Delphi(Windows only but Wine compatible) to help the edition of gamelist.xml files generated from UXS for Recalbox or Retropie.

*GameList Editor est un outil écrit en Delphi(Windows uniquement mais compatible Wine) vous permettant d'éditer facilement vos gamelist.xml Recalbox ou Retropie créés par UXS.*

It relies heavily on the fact that your gamelist.xml have been generated by Universal XML Scraper by Screech:

*Il dépend fortement du fait que vos gamelist.xml aient été générés par Universal XML Scraper par Screech:*
https://github.com/Universal-Rom-Tools/Universal-XML-Scraper

![alt text](https://github.com/NeeeeB/GameList_Editor/blob/master/Images/Presentation/Capture.PNG)

Basic features are :
- Choose the folder where your systems folder are stored (aka "roms" folder).
- Edit on your PC or directly on your Pi (you can configure SSH if needed but default configuration is included).
- Change the content of every field of the gamelist.xml
- Convert all text to upper/lowercase (by system or per game)
- Remove region from the game name (ie. [xxx]).
- Change picture of a game (to another or to a default one).
- Remove picture of a game.
- Set default picture to all missing pictures of a system.
- God Mode : allows you to delete a Game (use with caution, it **REALLY** deletes the game and its entry in the gamelist.xml !!).
- More options are available and are detailed in the help window (displayed at first startup of the tool).

*Options de base :*
- *Choisissez le dossier où se trouvent tous vos dossiers de systèmes (en général le dossier "roms").*
- *Editez les gamelist sur votre PC ou directement sur votre Pi (SSH configuré par défaut mais possibilité de changer les identifiants).*
- *Changez le contenu de n'importe quel champ du gamelist.xml*
- *Convertissez tout le texte en majuscule/minuscule (par système ou par jeu)*
- *Supprimez le tag de région dans le nom du jeu (ex. [xxx]).*
- *Changez l'image d'un jeu (par une autre pour par celle par défaut).*
- *Supprimez l'image d'un jeu.*
- *Attribuez l'image par défaut pour tous les jeux d'un système qui n'ont pas d'image.*
- *God Mode : permet de supprimer un jeu (utiliser avec précaution ça supprime **REELLEMENT** le jeu et son entrée dans le gamelist.xml !!)*
- *D'autres options sont disponibles et sont détaillées dans la fenêtre d'aide (qui s'affiche au premier démarrage de l'outil).*

Screenshots :

![alt text](https://github.com/NeeeeB/GameList_Editor/blob/master/Images/Presentation/Capture2.PNG)

![alt text](https://github.com/NeeeeB/GameList_Editor/blob/master/Images/Presentation/Capture3.PNG)

![alt text](https://github.com/NeeeeB/GameList_Editor/blob/master/Images/Presentation/Capture4.PNG)

There are also 16 themes available in the tool, pick the one you prefer in the options !!

*Vous pouvez choisir votre thème préféré dans les options entre 16 différents !!*

![alt text](https://github.com/NeeeeB/GameList_Editor/blob/master/Images/Presentation/Capture5.PNG)

Examples of themes :

*Exemples de thèmes :*

![alt text](https://github.com/NeeeeB/GameList_Editor/blob/master/Images/Presentation/mosaic.png)

# For users (Pour les utilisateurs) :
All you need is the package available in the release section.

https://github.com/NeeeeB/GameList_Editor/releases

Just unzip and you're good to go !!

This is a beta version for the moment, many features will be added in the future but it is already pretty fast.
(It loads my 5 systems with almost 3000 games in less than a second).
Loading of gamelist.xml will be slower if you do it directly from your Raspberry (depends on your connexion mostly).

*Tout ce dont vous avez besoin, c'est du package disponible dans la section "release".*

https://github.com/NeeeeB/GameList_Editor/releases

*Dézippez, et c'est parti !!*

*C'est une version Béta pour le moment, d'autres options seront ajoutées par la suite mais l'outil est déjà plutôt rapide.
(Il charge mes 5 systèmes avec quasiment 3000 jeux en moins d'une seconde).
Le chargement des gamelist.xml sera un peu plus lent depuis votre Pi (dépend essentiellement de votre connexion).*

Support is available here :

*Le support est disponible ici :*
https://forum.recalbox.com/topic/9265/soft-gamelist-editor

Prérequis/Prerequisites Wine :

- WineHQ 2.0.2
- Configured as Vista (needed for the folder selector...)
- Lib MSXML6
- GameList Editor theme set to "windows basic"


# For Developers (Pour les développeurs) :
It is developed with Embarcadero 10.2.1 (Tokyo) but it has been tested and builds too on Embarcadero 10.1 (Berlin).
All you need is the source code, and the Resources folder to be placed in the same directory as your .exe file.
You also need to put the plink.exe in the resources folder.

*L'outil est développé en Delphi avec Embarcadero 10.2.1 (Tokyo) mais il a été testé avec Embarcadero 10.1 (Berlin).
Vous avez uniquement besoin du code source et du dossier resources placé dans le même répertoire que l'exécutable.
Vous devrez également ajouter plink.exe dans le dossier resources*

https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html



