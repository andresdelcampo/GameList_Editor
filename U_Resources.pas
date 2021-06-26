unit U_Resources;

interface

resourcestring
   Rst_Title1 = 'Choose your folder :';

   Rst_Help1 = 'Select the folder where your systems folders are stored.' + SlineBreak +
               'It can be on your PC or on your Raspberry Pi.' + SlineBreak + SlineBreak +
               'If you choose a folder on the Pi, you will be prompted with a message explaining ' +
               'that EmulationStation will be stopped in order to save your changes to the gamelist.xml.' + sLineBreak +
               'When you close the application, Recalbox/Retropie will be rebooted to reflect your changes.' + SlineBreak + SlineBreak +
               'You have to check the box of a field to enable its modification.' + SlineBreak +
               'It is done on purpose, to avoid accidentally changing fields content.';

   Rst_Title2 = 'Enable God Mode:';

   Rst_Help2 = 'Enabling this option will let you delete games directly from the application.' + sLineBreak +
               'A delete button will be added to the GUI.' + sLineBreak +
               'You will be prompted to confirm when you click on the delete button.' + sLineBreak +
               'Deleting a game will remove its entry from the gamelist, delete the matching picture,' +
               'and delete the file from your folder.';

   Rst_Title3 = 'Delete without prompt:';

   Rst_Help3 = 'Enabling this option will disable the prompt to confirm when you delete a game.' + sLineBreak +
               'Use with caution.';

   Rst_Title4 = 'Disable Pi prompts:';

   Rst_Help4 = 'Checking this option will disable all the prompts related ' +
               'to the EmulationStation stop and the Recalbox/Retropie reboot.';

   Rst_Title5 = 'Auto Hash:';

   Rst_Help5 = 'Enabling this option will Auto hash the files when you click on More Infos.' + sLineBreak +
               'Do this if you have a powerful computer or if your systems only contain small roms.' + sLineBreak +
               'Hashing files can be very slow so use it with caution.' + sLineBreak +
               'If you do not enable this option, you will be prompted to hash ' +
               'or not the file when you click on More Infos.';

   Rst_Title6 = 'Show tips at start:';

   Rst_Help6 = 'Enabling this option will show the help window on application start.' + sLineBreak +
               'You can disable the help window for the next launches, by disabling this ' +
               'option or by checking the box "Don''t show again" in the help window, before closing it.';

   Rst_Title7 = 'Use Genesis logo:';

   Rst_Help7 = 'This will let you use the Genesis logo and name instead of Megadrive.';

   Rst_Title8 = 'System - Convert to lowercase:';

   Rst_Help8 = 'Will convert all the text to lowercase for the whole selected system (every game will be converted).';

   Rst_Title9 = 'System - Convert to uppercase:';

   Rst_Help9 = 'Will convert all the text to uppercase for the whole selected system (every game will be converted).';

   Rst_Title10 = 'System - Remove region from games names:';

   Rst_Help10 = 'Will remove the region tag in the name (i.e [xxxx]) for every game of the selected system.';

   Rst_Title11 = 'Game - Convert to lowercase:';

   Rst_Help11 = 'Will convert all the text to lowercase for the selected game.';

   Rst_Title12 = 'Game - Convert to uppercase:';

   Rst_Help12 = 'Will convert all the text to uppercase for the selected game.';

   Rst_Title13 = 'SSH / Configuration:';

   Rst_Help13 = 'Open a new popup window where you can set your Login and Password for Recalbox/Retropie.' + sLineBreak +
                'Filled with default values at first launch, your settings will be saved afterwards.';

   Rst_Title14 = 'System - Delete orphans from gamelist :';

   Rst_Help14 = 'Will remove from the gamelist.xml all the games that are not "physically" present on your drive.' + sLineBreak +
                'Orphan means the game is listed in the gamelist.xml, but the associated rom no longer exists.';

   Rst_Title15 = 'System - Delete duplicates from gamelist :';

   Rst_Help15 = 'Will remove all duplicates (same games that are listed 2 times or more) from the gamelist.xml';

   Rst_Text = sLineBreak + 'GameList Editor is a tool to manage your Gamelist.xml' + sLineBreak +
              'from a Recalbox or Retropie installation:' + sLineBreak +
              'https://www.recalbox.com/' + sLineBreak +
              'https://retropie.org.uk/' + sLineBreak + sLineBreak +
              'It is written in Delphi (Tokyo 10.2.1) by NeeeeB' + sLineBreak +
              'Its source code is fully available at:' + sLineBreak +
              'https://github.com/NeeeeB/GameList_Editor' + sLineBreak + sLineBreak +
              'Your Gamelist.xml should have been created' + sLineBreak +
              'with Universal XML Scraper by Screech:' + sLineBreak +
              'https://github.com/Universal-Rom-Tools/Universal-XML-Scraper' + sLineBreak + sLineBreak +
              'Translators (Thx to them !!):' + sLineBreak +
              'German = Gmgman and Lackyluuk' + sLineBreak +
              'Spanish = Uzanto' + sLineBreak +
              'Portuguese(BR) = Nwildner';

   Rst_WrongFolder = 'Oops !! It looks like you selected the wrong folder !' + SlineBreak +
                     'Please select the root folder where your systems folders are stored.';

   Rst_GamesFound = ' game(s) found.';

   Rst_HashWarning = 'Hashing a file can be extremly slow depending on' + sLineBreak +
                     'the file size, your computer, your HDD...' + sLineBreak +
                     'Do you want to hash anyway ?';

   Rst_DeleteWarning = 'This will delete the entry in the gamelist,' + sLinebreak +
                       'the rom itself and the associated image permanently.' + sLineBreak +
                       'Proceed anyway ?';

   Rst_StopES = 'Your systems folder seems to be located on your Pi.' + sLineBreak +
                'EmulationStation will be stopped for' + sLineBreak +
                'the gamelist.xml changes to take effect.';

   Rst_RebootRecal = 'Recalbox/Retropie will be restarted to reflect your changes.';

   Rst_Yes = 'Yes';
   Rst_No = 'No';
   Rst_Ok = 'Ok';
   Rst_Info = 'Information';
   Rst_ServerError1 = 'URL missing parameters';
   Rst_ServerError2 = 'API closed for non subscriber users';
   Rst_ServerError3 = 'Dev login error';
   Rst_ServerError4 = 'Game not found';
   Rst_ServerError5 = 'API closed';
   Rst_ServerError6 = 'Scrapper version obsolete';
   Rst_ServerError7 = 'Maximum threads allowed already used';
   Rst_ServerError8 = 'Check your Internet/Proxy parameters';
   Rst_StreamError = 'Oops !! An error has occured while reading the stream !!';

   //noms des systemes tels qu'ils seront affichés dans la combobox
   Rst_SystemKindNES = 'Nintendo';
   Rst_SystemKindSNES = 'Super Nintendo';
   Rst_SystemKindMS = 'Master System';
   Rst_SystemKindMD = 'MegaDrive';
   Rst_SystemKindNEOGEO = 'Neo Geo';
   Rst_SystemKindCPC = 'Amstrad CPC';
   Rst_SystemKindAT2600 = 'Atari 2600';
   Rst_SystemKindAT7800 = 'Atari 7800';
   Rst_SystemKindATST = 'Atari ST';
   Rst_SystemKindCS = 'CaveStory';
   Rst_SystemKindFCD = 'Family Computer Disk';
   Rst_SystemKindFBA = 'Final Burn Alpha';
   Rst_SystemKindFBALib = 'Final Burn Alpha Libretro';
   Rst_SystemKindGW = 'Game & Watch';
   Rst_SystemKindGBC = 'Gameboy Color';
   Rst_SystemKindGG = 'Game Gear';
   Rst_SystemKindGB = 'Gameboy';
   Rst_SystemKindGBA = 'Gameboy Advance';
   Rst_SystemKindLU = 'Lutro';
   Rst_SystemKindLYNX = 'Lynx';
   Rst_SystemKindMAME = 'Mame';
   Rst_SystemKindMSX = 'MSX 1-2-2+';
   Rst_SystemKindMSX1 = 'MSX 1';
   Rst_SystemKindMSX2 = 'MSX 2+';
   Rst_SystemKindNGP = 'Neo Geo Pocket B&W';
   Rst_SystemKindNGPC = 'Neo Geo Pocket Color';
   Rst_SystemKindN64 = 'Nintendo 64';
   Rst_SystemKindODY = 'Odyssey 2';
   Rst_SystemKindPCE = 'PC Engine';
   Rst_SystemKindPCECD = 'PC Engine CD';
   Rst_SystemKindPS = 'Playstation';
   Rst_SystemKindPRB = 'PR Boom';
   Rst_SystemKindSVM = 'Scumm VM';
   Rst_SystemKindS32X = 'Sega 32X';
   Rst_SystemKindSCD = 'Sega CD';
   Rst_SystemKindSG1000 = 'Sega SG 1000';
   Rst_SystemKindSGFX = 'Supergrafx';
   Rst_SystemKindVCX = 'Vectrex';
   Rst_SystemKindVB = 'Virtual Boy';
   Rst_SystemKindWS = 'Wonderswan B&W';
   Rst_SystemKindWSC = 'Wonderswan Color';
   Rst_SystemKindZXS = 'ZX Spectrum';
   Rst_SystemKindZX81 = 'ZX81';
   Rst_SystemKindAM1200 = 'Amiga 1200';
   Rst_SystemKindAM600 = 'Amiga 600';
   Rst_SystemKindAPPLE = 'Apple II';
   Rst_SystemKindCV = 'Colecovision';
   Rst_SystemKindC64 = 'Commodore 64';
   Rst_SystemKindDB = 'DosBox';
   Rst_SystemKindDC = 'Dreamcast';
   Rst_SystemKindGC = 'Gamecube';
   Rst_SystemKindPSP = 'Playstation Portable';
   Rst_SystemKindWII = 'Wii';
   Rst_SystemKindGenesis = 'Genesis';

type
   //enumération pour les différents systèmes
   TSystemKind = ( skNES,
                   skSNES,
                   skMasterSystem,
                   skMegaDrive,
                   skNeoGeo,
                   skCPC,
                   skAT2600,
                   skAT7800,
                   skATST,
                   skCS,
                   skFCD,
                   skFBA,
                   skFBALib,
                   skGW,
                   skGBC,
                   skGG,
                   skGB,
                   skGBA,
                   skLU,
                   skLYNX,
                   skMAME,
                   skMSX,
                   skMSX1,
                   skMSX2,
                   skNGP,
                   skNGPC,
                   skN64,
                   skODY,
                   skPCE,
                   skPCECD,
                   skPS,
                   skPRB,
                   skSVM,
                   skS32X,
                   skSCD,
                   skSG1000,
                   skSGFX,
                   skVCX,
                   skVB,
                   skWS,
                   skWSC,
                   skZXS,
                   skZX81,
                   skAM1200,
                   skAM600,
                   skAPPLE,
                   skCV,
                   skC64,
                   skDB,
                   skDC,
                   skGC,
                   skPSP,
                   skWII,
                   skGenesis );

   //enum noms des themes
   TThemeName = ( tnAmakrits,
                  tnAquaGraphite,
                  tnAquaLightSlate,
                  tnAuric,
                  tnCarbon,
                  tnCharcoalDarkSlate,
                  //tnDiamond,
                  //tnEmerald,
                  tnEmeraldLightSlate,
                  tnGlossy,
                  tnLight,
                  tnRubyGraphite,
                  tnSky,
                  //tnVapor,
                  tnWindows10,
                  tnWindows10Dark,
                  tnWindowsBasic );

   //enum pour les langues
   TLangName = ( lnFrench,
                 lnGerman,
                 lnEnglish,
                 lnSpanish,
                 lnPortuguese_BR );

   //enum pour les pays
   TCountryName = ( cnUnd,
                    cnDe,
                    cnAsi,
                    cnAu,
                    cnBr,
                    cnBg,
                    cnCa,
                    cnCl,
                    cnCn,
                    cnAme,
                    cnKr,
                    cnCus,
                    cnDk,
                    cnSp,
                    cnEu,
                    cnFi,
                    cnFr,
                    cnGr,
                    cnHu,
                    cnIl,
                    cnIt,
                    cnJp,
                    cnKw,
                    cnWor,
                    cnMor,
                    cnNo,
                    cnNz,
                    cnOce,
                    cnNl,
                    cnPe,
                    cnPl,
                    cnPt,
                    cnCz,
                    cnUk,
                    cnRu,
                    cnSk,
                    cnSe,
                    cnTw,
                    cnTr,
                    cnUs );
const
   Cst_Path = 'path';
   Cst_Game = 'game';
   Cst_Name = 'name';
   Cst_Description = 'desc';
   Cst_ImageLink = 'image';
   Cst_Rating = 'rating';
   Cst_ReleaseDate = 'releasedate';
   Cst_Developer = 'developer';
   Cst_Publisher = 'publisher';
   Cst_Genre = 'genre';
   Cst_Players = 'players';
   Cst_Region = 'region';
   Cst_Playcount = 'playcount';
   Cst_LastPlayed = 'lastplayed';
   Cst_Hidden = 'hidden';
   Cst_Favorite = 'favorite';
   Cst_GameListFileName = 'gamelist.xml';
   Cst_DateShortFill = '00';
   Cst_DateLongFill = '0000';
   Cst_DateSuffix = 'T000000';
   Cst_ImageSuffixPng = '-image.png';
   Cst_ImageSuffixJpg = '-image.jpg';
   Cst_ImageSuffixJpeg = '-image.jpeg';
   Cst_DefaultPicsFolderPath = 'Resources\DefaultPictures\';
   Cst_DefaultImageNameSuffix = '-default.png';
   Cst_DefaultImageName = 'default.png';
   Cst_LogoPicsFolder = 'Resources\SystemsLogos\';
   Cst_IniFilePath = 'Resources\Settings.ini';
   Cst_ResourcesFolder = 'Resources\';
   Cst_TxtExtension = '.txt';

   Cst_IniOptions = 'Options';
   Cst_IniGodMode = 'GodMode';
   Cst_IniAutoHash = 'AutoHash';
   Cst_IniDelWoPrompt = 'DelWoPrompt';
   Cst_IniPiPrompts = 'PiPrompts';
   Cst_ShowTips = 'ShowTips';
   Cst_IniGenesisLogo = 'GenesisLogo';
   Cst_IniRecalLogin = 'SSHRecalLogin';
   Cst_IniRecalPwd = 'SSHRecalPwd';
   Cst_IniRetroLogin = 'SSHRetroLogin';
   Cst_IniRetroPwd = 'SSHRetroPwd';
   Cst_IniLanguage = 'Language';
   Cst_IniSSUser = 'SSUser';
   Cst_IniSSPwd = 'SSPwd';
   Cst_IniProxyUser = 'ProxyUser';
   Cst_IniProxyPwd = 'ProxyPwd';
   Cst_IniProxyServer = 'ProxyServer';
   Cst_IniProxyPort = 'ProxyPort';
   Cst_IniProxyUse = 'ProxyUse';

   Cst_GenesisLogoName = 'genesis.png';
   Cst_ThemeNumber = 'ThemeNumber';
   Cst_MenuTheme = 'Mnu_Theme';
   Cst_MenuLang = 'Mnu_Lang';
   Cst_PlinkCommand = '/C plink -v ';
   Cst_PlinkCommandRecal = '@recalbox -pw ';
   Cst_PlinkCommandRetro = '@retropie -pw ';
   Cst_PlinkCommandStop = ' killall emulationstation';
   Cst_PlinkCommandStart = ' /sbin/reboot';
   Cst_RecalLogin = 'root';
   Cst_RecalPwd = 'recalboxroot';
   Cst_RetroLogin = 'pi';
   Cst_RetroPwd = 'raspberry';
   Cst_Recalbox = '\\RECALBOX';
   Cst_Retropie = '\\RETROPIE';
   Cst_True = 'true';
   Cst_False = 'false';

   //Constantes pour le scrape
   Cst_ScraperAddress = 'https://www.screenscraper.fr/api2/';
   Cst_Category = 'jeuInfos.php';
   Cst_ScrapeLogin = '?devid=NeeeeB';
   Cst_ScrapePwd = '&devpassword=mapzoe';
   Cst_DevSoftName = '&softname=GameListEditorv1';
   Cst_Output = '&output=xml';
   Cst_SSId = '&ssid=';
   Cst_SSPwd = '&sspassword=';
   Cst_Crc = '&crc=';
   Cst_SystemId = '&systemid=';
   Cst_RomType = '&romtype=rom';
   Cst_RomName = '&romnom=';
   Cst_RomSize = '&romtaille=';
   Cst_TempXml = 'temp.xml';
   Cst_DataNode = 'Data';
   Cst_GameNode = 'jeu';
   Cst_UserNode = 'ssuser';
   Cst_ThreadNode = 'maxthreads';
   Cst_MediaNode = 'medias';
   Cst_NamesNode = 'noms';
   Cst_RegionsNode = 'regions';
   Cst_EditNode = 'editeur';
   Cst_DevNode = 'developpeur';
   Cst_NoteNode = 'note';
   Cst_PlayersNode = 'joueurs';
   Cst_SynopNode = 'synopsis';
   Cst_DateNode = 'dates';
   Cst_GenreNode = 'genres';
   Cst_AttType = 'type';
   Cst_AttFormat = 'format';
   Cst_AttRegion = 'region';
   Cst_AttLang = 'langue';
   Cst_AttId = 'id';
   Cst_PngExt = 'png';
   Cst_MediaBox2d = 'box-2D';
   Cst_MediaScreenShot = 'ss';
   Cst_MediaSsTitle = 'sstitle';
   Cst_MediaBox3d = 'box-3D';
   Cst_MediaMix1 = 'mixrbv1';
   Cst_MediaMix2 = 'mixrbv2';
   Cst_MediaArcadeBox1 = 'ssarcademyboxv1';
   Cst_MediaWheel = 'wheel';

   //tableau de liaison enum themes / noms themes
   Cst_ThemeNameStr: array[TThemeName] of string =
      ( 'Amakrits',
        'Aqua Graphite',
        'Aqua Light Slate',
        'Auric',
        'Carbon',
        'Charcoal Dark Slate',
        //'Diamond',
        //'Emerald',
        'Emerald Light Slate',
        'Glossy',
        'Light',
        'Ruby Graphite',
        'Sky',
        //'Vapor',
        'Windows10',
        'Windows10 Dark',
        'Windows' );

   //tableau de liaison enum langues / noms langues
   Cst_LangNameStr: array[TLangName] of string =
      ( 'fr',
        'de',
        'en',
        'es',
        'pt_BR' );

   //tableau de liaison enum systemes / noms systems affichés
   Cst_SystemKindStr: array[TSystemKind] of string =
      ( Rst_SystemKindNES,
        Rst_SystemKindSNES,
        Rst_SystemKindMS,
        Rst_SystemKindMD,
        Rst_SystemKindNEOGEO,
        Rst_SystemKindCPC,
        Rst_SystemKindAT2600,
        Rst_SystemKindAT7800,
        Rst_SystemKindATST,
        Rst_SystemKindCS,
        Rst_SystemKindFCD,
        Rst_SystemKindFBA,
        Rst_SystemKindFBALib,
        Rst_SystemKindGW,
        Rst_SystemKindGBC,
        Rst_SystemKindGG,
        Rst_SystemKindGB,
        Rst_SystemKindGBA,
        Rst_SystemKindLU,
        Rst_SystemKindLYNX,
        Rst_SystemKindMAME,
        Rst_SystemKindMSX,
        Rst_SystemKindMSX1,
        Rst_SystemKindMSX2,
        Rst_SystemKindNGP,
        Rst_SystemKindNGPC,
        Rst_SystemKindN64,
        Rst_SystemKindODY,
        Rst_SystemKindPCE,
        Rst_SystemKindPCECD,
        Rst_SystemKindPS,
        Rst_SystemKindPRB,
        Rst_SystemKindSVM,
        Rst_SystemKindS32X,
        Rst_SystemKindSCD,
        Rst_SystemKindSG1000,
        Rst_SystemKindSGFX,
        Rst_SystemKindVCX,
        Rst_SystemKindVB,
        Rst_SystemKindWS,
        Rst_SystemKindWSC,
        Rst_SystemKindZXS,
        Rst_SystemKindZX81,
        Rst_SystemKindAM1200,
        Rst_SystemKindAM600,
        Rst_SystemKindAPPLE,
        Rst_SystemKindCV,
        Rst_SystemKindC64,
        Rst_SystemKindDB,
        Rst_SystemKindDC,
        Rst_SystemKindGC,
        Rst_SystemKindPSP,
        Rst_SystemKindWII,
        Rst_SystemKindGenesis );

   //tableau de liaison enum systemes/nom des dossiers systeme
   Cst_SystemKindFolderNames: array[TSystemKind] of string =
      ( 'nes',
        'snes',
        'mastersystem',
        'megadrive',
        'neogeo',
        'amstradcpc',
        'atari2600',
        'atari7800',
        'atarist',
        'cavestory',
        'fds',
        'fba',
        'fba_libretro',
        'gw',
        'gbc',
        'gamegear',
        'gb',
        'gba',
        'lutro',
        'lynx',
        'mame',
        'msx',
        'msx1',
        'msx2',
        'ngp',
        'ngpc',
        'n64',
        'o2em',
        'pcengine',
        'pcenginecd',
        'psx',
        'prboom',
        'scummvm',
        'sega32x',
        'segacd',
        'sg1000',
        'supergrafx',
        'vectrex',
        'virtualboy',
        'wswan',
        'wswanc',
        'zxspectrum',
        'zx81',
        'amiga1200',
        'amiga600',
        'apple2',
        'colecovision',
        'c64',
        'dos',
        'dreamcast',
        'gc',
        'psp',
        'wii',
        'genesis' );

   //tableau de liaison enum systemes/nom image systeme
   Cst_SystemKindImageNames: array[TSystemKind] of string =
      ( 'nes.png',
        'snes.png',
        'mastersystem.png',
        'megadrive.png',
        'neogeo.png',
        'amstradcpc.png',
        'atari2600.png',
        'atari7800.png',
        'atarist.png',
        'cavestory.png',
        'fds.png',
        'fba.png',
        'fba_libretro.png',
        'gw.png',
        'gbc.png',
        'gamegear.png',
        'gb.png',
        'gba.png',
        'lutro.png',
        'lynx.png',
        'mame.png',
        'msx.png',
        'msx1.png',
        'msx2.png',
        'ngp.png',
        'ngpc.png',
        'n64.png',
        'o2em.png',
        'pcengine.png',
        'pcenginecd.png',
        'psx.png',
        'prboom.png',
        'scummvm.png',
        'sega32x.png',
        'segacd.png',
        'sg1000.png',
        'supergrafx.png',
        'vectrex.png',
        'virtualboy.png',
        'wswan.png',
        'wswanc.png',
        'zxspectrum.png',
        'zx81.png',
        'amiga1200.png',
        'amiga600.png',
        'apple2.png',
        'colecovision.png',
        'c64.png',
        'dos.png',
        'dreamcast.png',
        'gc.png',
        'psp.png',
        'wii.png',
        'genesis.png' );

   Cst_SystemKindId: array[TSystemKind] of string =
      ( '3', '4', '2', '1', '75', '65', '26', '41', '42', '138', '106', '75',
        '75', '52', '10', '21', '9', '12', '75', '28', '75', '113', '113',
        '113', '25', '82', '14', '104', '31', '114', '57', '135', '123',
        '19', '20', '109', '105', '102', '11', '45', '46', '76', '77', '64',
        '64', '86', '48', '66', '135', '23', '13', '61', '16', '1' );

   Cst_CountryName: array[TCountryName] of string =
      ( '', 'de', 'asi', 'au', 'br', 'bg', 'ca', 'cl', 'cn', 'ame', 'kr', 'cus',
        'dk', 'sp', 'eu', 'fi', 'fr', 'gr', 'hu', 'il', 'it', 'jp', 'kw', 'wor',
        'mor', 'no', 'nz' , 'oce', 'nl', 'pe', 'pl', 'pt', 'cz', 'uk', 'ru', 'sk',
        'se', 'tw', 'tr', 'us' );

   Cst_CountryNameFull: array[TCountryName] of array[1..5] of string =
      ( ( '', '', '', '', '' ),
        ( 'Allemagne', 'Deutschland', 'Germany', 'Alemania', 'Alemanha' ),
        ( 'Asie', 'Asien', 'Asia', 'Asia', 'Ásia' ),
        ( 'Australie', 'Australien', 'Australia', 'Australia', 'Austrália' ),
        ( 'Brésil', 'Brasilien', 'Brazil', 'Brasil', 'Brasil' ),
        ( 'Bulgarie', 'Bulgarien', 'Bulgaria', 'Bulgaria', 'Bulgária' ),
        ( 'Canada', 'Kanada', 'Canada', 'Canadá', 'Canadá' ),
        ( 'Chili', 'Chile', 'Chile', 'Chile', 'Chile' ),
        ( 'Chine', 'China', 'China', 'China', 'China' ),
        ( 'Continent Américain', 'Amerikanischen Kontinent', 'American continent', 'Continente americano', 'Continente americano' ),
        ( 'Corée', 'Korea', 'Korea', 'Corea', 'Coreia' ),
        ( 'Custom', 'Maßgeschneidert', 'Custom', 'Personalizado', 'Personalizadas' ),
        ( 'Danemark', 'Dänemark', 'Denmark', 'Dinamarca', 'Dinamarca' ),
        ( 'Espagne', 'Spanien', 'Spain', 'España', 'Espanha' ),
        ( 'Europe', 'Europa', 'Europe', 'Europa', 'Europa' ),
        ( 'Finlande', 'Finnland', 'Finland', 'Finlandia', 'Finlândia' ),
        ( 'France', 'Frankreich', 'France', 'Francia', 'França' ),
        ( 'Grèce', 'Griechenland', 'Greece', 'Grecia', 'Grécia' ),
        ( 'Hongrie', 'Ungarn', 'Hungary', 'Hungría', 'Hungria' ),
        ( 'Israel', 'Israel', 'Israel', 'Israel', 'Israel' ),
        ( 'Italie', 'Italien', 'Italy', 'Italia', 'Itália' ),
        ( 'Japon', 'Japan', 'Japan', 'Japón', 'Japão' ),
        ( 'Koweït', 'Kuwait', 'Kuwait', 'Kuwait', 'Kuweit' ),
        ( 'Monde', 'World', 'World', 'Mundo', 'Mundo' ),
        ( 'Moyen-Orient', 'Naher Osten', 'Middle East', 'Medio Oriente', 'Médio Oriente' ),
        ( 'Norvège', 'Norwegen', 'Norway', 'Noruega', 'Noruega' ),
        ( 'Nouvelle-Zélande', 'Neuseeland', 'New Zealand', 'Nueva Zelanda', 'Nova Zelândia' ),
        ( 'Océanie', 'Ozeanien', 'Oceania', 'Oceanía', 'Oceânia' ),
        ( 'Pays-Bas', 'Niederlande', 'Netherlands', 'Holanda', 'Holanda' ),
        ( 'Pérou', 'Peru', 'Peru', 'Perú', 'Peru' ),
        ( 'Pologne', 'Polen', 'Poland', 'Polonia', 'Polônia' ),
        ( 'Portugal', 'Portugal', 'Portugal', 'Portugal', 'Portugal' ),
        ( 'République Tchèque', 'Tschechien', 'Czech republic', 'República Checa', 'República Checa' ),
        ( 'Royaume-Uni', 'Großbritannien', 'United Kingdom', 'Reino Unido', 'Reino Unido' ),
        ( 'Russie', 'Russland', 'Russia', 'Rusia', 'Rússia' ),
        ( 'Slovaquie', 'Slowakei', 'Slovakia', 'Eslovaquia', 'Eslováquia' ),
        ( 'Suede', 'Schweden', 'Sweden', 'Suecia', 'Suécia' ),
        ( 'Taiwan', 'Taiwan', 'Taiwan', 'Taiwan', 'Taiwan' ),
        ( 'Turquie', 'Türkei', 'Turkey', 'Turquía', 'Turquia' ),
        ( 'USA', 'USA', 'USA', 'EUA', 'EUA' ) );

implementation

end.
