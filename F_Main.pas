unit F_Main;

interface

uses
   Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
   System.SysUtils, System.Variants, System.Classes, System.IniFiles, System.Generics.Collections,
   System.RegularExpressions, System.UITypes, System.ImageList, System.StrUtils, System.IOUtils,
   System.SyncObjs,
   Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Styles, Vcl.Themes, Vcl.ImgList,
   Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Menus, Vcl.ComCtrls, Vcl.StdCtrls,
   Xml.omnixmldom, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, Xml.Win.msxmldom,
   F_MoreInfos, F_About, F_Help, F_ConfigureSSH, U_gnugettext, U_Resources, U_Game,
   F_ConfigureNetwork, F_AdvNameEditor, U_DownloadThread,
   IdURI,
   Vcl.OleCtrls, WMPLib_TLB, System.Net.URLClient,
   System.Net.HttpClient, System.Net.HttpClientComponent;

type
   TMediaInfo = class
      FileExt: string;
      FileLink: string;
   end;

   TFrm_Editor = class(TForm)
      Pnl_Background: TPanel;
      Pgc_Editor: TPageControl;
      Tbs_Main: TTabSheet;
      Tbs_Scrape: TTabSheet;
      Lbl_NbGamesFound: TLabel;
      Lbl_SelectSystem: TLabel;
      Lbl_Filter: TLabel;
      Img_Logo: TImage;
      Img_System: TImage;
      Lbl_Name: TLabel;
      Lbl_Region: TLabel;
      Lbl_Date: TLabel;
      Lbl_Players: TLabel;
      Lbl_Rating: TLabel;
      Lbl_Hidden: TLabel;
      Lbl_Favorite: TLabel;
      Lbl_Publisher: TLabel;
      Lbl_Developer: TLabel;
      Lbl_Genre: TLabel;
      Lbl_Description: TLabel;
      Lbl_Search: TLabel;
      Cbx_Systems: TComboBox;
      Lbx_Games: TListBox;
      Mmo_Description: TMemo;
      Edt_Rating: TEdit;
      Edt_ReleaseDate: TEdit;
      Edt_Developer: TEdit;
      Edt_Publisher: TEdit;
      Edt_Genre: TEdit;
      Edt_NbPlayers: TEdit;
      Edt_Name: TEdit;
      Btn_SaveChanges: TButton;
      Btn_ChangeImage: TButton;
      Btn_SetDefaultPicture: TButton;
      Btn_ChangeAll: TButton;
      Cbx_Filter: TComboBox;
      Edt_Region: TEdit;
      Btn_MoreInfos: TButton;
      Btn_Delete: TButton;
      ProgressBar: TProgressBar;
      Btn_RemovePicture: TButton;
      Cbx_Hidden: TComboBox;
      Cbx_Favorite: TComboBox;
      Edt_RomPath: TEdit;
      Edt_Search: TEdit;
      Chk_ListByRom: TCheckBox;
      Chk_FullRomName: TCheckBox;
      XMLDoc: TXMLDocument;
      OpenDialog: TFileOpenDialog;
      MainMenu: TMainMenu;
      Mnu_File: TMenuItem;
      Mnu_Choosefolder: TMenuItem;
      Mnu_Quit: TMenuItem;
      Mnu_Actions: TMenuItem;
      Mnu_System: TMenuItem;
      Mnu_LowerCase: TMenuItem;
      Mnu_UpperCase: TMenuItem;
      Mnu_RemoveRegion: TMenuItem;
      Mnu_DeleteOrphans: TMenuItem;
      Mnu_DeleteDuplicates: TMenuItem;
      Mnu_ExportTxt: TMenuItem;
      Mnu_Game: TMenuItem;
      Mnu_GaLowerCase: TMenuItem;
      Mnu_GaUpperCase: TMenuItem;
      Mnu_Selection: TMenuItem;
      Mnu_SetHidden: TMenuItem;
      Mnu_SetNoHidden: TMenuItem;
      Mnu_SetFavorite: TMenuItem;
      Mnu_SetNoFavorite: TMenuItem;
      Mnu_NameEditor: TMenuItem;
      Mnu_Options: TMenuItem;
      Mnu_General: TMenuItem;
      Mnu_GodMode: TMenuItem;
      Mnu_DeleteWoPrompt: TMenuItem;
      Mnu_AutoHash: TMenuItem;
      Mnu_PiPrompts: TMenuItem;
      Mnu_ShowTips: TMenuItem;
      Mnu_Genesis: TMenuItem;
      N3: TMenuItem;
      Mnu_NetWork: TMenuItem;
      Mnu_ConfigureNetwork: TMenuItem;
      N2: TMenuItem;
      Mnu_SSH: TMenuItem;
      Mnu_ConfigSSH: TMenuItem;
      N1: TMenuItem;
      Mnu_Theme: TMenuItem;
      Mnu_Theme1: TMenuItem;
      Mnu_Theme2: TMenuItem;
      Mnu_Theme3: TMenuItem;
      Mnu_Theme4: TMenuItem;
      Mnu_Theme5: TMenuItem;
      Mnu_Theme6: TMenuItem;
      Mnu_Theme9: TMenuItem;
      Mnu_Theme10: TMenuItem;
      Mnu_Theme11: TMenuItem;
      Mnu_Theme12: TMenuItem;
      Mnu_Theme13: TMenuItem;
      Mnu_Theme15: TMenuItem;
      Mnu_Theme16: TMenuItem;
      Mnu_Theme17: TMenuItem;
      N4: TMenuItem;
      Mnu_Language: TMenuItem;
      Mnu_Lang1: TMenuItem;
      Mnu_Lang2: TMenuItem;
      Mnu_Lang3: TMenuItem;
      Mnu_Lang4: TMenuItem;
      Mnu_Lang5: TMenuItem;
      Mnu_Help: TMenuItem;
      Mnu_About: TMenuItem;
      OpenFile: TOpenDialog;
      Img_List: TImageList;
      SaveDialog: TSaveDialog;
      Pnl_Top: TPanel;
      Scl_Pictures: TScrollBox;
      Img_ScreenScraper: TImage;
      Btn_Scrape: TButton;
      Img_Loading: TImage;
      Mmo_ScrapeDescription: TMemo;
      Lbl_ScrapeDescription: TLabel;
      Lbl_ScrapeGenre: TLabel;
      Edt_ScrapeGenre: TEdit;
      Lbl_ScrapeDeveloper: TLabel;
      Edt_ScrapeDeveloper: TEdit;
      Lbl_ScrapePublisher: TLabel;
      Edt_ScrapePublisher: TEdit;
      Lbl_ScrapeRating: TLabel;
      Edt_ScrapeRating: TEdit;
      Lbl_ScrapePlayers: TLabel;
      Edt_ScrapePlayers: TEdit;
      Lbl_ScrapeDate: TLabel;
      Edt_ScrapeDate: TEdit;
      Edt_ScrapeRegion: TEdit;
      Lbl_ScrapeRegion: TLabel;
      Edt_ScrapeName: TEdit;
      Lbl_ScrapeName: TLabel;
      Img_ScrapeBackground: TImage;
      Img_Scrape: TImage;
      Btn_ScrapeSave: TButton;
      Edt_ScrapeRomPath: TEdit;
      Btn_ScrapeLower: TButton;
      Btn_ScrapeUpper: TButton;
      Chk_ScrapePicture: TCheckBox;
      Chk_ScrapeInfos: TCheckBox;
      Chk_ManualCRC: TCheckBox;
      Edt_ManualCRC: TEdit;
      Chk_Box2D: TCheckBox;
      Chk_Box3D: TCheckBox;
      Chk_Mix1: TCheckBox;
      Chk_Mix2: TCheckBox;
      Chk_Screenshot: TCheckBox;
      Chk_Title: TCheckBox;
      Chk_ArcadeBox: TCheckBox;
      Chk_Wheel: TCheckBox;
      Mnu_Reload: TMenuItem;
      Pgc_Media: TPageControl;
      Tbs_Picture: TTabSheet;
      Tbs_Video: TTabSheet;
      Wmp_Video: TWindowsMediaPlayer;
      Img_Game: TImage;
      Img_BackGround: TImage;
      Btn_ChangeVideo: TButton;
      Btn_RemoveVideo: TButton;
      Img_BackgroundVideo: TImage;
      Net_HTTPClient: TNetHTTPClient;

      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure Cbx_SystemsChange(Sender: TObject);
      procedure Lbx_GamesClick(Sender: TObject);
      procedure Mnu_QuitClick(Sender: TObject);
      procedure Mnu_ChoosefolderClick(Sender: TObject);
      procedure Btn_SaveChangesClick(Sender: TObject);
      procedure FieldChange(Sender: TObject);
      procedure Mmo_DescriptionKeyPress(Sender: TObject; var Key: Char);
      procedure Btn_ChangeImageClick(Sender: TObject);
      procedure Btn_SetDefaultPictureClick(Sender: TObject);
      procedure Cbx_FilterChange(Sender: TObject);
      procedure Btn_ChangeAllClick(Sender: TObject);
      procedure Btn_MoreInfosClick(Sender: TObject);
      procedure Mnu_GodModeClick(Sender: TObject);
      procedure Mnu_AutoHashClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure Btn_DeleteClick(Sender: TObject);
      procedure Mnu_DeleteWoPromptClick(Sender: TObject);
      procedure ChangeCaseClick(Sender: TObject);
      procedure ChangeCaseGameClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure Btn_RemovePictureClick(Sender: TObject);
      procedure Mnu_AboutClick(Sender: TObject);
      procedure Mnu_RemoveRegionClick(Sender: TObject);
      procedure Mnu_ThemeClick(Sender: TObject);
      procedure Mnu_GenesisClick(Sender: TObject);
      procedure Mnu_HelpClick(Sender: TObject);
      procedure Mnu_ShowTipsClick(Sender: TObject);
      procedure Mnu_PiPromptsClick(Sender: TObject);
      procedure Mnu_ConfigSSHClick(Sender: TObject);
      procedure Mnu_LangClick(Sender: TObject);
      procedure Edt_SearchChange(Sender: TObject);
      procedure Mnu_DeleteOrphansClick(Sender: TObject);
      procedure Mnu_DeleteDuplicatesClick(Sender: TObject);
      procedure Btn_ScrapeClick(Sender: TObject);
      procedure Mnu_ConfigureNetworkClick(Sender: TObject);
      procedure Mnu_SetHiddenClick(Sender: TObject);
      procedure Mnu_SetNoHiddenClick(Sender: TObject);
      procedure Mnu_SetFavoriteClick(Sender: TObject);
      procedure Mnu_SetNoFavoriteClick(Sender: TObject);
      procedure Chk_ListByRomClick(Sender: TObject);
      procedure Mnu_NameEditorClick(Sender: TObject);
      procedure Mnu_ExportTxtClick(Sender: TObject);
      procedure Chk_FullRomNameClick(Sender: TObject);
      procedure Tbs_ScrapeShow(Sender: TObject);
      procedure Tbs_ScrapeHide(Sender: TObject);
      procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
                MousePos: TPoint; var Handled: Boolean);
      procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
                MousePos: TPoint; var Handled: Boolean);
      procedure ImgScrapedClick(Sender: TObject);
      procedure Btn_ScrapeSaveClick(Sender: TObject);
      procedure Btn_ScrapeUpperClick(Sender: TObject);
      procedure Btn_ScrapeLowerClick(Sender: TObject);
      procedure Chk_ScrapeClick(Sender: TObject);
      procedure Chk_ManualCRCClick(Sender: TObject);
      procedure Mnu_ReloadClick(Sender: TObject);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure Pgc_MediaChange(Sender: TObject);
      procedure Btn_ChangeVideoClick(Sender: TObject);
      procedure Btn_RemoveVideoClick(Sender: TObject);

   private

      FThemeNumber, FLanguage: Integer;
      FRootPath: string;
      FCurrentFolder: string;
      FImageFolder: string;
      FVideoFolder: string;
      FXmlImageFolderPath: string;
      FXmlVideoFolderPath: string;
      FIsLoading: Boolean;
      FGodMode, FAutoHash, FDelWoPrompt, FGenesisLogo,
      FShowTips, FFolderIsOnPi, FPiPrompts, FSysIsRecal,
      FPiLoadedOnce: Boolean;
      FRecalLogin, FRecalPwd, FRetroLogin, FRetroPwd: string;
      FSSLogin, FSSPwd: string;
      FScrapedGame: TGame;
      GSystemList: TObjectDictionary<string,TObjectList<TGame>>;

      FPrevWinControl: TWinControl;

      //Pour le scrape
      FPictureLinks: TObjectList<TMediaInfo>;
      FInfosList: TStringList;
      FMaxThreads, FThreadCount, FStartCount: Integer;
      FTempXmlPath: string;

      procedure LoadFromIni;
      procedure SaveToIni;
      procedure BuildSystemsList( aReload : Boolean = False );
      procedure LoadGamesList( const aSystem: string );
      procedure LoadGame( aGame: TGame );
      procedure ClearAllFields;
      procedure SaveChangesToGamelist( aScrape, aSavePic, aSaveInfos: Boolean );
      procedure EnableControls( aValue: Boolean );
      procedure EnableComponents( aValue: Boolean );
      procedure CheckIfChangesToSave;
      procedure ChangeImage( const aPath: string; aGame: TGame );
      procedure ChangeVideo( const aPath: string; aGame: TGame );
      procedure LoadSystemLogo( const aPictureName: string );
      procedure DeleteGame( aGame: TGame );
      procedure DeleteGamePicture;
      procedure DeleteGameVideo;
      procedure StartGameVideo( const aPath: string );
      procedure StopGameVideo;
      procedure CheckMenuItem( aNumber: Integer; aLang: Boolean = False );
      procedure RemoveRegionFromGameName( aGame: TGame; aStartPos: Integer );
      procedure ConvertFieldsCase( aGame: TGame; aUnique: Boolean = False;
                                   aUp: Boolean = False );
      procedure StopOrStartES( aStop, aRecal: Boolean );
      procedure DeleteDuplicates( const aSystem: string );
      procedure ReloadIni;
      procedure SetFavOrHidden( aFav, aValue: Boolean );
      procedure TransformGamesNames( aRemChars, aAddChars, aChangecase: Boolean;
                                     aNbStart, aNbEnd, aCaseIndex: Integer;
                                     const aStringStart, aStringEnd : string );
      procedure ExportToTxt;

      function getSystemKind: TSystemKind;
      function getCurrentFolderName: string;
      function GetCurrentLogoName: string;
      function GetCurrentSystemId: string;
      function GetCountryEnum( const aShortName: string ): TCountryName;
      function BuildGamesList( const aPathToFile: string ): TObjectList<TGame>;
      function FormatDateFromString( const aDate: string; aIso: Boolean = False ): string;
      function GetThemeEnum( aNumber: Integer ): TThemeName;
      function GetLangEnum( aNumber: Integer ): TLangName;
      function GetPhysicalRomPath( const aRomPath: string ): string;
      function GetPhysicalMediaPath( const aPath: string ): string;
      function MyMessageDlg( const Msg: string; DlgTypt: TmsgDlgType; button: TMsgDlgButtons;
                            Caption: array of string; dlgcaption: string ): Integer;

      //Méthodes relatives à l'onglet de scrape
      procedure ParseXml;
      procedure DisplayPictures;
      procedure FillFields;
      procedure EnableScrapeComponents( aValue: Boolean );
      procedure GetPictures;
      procedure GetPicture( aMedia: TMediaInfo );
      procedure ThreadTerminated( Sender: TObject );
      procedure EmptyScrapeFields;
      procedure ConvertScrapeToUpOrLow( aUp: Boolean = False );
      procedure UpdateVideo(aGame: TGame);

      function GetGameXml( const aSysId: string; aGame: TGame ): Boolean;
      function GetFileSize( const aPath: string ): string;

   public
      FProxyServer, FProxyUser,
      FProxyPwd, FProxyPort: string;
      FProxyUse: Boolean;
      FImgList: TObjectList<TImage>;
      procedure WarnUser( const aMessage: string );
      function SetFocusedControl( Control: TWinControl ): Boolean; override;

   end;

var
   Frm_Editor: TFrm_Editor;
   //lock pour le compteur de threads (empêche l'accés concurrent)
   CounterGuard: TCriticalSection;

implementation

{$R *.dfm}

function TFrm_Editor.SetFocusedControl(Control: TWinControl): Boolean;
begin
   if ( Control = Btn_SaveChanges ) and ( ActiveControl is TEdit ) then
      FPrevWinControl := ActiveControl;
   Result:= inherited SetFocusedControl(Control);
end;

function TFrm_Editor.GetPhysicalRomPath( const aRomPath: string ): string;
var
   _Pos: Integer;
begin
   _Pos:= Pos( '/', aRomPath );
   Result:= FRootPath + FCurrentFolder + Copy( aRomPath, Succ( _Pos ), ( aRomPath.Length - _Pos ) );
   Result:= StringReplace( Result, '/', '\', [rfReplaceAll] );
end;

function TFrm_Editor.GetPhysicalMediaPath( const aPath: string ): string;
var
   _Pos: Integer;
begin
   if aPath.IsEmpty then Result:= ''
   else begin
      _Pos:= Pos( '/', aPath );
      Result:= FRootPath + FCurrentFolder + Copy( aPath, Succ( _Pos ), ( aPath.Length - _Pos ) );
      Result:= StringReplace( Result, '/', '\', [rfReplaceAll] );
   end;
end;

//Formate correctement la date depuis la string récupérée du xml
//ou renvoie une date format Iso pour sauvegarde selon l'appel (aIso)
function TFrm_Editor.FormatDateFromString( const aDate: string; aIso: Boolean = False ): string;
var
   FullStr, Day, Month, Year: string;
   DayInt, MonthInt, YearInt: Integer;
begin
   FullStr:= aDate;
   Result:= '';

   //si on formate pour affichage et que la chaine passée
   //répond au critère
   if ( not aIso ) and ( FullStr.Contains( Cst_DateSuffix ) ) then begin
      SetLength( FullStr, 8 );
      Day:= Copy( FullStr, 7, 2 );
      Month:= Copy( FullStr, 5, 2 );
      Year:= Copy( FullStr, 1, 4 );
      if ( TryStrToInt( Day, DayInt ) ) and ( DayInt > 0 ) then
         Result:= Result + Day + '/';
      if ( TryStrToInt( Month, MonthInt ) ) and ( MonthInt > 0 ) then
         Result:= Result + Month + '/';
      if ( TryStrToInt( Year, YearInt ) ) and ( YearInt > 0 ) then
         Result:= Result + Year;

      //sinon si on formate pour enregistrement dans le .xml
      //et que la chaine ne contient que des chiffres ou /
   end else if aIso and ( TRegEx.IsMatch( FullStr, '^[0-9]' ) ) then begin

      //si la chaine fait 4 caractères de long
      if ( Length( FullStr) = 4 ) then
         Result:= FullStr + Cst_DateLongFill + Cst_DateSuffix;

      //si la chaine fait 7 caractères de long
      if ( Length( FullStr) = 7 ) then begin
         Month:= Copy( FullStr, 1, 2 );
         Year:= Copy( FullStr, 4, 4 );
         Result:= Year + Month + Cst_DateShortFill + Cst_DateSuffix;
      end;

      //si la chaine fait 10 caractères de long
      if ( Length( FullStr) = 10 ) then begin
         Day:= Copy( FullStr, 1, 2 );
         Month:= Copy( FullStr, 4, 2 );
         Year:= Copy( FullStr, 7, 4 );
         Result:= Year + Month + Day + Cst_DateSuffix;
      end;
   end;
end;

//Construction d'une messagedlg custom (pour pouvoir traduire les boutons)
function TFrm_Editor.MyMessageDlg(const Msg: string; DlgTypt: TmsgDlgType; button: TMsgDlgButtons;
                      Caption: array of string; dlgcaption: string ): Integer;
var
   aMsgdlg: TForm;
   ii: Integer;
   Dlgbutton: Tbutton;
   Captionindex: Integer;
begin
   aMsgdlg := CreateMessageDialog(  Msg, DlgTypt, button   );
   aMsgdlg.Caption := dlgcaption;
   aMsgdlg.BiDiMode := bdLeftToRight;
   Captionindex := 0;
   for ii:= 0 to Pred( aMsgdlg.ComponentCount ) do begin
      if (aMsgdlg.components[ii] is Tbutton) then Begin
         Dlgbutton:= Tbutton( aMsgdlg.Components[ii]   );
         if ( Captionindex <= High( Caption ) ) then
            Dlgbutton.Caption:= Caption[Captionindex];
         Inc( Captionindex );
      end;
   end;
   Result:= aMsgdlg.Showmodal;
end;

//Chargement des paramètres depuis le fichier INI
procedure TFrm_Editor.LoadFromIni;
var
   FileIni: TIniFile;
begin
   FileIni:= TIniFile.Create( ExtractFilePath( Application.ExeName ) + Cst_IniFilePath );
   try
      //On tent de lire les fichier ini, si on ne trouve pas on met tout à false par défaut
      FGodMode:= FileIni.ReadBool( Cst_IniOptions, Cst_IniGodMode, False );
      Mnu_GodMode.Checked:= FGodMode;
      Mnu_DeleteWoPrompt.Enabled:= FGodMode;
      Btn_Delete.Visible:= FGodMode;

      FAutoHash:= FileIni.ReadBool( Cst_IniOptions, Cst_IniAutoHash, False );
      Mnu_AutoHash.Checked:= FAutoHash;

      FDelWoPrompt:= FileIni.ReadBool( Cst_IniOptions, Cst_IniDelWoPrompt, False );
      Mnu_DeleteWoPrompt.Checked:= FDelWoPrompt;

      FPiPrompts:= FileIni.ReadBool( Cst_IniOptions, Cst_IniPiPrompts, False );
      Mnu_PiPrompts.Checked:= FPiPrompts;

      FGenesisLogo:= FileIni.ReadBool( Cst_IniOptions, Cst_IniGenesisLogo, False );
      Mnu_Genesis.Checked:= FGenesisLogo;

      FShowTips:= FileIni.ReadBool(  Cst_IniOptions, Cst_ShowTips, True );
      Mnu_ShowTips.Checked:= FShowTips;

      FThemeNumber:= FileIni.ReadInteger( Cst_IniOptions, Cst_ThemeNumber, 5 );
      FLanguage:= FileIni.ReadInteger( Cst_IniOptions, Cst_IniLanguage, 0 );

      FRecalLogin:= FileIni.ReadString( Cst_IniOptions, Cst_IniRecalLogin, Cst_RecalLogin);
      FRecalPwd:= FileIni.ReadString( Cst_IniOptions, Cst_IniRecalPwd, Cst_RecalPwd);
      FRetroLogin:= FileIni.ReadString( Cst_IniOptions, Cst_IniRetroLogin, Cst_RetroLogin);
      FRetroPwd:= FileIni.ReadString( Cst_IniOptions, Cst_IniRetroPwd, Cst_RetroPwd);

      FSSLogin:= FileIni.ReadString( Cst_IniOptions, Cst_IniSSUser, '');
      FSSPwd:= FileIni.ReadString( Cst_IniOptions, Cst_IniSSPwd, '');
      FProxyUser:= FileIni.ReadString( Cst_IniOptions, Cst_IniProxyUser, '');
      FProxyPwd:= FileIni.ReadString( Cst_IniOptions, Cst_IniProxyPwd, '');
      FProxyServer:= FileIni.ReadString( Cst_IniOptions, Cst_IniProxyServer, '');
      FProxyPort:= FileIni.ReadString( Cst_IniOptions, Cst_IniProxyPort, '0');
      FProxyUse:= FileIni.ReadBool( Cst_IniOptions, Cst_IniProxyUse, False);
   finally
      FileIni.Free;
   end;
end;

//Enregistrement des paramètres dans le fichier INI
procedure TFrm_Editor.SaveToIni;
var
   FileIni: TIniFile;
begin
   FileIni:= TIniFile.Create( ExtractFilePath( Application.ExeName ) + Cst_IniFilePath );
   try
      FileIni.WriteBool( Cst_IniOptions, Cst_IniGodMode, FGodMode );
      FileIni.WriteBool( Cst_IniOptions, Cst_IniAutoHash, FAutoHash );
      FileIni.WriteBool( Cst_IniOptions, Cst_IniDelWoPrompt, ( FGodMode and FDelWoPrompt ) );
      FileIni.WriteBool( Cst_IniOptions, Cst_IniGenesisLogo, FGenesisLogo );
      FileIni.WriteBool( Cst_IniOptions, Cst_ShowTips, FShowTips );
      FileIni.WriteBool( Cst_IniOptions, Cst_IniPiPrompts, FPiPrompts );
      FileIni.WriteInteger( Cst_IniOptions, Cst_ThemeNumber, FThemeNumber );
      FileIni.WriteInteger( Cst_IniOptions, Cst_IniLanguage, FLanguage );
      FileIni.WriteString( Cst_IniOptions, Cst_IniRecalLogin, FRecalLogin);
      FileIni.WriteString( Cst_IniOptions, Cst_IniRecalPwd, FRecalPwd);
      FileIni.WriteString( Cst_IniOptions, Cst_IniRetroLogin, FRetroLogin);
      FileIni.WriteString( Cst_IniOptions, Cst_IniRetroPwd, FRetroPwd);
      FileIni.WriteString( Cst_IniOptions, Cst_IniSSUser, FSSLogin);
      FileIni.WriteString( Cst_IniOptions, Cst_IniSSPwd, FSSPwd);
      FileIni.WriteString( Cst_IniOptions, Cst_IniProxyUser, FProxyUser);
      FileIni.WriteString( Cst_IniOptions, Cst_IniProxyPwd, FProxyPwd);
      FileIni.WriteString( Cst_IniOptions, Cst_IniProxyServer, FProxyServer);
      if ( FProxyPort.IsEmpty ) then FileIni.WriteString( Cst_IniOptions, Cst_IniProxyPort, '0' )
      else FileIni.WriteString( Cst_IniOptions, Cst_IniProxyPort, FProxyPort );
      FileIni.WriteBool( Cst_IniOptions, Cst_IniProxyUse, FProxyUse);
   finally
      FileIni.Free;
   end;
end;

//Recup l'enum du theme en fonction de l'entier du fichier ini
function TFrm_Editor.GetThemeEnum( aNumber: Integer ): TThemeName;
var
   _ThemeName: TThemeName;
begin
   Result:= tnCharcoalDarkSlate;
   for _ThemeName:= Low( TThemeName )to High( TThemeName ) do begin
      if ( aNumber = Ord( _ThemeName ) ) then begin
         Result:= _ThemeName;
         Break;
      end;
   end;
end;

//Recup de l'enum de la langue en fonction de l'entier du fichier ini
function TFrm_Editor.GetLangEnum( aNumber: Integer ): TLangName;
var
   _LangName: TLangName;
begin
   Result:= lnEnglish;
   for _LangName:= Low( TLangName ) to High( TLangName ) do begin
      if ( aNumber = Ord( _LangName ) ) then begin
         Result:= _LangName;
         Break;
      end;
   end;
end;

//Recup l'énum du pays (région) du jeu scrapé
function TFrm_Editor.GetCountryEnum( const aShortName: string ): TCountryName;
var
   _CountryName: TCountryName;
begin
   Result:= cnUnd;
   for _CountryName:= Low( TCountryName ) to High( TCountryName ) do begin
      if ( aShortName =  Cst_CountryName[_CountryName] ) then begin
         Result:= _CountryName;
         Break;
      end;
   end;
end;

//A l'ouverture du programme
procedure TFrm_Editor.FormCreate(Sender: TObject);
begin
   TranslateComponent( Self );
   FImgList:= TObjectList<TImage>.Create;
   FInfosList:= TStringList.Create( True );
   FPictureLinks:= TObjectList<TMediaInfo>.Create;
   Lbl_NbGamesFound.Caption:= '';
   GSystemList:= TObjectDictionary<string, TObjectList<TGame>>.Create([doOwnsValues]);
   LoadFromIni;
   TStyleManager.TrySetStyle( Cst_ThemeNameStr[GetThemeEnum( FThemeNumber )] );
   FPiLoadedOnce:= False;
   FTempXmlPath:= ExtractFilePath( Application.ExeName ) + Cst_TempXml;
   CounterGuard:= TCriticalSection.Create;
end;

//Met le focus sur le combo system à l'affichage de la fenêtre
procedure TFrm_Editor.FormShow(Sender: TObject);
var
   Frm_Help: TFrm_Help;
begin
   UseLanguage( Cst_LangNameStr[GetLangEnum( FLanguage )] );
   RetranslateComponent( Self );
   CheckMenuItem( Succ( FThemeNumber ) );
   CheckMenuItem( Succ( FLanguage ), True );
   if FShowTips then begin
      //Affiche la fenêtre "Help"
      Frm_Help:= TFrm_Help.Create(nil);
      try
         FShowTips:= Frm_Help.Execute( not FShowTips );
      finally
         Frm_Help.Free;
      end;
   end;
   Tbs_Scrape.TabVisible:= False;
   Mnu_ShowTips.Checked:= FShowTips;
   Lbx_Games.SetFocus;
end;

//Pour checker le menuitem du numéro de thème ou langue récupéré depuis le fichier ini
procedure TFrm_Editor.CheckMenuItem( aNumber: Integer; aLang: Boolean = False );
var
   _MenuItem: TMenuItem;
   _CompName: string;
begin
   if aLang then _CompName:= Cst_MenuLang + IntToStr( aNumber )
   else _CompName:= Cst_MenuTheme + IntToStr( aNumber );
   _MenuItem:= ( FindComponent( _CompName ) as TMenuItem ) ;
   _MenuItem.Checked:= True;
end;

//Action au click sur le menuitem "choose folder"
procedure TFrm_Editor.Mnu_ChoosefolderClick(Sender: TObject);
begin
   Img_BackGround.Visible:= True;
   EnableControls( False );
   Edt_Search.Enabled:= False;
   Lbl_Search.Enabled:= False;
   ClearAllFields;
   Lbx_Games.Items.Clear;
   BuildSystemsList;
   Btn_SaveChanges.Enabled:= False;
end;

//Action au click sur menuitem "Reload Systems"
procedure TFrm_Editor.Mnu_ReloadClick(Sender: TObject);
begin
   Img_BackGround.Visible:= True;
   EnableControls( False );
   Edt_Search.Enabled:= False;
   Lbl_Search.Enabled:= False;
   ClearAllFields;
   Lbx_Games.Items.Clear;
   BuildSystemsList( True );
   Btn_SaveChanges.Enabled:= False;
end;

//permet d'éxecuter la ligne de commande qui stop/start Emulation Station
//utilisé si on accède aux gamelist directement sur le Pi sinon les modifs ne
//sont pas prises en compte. Utilise le petit utilitaire plink.exe
procedure TFrm_Editor.StopOrStartES( aStop, aRecal: Boolean );
var
   _PathToPlink: string;
begin
   _PathToPlink:= ExtractFilePath( Application.ExeName ) + Cst_ResourcesFolder;
   if aStop then begin
      if aRecal then
         ShellExecute( 0, nil, 'cmd.exe', PChar( Cst_PlinkCommand + FRecalLogin +
                       Cst_PlinkCommandRecal + FRecalPwd +
                       Cst_PlinkCommandStop ), PChar( _PathToPlink ), SW_HIDE )
      else
         ShellExecute( 0, nil, 'cmd.exe', PChar( Cst_PlinkCommand + FRetroLogin +
                       Cst_PlinkCommandRetro + FRetroPwd +
                       Cst_PlinkCommandStop ), PChar( _PathToPlink ), SW_HIDE );
   end else begin
      if aRecal then
         ShellExecute( 0, nil, 'cmd.exe', PChar( Cst_PlinkCommand + FRecalLogin +
                       Cst_PlinkCommandRecal + FRecalPwd +
                       Cst_PlinkCommandStart ), PChar( _PathToPlink ), SW_HIDE )
      else
         ShellExecute( 0, nil, 'cmd.exe', PChar( Cst_PlinkCommand + FRetroLogin +
                       Cst_PlinkCommandRetro + FRetroPwd +
                       Cst_PlinkCommandStart ), PChar( _PathToPlink ), SW_HIDE )
   end;
end;

//Construction de la liste des systèmes trouvés (et des listes de jeux associées)
procedure TFrm_Editor.BuildSystemsList( aReload : Boolean = False );
var
   _GameListPath: string;
   Info: TSearchRec;
   IsFound: Boolean;
   ValidFolderCount: Integer;
   TmpList: TObjectList<TGame>;
   _system: TSystemKindObject;
begin
   //on met à vide le chemin de base et le logo systeme
   //FRootPath:= '';
   Img_System.Picture.Graphic:= nil;

   //On vide le combobox des systèmes
   //Et on désactive les Controls non nécessaires
   Cbx_Systems.Items.Clear;
   Cbx_Systems.Enabled:= False;
   Cbx_Filter.Enabled:= False;
   Lbl_SelectSystem.Enabled:= False;
   Lbl_Filter.Enabled:= False;
   Lbl_NbGamesFound.Caption:= '';
   Btn_ChangeAll.Enabled:= False;
   Cbx_Hidden.ItemIndex:= -1;
   Cbx_Favorite.ItemIndex:= -1;
   Edt_Search.Text:= '';

   //On vide la liste globale des systèmes (cas 2eme ouverture)
   GSystemList.Clear;

   //On met le compteur de dossiers valides à 0
   ValidFolderCount:= 0;

   //On sélectionne le dossier parent où se trouvent les dossiers de systèmes
   if ( not aReload ) then begin
      Mnu_Reload.Enabled:= False;
      if ( OpenDialog.Execute ) then
         //On récupère le chemin vers le dossier parent
         FRootPath:= IncludeTrailingPathDelimiter( OpenDialog.FileName )
      else
         Exit;
   end;

   //On check si le dossier n'est pas vide
   IsFound:= ( FindFirst( FRootPath + '*.*', faAnyFile, Info) = 0 );

   //Si le dossier est vide : message utilisateur
   if not IsFound then begin
      ShowMessage( Rst_WrongFolder );
      Exit;
   end;

   //On boucle sur les dossiers trouvés pour les lister
   while IsFound do begin

      //Si le dossier trouvé ne commence pas par un . et qu'il contient
      //bien un fichier gamelist.xml alors on crée la liste de jeux
      if ( (Info.Attr and faDirectory) <> 0 ) and
         ( Info.Name[1] <> '.' ) and
         ( FileExists( FRootPath + IncludeTrailingPathDelimiter( Info.Name ) +
                       Cst_GameListFileName ) ) then begin

         //on chope le nom du dossier en cours pour construire les chemins
         FCurrentFolder:= IncludeTrailingPathDelimiter( Info.Name );

         //Ici on récupère le chemin vers le fichier gamelist.xml
         _GameListPath:= FRootPath + FCurrentFolder + Cst_GameListFileName;

         //On tente de construire la liste des jeux depuis le .xml
         TmpList:= BuildGamesList( _GameListPath );

         //Si la liste n'est pas vide, on traite, sinon on zappe
         if Assigned( TmpList ) then begin

            //On construit la liste des jeux du système
            //et on joute le système à la liste globale de systèmes
            GSystemList.Add( Info.Name, TmpList );

            //On ajoute ensuite le nom du systeme au combobox des systemes trouvés
            _system:= TSystemKindObject.Create( Info.Name );
            if ( _system.FSystemKind = skOther ) then
               Cbx_Systems.Items.AddObject( Info.Name, _system )
            else if ( _system.FSystemKind = skMegaDrive ) and FGenesisLogo then
               Cbx_Systems.Items.AddObject( Cst_SystemKindStr[skGenesis], _system )
            else
               Cbx_Systems.Items.AddObject( Cst_SystemKindStr[_system.FSystemKind], _system );

            //On incrémente le compteur de dossier système valides
            Inc( ValidFolderCount );
         end;
      end;

      //Enfin, on passe au dossier suivant (s'il y en a un)
      IsFound:= ( FindNext(Info) = 0 );
   end;
   FindClose(Info);

   //Si le compteur de dossier valide est à zéro, message utilisateur
   if ( ValidFolderCount = 0 ) then begin
      ShowMessage( Rst_WrongFolder );
      Screen.Cursor:= crDefault;
      Exit;

      //On active le Combobox des systemes si au moins un systeme a été trouvé
      //Idem pour le listbox des jeux du systeme et on charge la liste du premier système
   end else begin

      //si le dossier sélectionné se trouve sur le Pi,
      //on prévient l'utilisateur qu'on va stopper ES
      FFolderIsOnPi:= FRootPath.StartsWith( Cst_Recalbox ) or
                      FRootPath.StartsWith( Cst_Retropie );

      if FFolderIsOnPi and not FPiLoadedOnce then begin
         FPiLoadedOnce:= True;
         if not FPiPrompts then
            MyMessageDlg( Rst_StopES, mtInformation, [mbOK], [Rst_Ok], Rst_Info );
         if FRootPath.StartsWith( Cst_Recalbox ) then begin
            StopOrStartES( True, True );
            FSysIsRecal:= True;
         end else begin
            StopOrStartES( True, False );
            FSysIsRecal:= False;
         end;
      end;

      Cbx_Systems.Enabled:= True;
      Lbl_SelectSystem.Enabled:= Cbx_Systems.Enabled;
      Cbx_Filter.Enabled:= Cbx_Systems.Enabled;
      Lbl_Filter.Enabled:= Cbx_Systems.Enabled;
      Cbx_Systems.ItemIndex:= 0;
      EnableControls( True );
      Cbx_Filter.ItemIndex:= 0;
      Edt_Search.Enabled:= True;
      Lbl_Search.Enabled:= True;
      LoadGamesList( getCurrentFolderName );
      Mnu_Reload.Enabled:= True;

      //On remet le curseur par défaut
      Screen.Cursor:= crDefault;
   end;
end;

//Construction de la liste des jeux (objets) pour un systeme donné
function TFrm_Editor.BuildGamesList( const aPathToFile: string ): TObjectList<TGame>;

   //Permet de s'assurer que le noeud cherché existe, et si ce n'est pas le cas
   //renvoie chaine vide, sinon renvoie la valeur texte du noeud
   function GetNodeValue( aNode: IXMLNode; const aNodeName: string ): string;
   begin
      Result:= '';
      if Assigned( aNode.ChildNodes.FindNode( aNodeName ) ) then
         Result:= aNode.ChildNodes.Nodes[aNodeName].Text;
   end;

var
   _GameList: TObjectList<TGame>;
   _Game: TGame;
   _Node: IXmlNode;
begin
   //on met le curseur sablier pour montrer que ça bosse.
   Screen.Cursor:= crHourGlass;

   //Initialisation à nil au cas où liste de jeux vide
   Result:= nil;

   //On ouvre et active le gamelist.xml pour le parcourir
   XMLDoc.FileName:= aPathToFile;
   XMLDoc.Active:= True;

   //On cherche le premier "jeu"
   _Node := XMLDoc.DocumentElement.ChildNodes.FindNode( Cst_Game );

   //Si pas de jeu trouvé on sort et on renvoie nil
   if not Assigned( _Node ) then Exit;

   //On crée la liste d'objets TGame
   _GameList:= TObjectList<TGame>.Create( True );

   //Ensuite on boucle sur tous les jeux et pour chaque jeu
   //on crée un objet TGame qu'on renseigne et ajoute à la _Gamelist
   repeat
      //On ne crée un "jeu" que si le noeud n'est pas vide.
      if _Node.HasChildNodes then begin

         //Création de l'objet TGame et passage des infos en argument
         _Game:= TGame.Create( GetNodeValue( _Node, Cst_Path ),
                               GetNodeValue( _Node, Cst_Name ),
                               GetNodeValue( _Node,Cst_Description ),
                               GetNodeValue( _Node, Cst_ImageLink ),
                               GetNodeValue( _Node, Cst_VideoLink ),
                               GetNodeValue( _Node, Cst_Rating ),
                               GetNodeValue( _Node, Cst_Developer ),
                               GetNodeValue( _Node, Cst_Publisher ),
                               GetNodeValue( _Node, Cst_Genre ),
                               GetNodeValue( _Node, Cst_Players ),
                               FormatDateFromString( GetNodeValue( _Node, Cst_ReleaseDate ) ),
                               GetNodeValue( _Node, Cst_Region ),
                               GetNodeValue( _Node, Cst_Playcount ),
                               GetNodeValue( _Node, Cst_LastPlayed ),
                               GetNodeValue( _Node, Cst_Hidden ),
                               GetNodeValue( _Node, Cst_Favorite ) );

         _Game.PhysicalRomPath:= GetPhysicalRomPath( _Game.RomPath );
         _Game.PhysicalImagePath:= GetPhysicalMediaPath( _Game.ImagePath );
         _Game.PhysicalVideoPath:= GetPhysicalMediaPath( _Game.VideoPath );
         _Game.IsOrphan:= not FileExists( _Game.PhysicalRomPath );

         //On ajoute à la _Gamelist
         _GameList.Add( _Game );
      end;

      //On passe au jeu suivant
      _Node := _Node.NextSibling;
   until ( _Node = nil );

   XMLDoc.Active:= False;

   Result:= _GameList;
end;

//Action à la sélection d'un filtre
procedure TFrm_Editor.Cbx_FilterChange(Sender: TObject);
begin
   LoadGamesList( getCurrentFolderName );
end;

//Action à la sélection d'un item du combobox systemes
procedure TFrm_Editor.Cbx_SystemsChange(Sender: TObject);
begin
   EmptyScrapeFields;
   Edt_Search.Text:= '';
   LoadGamesList( getCurrentFolderName );
end;

//quand on tape du texte dans le champ de recherche
procedure TFrm_Editor.Edt_SearchChange(Sender: TObject);
begin
   LoadGamesList( getCurrentFolderName );
end;

//Je fais une procédure juste pour activer les controls
//pour pas se les retaper à chaque changement d'état
procedure TFrm_Editor.EnableControls( aValue: Boolean );
begin
   Lbl_Name.Enabled:= aValue;
   Lbl_Genre.Enabled:= aValue;
   Lbl_Rating.Enabled:= aValue;
   Lbl_Developer.Enabled:= aValue;
   Lbl_Publisher.Enabled:= aValue;
   Lbl_Players.Enabled:= aValue;
   Lbl_Date.Enabled:= aValue;
   Lbl_Description.Enabled:= aValue;
   Lbl_Region.Enabled:= aValue;
   Lbl_Hidden.Enabled:= aValue;
   Lbl_Favorite.Enabled:= aValue;

   Btn_ChangeImage.Enabled:= aValue;
   Btn_ChangeVideo.Enabled:= aValue;
   Btn_Scrape.Enabled:= aValue;
   Btn_RemovePicture.Enabled:= aValue;
   Btn_RemoveVideo.Enabled:= aValue;
   Btn_SetDefaultPicture.Enabled:= aValue;
   Btn_MoreInfos.Enabled:= aValue;
   Btn_Delete.Enabled:= aValue;

   Mnu_System.Enabled:= aValue or not ( GSystemList.Count = 0 );
   Mnu_Game.Enabled:= aValue and not ( Lbx_Games.Items.Count = 0 );

   Edt_Name.Enabled:= aValue;
   Edt_Genre.Enabled:= aValue;
   Edt_Rating.Enabled:= aValue;
   Edt_Region.Enabled:= aValue;
   Edt_Developer.Enabled:= aValue;
   Edt_Publisher.Enabled:= aValue;
   Edt_ReleaseDate.Enabled:= aValue;
   Edt_NbPlayers.Enabled:= aValue;
   Edt_RomPath.Enabled:= aValue;
   Mmo_Description.Enabled:= aValue;

   Cbx_Hidden.Enabled:= aValue;
   Cbx_Favorite.Enabled:= aValue;
   Chk_ListByRom.Enabled:= aValue;
   Chk_ManualCRC.Enabled:= Btn_Scrape.Enabled;

   Tbs_Scrape.TabVisible:= aValue;
end;

//Action lorsqu'on change le contenu d'un des champs
procedure TFrm_Editor.FieldChange(Sender: TObject);
begin
   CheckIfChangesToSave;
end;

//On vérifie si il y a des changements pour activer le bouton
// "Save changes" ou non
procedure TFrm_Editor.CheckIfChangesToSave;
var
   _Game: TGame;
begin
   if FIsLoading then Exit;

   _Game:= ( Lbx_Games.Items.Objects[Lbx_Games.ItemIndex] as TGame );
   Btn_SaveChanges.Enabled:= not ( _Game.Name.Equals( Edt_Name.Text ) ) or
                             not ( _Game.Genre.Equals( Edt_Genre.Text ) ) or
                             not ( _Game.Rating.Equals( Edt_Rating.Text ) ) or
                             not ( _Game.Players.Equals( Edt_NbPlayers.Text ) ) or
                             not ( _Game.Developer.Equals( Edt_Developer.Text ) ) or
                             not ( _Game.Publisher.Equals( Edt_Publisher.Text ) ) or
                             not ( _Game.ReleaseDate.Equals( Edt_ReleaseDate.Text ) ) or
                             not ( _Game.Description.Equals( Mmo_Description.Text ) ) or
                             not ( _Game.Region.Equals( Edt_Region.Text ) ) or
                             not ( _Game.Hidden = Cbx_Hidden.ItemIndex ) or
                             not ( _Game.Favorite = Cbx_Favorite.ItemIndex );
end;

//Chargement de la liste des jeux d'un système dans le listbox des jeux
procedure TFrm_Editor.LoadGamesList( const aSystem: string );

   //permet de récupérer le chemin vers les images (du xml)
   procedure GetImageFolder( aGame: TGame );
   var
      StartPos, EndPos: Integer;
   begin
      StartPos:= Succ( Pos( '/', aGame.ImagePath ) );
      EndPos:= LastDelimiter( '/', aGame.ImagePath );
      FImageFolder:= Copy( aGame.ImagePath, StartPos, ( EndPos - StartPos ) );

      FXmlImageFolderPath:= Copy( aGame.ImagePath, 1, EndPos );
   end;

   procedure GetVideoFolder( aGame: TGame );
   var
      StartPos, EndPos: Integer;
   begin
      StartPos:= Succ( Pos( '/', aGame.VideoPath ) );
      EndPos:= LastDelimiter( '/', aGame.VideoPath );
      FVideoFolder:= Copy( aGame.VideoPath, StartPos, ( EndPos - StartPos ) );

      FXmlVideoFolderPath:= Copy( aGame.VideoPath, 1, EndPos );
   end;

   //Permet de vérifier si l'image existe "physiquement"
   //car il se peut que le lien soit renseigné mais que l'image
   //n'existe pas dans le dossier des images...
   function CheckIfFileMissing( const aLink: string ): Boolean;
   begin
      Result:= aLink.IsEmpty or not ( FileExists( aLink ) );
   end;

var
   _TmpList: TObjectList<TGame>;
   _TmpGame: TGame;
   _FilterIndex: Integer;
   _ImageFolderFound: Boolean;
   _VideoFolderFound: Boolean;
begin
   //on stocke le "numero" de filtre.
   _FilterIndex:= Cbx_Filter.ItemIndex;
   _ImageFolderFound:= False;
   _VideoFolderFound:= False;
   StopGameVideo();

   //On essaye de récupérer la liste de jeux du système choisi
   if GSystemList.TryGetValue( aSystem, _TmpList ) then begin

      //On charge le logo du systeme choisi
      if ( GetCurrentLogoName = Cst_SystemKindImageNames[skMegaDrive] ) and
         FGenesisLogo then
         LoadSystemLogo( Cst_SystemKindImageNames[skGenesis] )
      else
         LoadSystemLogo( GetCurrentLogoName );

      //on récupère le nom du dossier de roms chargé
      FCurrentFolder:= IncludeTrailingPathDelimiter( getCurrentFolderName );

      //On désactive les évènements sur les changements dans les champs
      //Sinon ça pète quand on change de système (indice hors limite)
      FIsLoading:= True;

      //On commence par vider le listbox
      Lbx_Games.Items.Clear;

      //On boucle sur la liste de jeux pour ajouter les noms
      //dans le listbox de la liste des jeux
      for _TmpGame in _TmpList do begin

         //Récup du lien vers les images pour ce système (lien xml)
         if not ( _TmpGame.ImagePath.IsEmpty ) and
            not _ImageFolderFound then begin
            GetImageFolder( _TmpGame );
            _ImageFolderFound:= True;
         end;

         if not ( _TmpGame.VideoPath.IsEmpty ) and
            not _VideoFolderFound then begin
            GetVideoFolder( _TmpGame );
            _VideoFolderFound:= True;
         end;

         //Attention usine à gaz booléenne pour gérer les filtres ^^
         if ( _FilterIndex = 0 ) or
            ( ( _FilterIndex = 1 ) and ( CheckIfFileMissing( _TmpGame.PhysicalImagePath ) ) ) or
            ( ( _FilterIndex = 2 ) and ( CheckIfFileMissing( _TmpGame.PhysicalVideoPath ) ) ) or
            ( ( _FilterIndex = 3 ) and ( _TmpGame.ReleaseDate.IsEmpty ) ) or
            ( ( _FilterIndex = 4 ) and ( _TmpGame.Players.IsEmpty ) ) or
            ( ( _FilterIndex = 5 ) and ( _TmpGame.Rating.IsEmpty ) ) or
            ( ( _FilterIndex = 6 ) and ( _TmpGame.Developer.IsEmpty ) ) or
            ( ( _FilterIndex = 7 ) and ( _TmpGame.Publisher.IsEmpty ) ) or
            ( ( _FilterIndex = 8 ) and ( _TmpGame.Description.IsEmpty ) ) or
            ( ( _FilterIndex = 9 ) and ( _TmpGame.Genre.IsEmpty ) ) or
            ( ( _FilterIndex = 10 ) and ( _TmpGame.Region.IsEmpty ) ) or
            ( ( _FilterIndex = 11 ) and ( _TmpGame.Hidden = 1 ) ) or
            ( ( _FilterIndex = 12 ) and ( _TmpGame.Favorite = 1 ) ) or
            ( ( _FilterIndex = 13 ) and ( _TmpGame.IsOrphan ) ) then begin

            if ( not Chk_ListByRom.Checked ) and
               ( ( Edt_Search.Text = '' ) or
               ContainsText( _TmpGame.Name, Edt_Search.Text ) ) then begin
               Lbx_Games.Items.AddObject( _TmpGame.Name, _TmpGame )

            end else if ( Chk_ListByRom.Checked ) then begin
               if ( Chk_FullRomName.Checked ) and
                  ( ( Edt_Search.Text = '' ) or
                  ContainsText( _TmpGame.RomPath, Edt_Search.Text ) ) then
                  Lbx_Games.Items.AddObject( StringReplace( _TmpGame.RomPath, './', '', [] ), _TmpGame )
               else if ( ( Edt_Search.Text = '' ) or
                  ContainsText( _TmpGame.RomName, Edt_Search.Text ) ) then
                  Lbx_Games.Items.AddObject( _TmpGame.RomName, _TmpGame )
            end;
         end
      end;

      //On indique le nombre de jeux trouvés
      if Cbx_Filter.ItemIndex = 0 then
         Lbl_NbGamesFound.Caption:= IntToStr( Lbx_Games.Items.Count ) + Rst_GamesFound
      else
         Lbl_NbGamesFound.Caption:= IntToStr( Lbx_Games.Items.Count ) + ' / ' +
                                    IntToStr( _TmpList.Count ) + Rst_GamesFound;

      //On met le focus sur le premier jeu de la liste
      ClearAllFields;

      //Si il y a des jeux dans la liste on affiche auto le premier
      if ( Lbx_Games.Items.Count > 0 ) then begin
         EnableControls( True );
         Lbx_Games.Selected[0]:= True;
         LoadGame( ( Lbx_Games.Items.Objects[0] as TGame ) );
         Btn_ChangeAll.Enabled:= ( Cbx_Filter.ItemIndex = 1 );
      end else begin
         Btn_ChangeAll.Enabled:= False;
         EnableControls( False );
      end;

      //on remet les évènements sur les champs
      FIsLoading:= False;
   end;
end;

//Charge le logo du système sélectionné dans le TImage prévu
procedure TFrm_Editor.LoadSystemLogo( const aPictureName: string );
var
   _Image: TPngImage;
begin
   _Image:= TPngImage.Create;
   try
      _Image.LoadFromFile( ExtractFilePath( Application.ExeName ) +
                           Cst_LogoPicsFolder + aPictureName );
      Img_System.Picture.Graphic:= _Image;
   finally
      _Image.Free;
   end;
end;

//Click sur un jeu dans la liste
procedure TFrm_Editor.Lbx_GamesClick(Sender: TObject);
begin
   ClearAllFields;
   EmptyScrapeFields;
   if ( Lbx_Games.SelCount > 1 ) then begin
      EnableComponents( False );
   end else begin
      EnableComponents( True );
      LoadGame( ( Lbx_Games.Items.Objects[Lbx_Games.ItemIndex] as TGame ) );
   end;
end;

//Désactivation des composants quand multiselect
procedure TFrm_Editor.EnableComponents( aValue: Boolean );
begin
   Edt_Name.Enabled:= aValue;
   Edt_Genre.Enabled:= aValue;
   Edt_Rating.Enabled:= aValue;
   Edt_Region.Enabled:= aValue;
   Edt_Developer.Enabled:= aValue;
   Edt_Publisher.Enabled:= aValue;
   Edt_NbPlayers.Enabled:= aValue;
   Edt_ReleaseDate.Enabled:= aValue;
   Edt_RomPath.Enabled:= aValue;

   Mmo_Description.Enabled:= aValue;

   Cbx_Hidden.Enabled:= aValue;
   Cbx_Favorite.Enabled:= aValue;
   Chk_ListByRom.Enabled:= aValue;

   Lbl_Name.Enabled:= aValue;
   Lbl_Date.Enabled:= aValue;
   Lbl_Genre.Enabled:= aValue;
   Lbl_Region.Enabled:= aValue;
   Lbl_Players.Enabled:= aValue;
   Lbl_Rating.Enabled:= aValue;
   Lbl_Hidden.Enabled:= aValue;
   Lbl_Favorite.Enabled:= aValue;
   Lbl_Description.Enabled:= aValue;
   Lbl_Publisher.Enabled:= aValue;

   Lbl_Developer.Enabled:= aValue;
   Btn_MoreInfos.Enabled:= aValue;
   Btn_Delete.Enabled:= aValue;
   Btn_Scrape.Enabled:= aValue;
   Btn_ChangeImage.Enabled:= aValue;
   Btn_ChangeVideo.Enabled:= aValue;
   Btn_RemovePicture.Enabled:= aValue;
   Btn_RemoveVideo.Enabled:= aValue;
   Btn_SetDefaultPicture.Enabled:= aValue;
   Btn_ChangeAll.Enabled:= aValue and ( Cbx_Filter.ItemIndex = 1) and ( Lbx_Games.Items.Count > 0 );

   Mnu_Game.Enabled:= aValue;
   Mnu_System.Enabled:= aValue;
   Mnu_Selection.Enabled:= not aValue;

   Chk_ManualCRC.Enabled:= Btn_Scrape.Enabled;

   Tbs_Scrape.TabVisible:= aValue;
end;

procedure TFrm_Editor.StartGameVideo(const aPath: string);
begin
   Img_BackgroundVideo.Visible := false;
   Wmp_Video.Visible := true;
   Wmp_Video.URL := 'file://' + aPath;
   Wmp_Video.controls.play;
end;

procedure TFrm_Editor.StopGameVideo;
begin
   Img_BackgroundVideo.Visible := true;
   Wmp_Video.Visible := false;
   Wmp_Video.controls.stop;
   Wmp_Video.URL := '';
end;

procedure TFrm_Editor.UpdateVideo(aGame: TGame);
begin
   // Start playing video if the video exists and the video tab is active
   // else stop it
   if (Pgc_Media.ActivePage = Tbs_Video)
      and not (aGame.VideoPath.IsEmpty)
      and FileExists(aGame.PhysicalVideoPath) then
   begin
      StartGameVideo(aGame.PhysicalVideoPath);
   end else begin
      StopGameVideo();
   end;

   // Enable Remove video button if video exists -independent of active tab
   if not (aGame.VideoPath.IsEmpty)
      and FileExists(aGame.PhysicalVideoPath) then
   begin
      Btn_RemoveVideo.Enabled:= True;
   end else begin
      Btn_RemoveVideo.Enabled:= False;
   end;
end;

procedure TFrm_Editor.Pgc_MediaChange(Sender: TObject);
begin
  if ( Lbx_Games.Count > 0 ) then
     UpdateVideo( ( Lbx_Games.Items.Objects[Lbx_Games.ItemIndex] as TGame ) );
end;

//Chargement dans les différents champs des infos du jeu sélectionné
procedure TFrm_Editor.LoadGame( aGame: TGame );
var
   _Image: TPngImage;
   _ImageJpg: TJPEGImage;
begin
   //on remet les évènements sur les champs
   FIsLoading:= True;

   Img_BackGround.Visible:= True;
   Edt_Name.Text:= aGame.Name;
   Edt_Rating.Text:= aGame.Rating;
   Edt_ReleaseDate.Text:= aGame.ReleaseDate;
   Edt_Publisher.Text:= aGame.Publisher;
   Edt_Developer.Text:= aGame.Developer;
   Edt_NbPlayers.Text:= aGame.Players;
   Edt_Genre.Text:= aGame.Genre;
   Mmo_Description.Text:= aGame.Description;
   Edt_Region.Text:= aGame.Region;
   Cbx_Hidden.ItemIndex:= aGame.Hidden;
   Cbx_Favorite.ItemIndex:= aGame.Favorite;
   Edt_RomPath.Text:= aGame.RomPath;
   Edt_ScrapeRomPath.Text:= aGame.RomPath;

   //on remet les évènements sur les champs
   FIsLoading:= False;

   UpdateVideo(aGame);

   if not ( aGame.ImagePath.IsEmpty ) and
          FileExists( aGame.PhysicalImagePath ) then begin
      if ( ExtractFileExt( aGame.PhysicalImagePath ) = '.png' ) then begin
         _Image:= TPngImage.Create;
         try
            _Image.LoadFromFile( aGame.PhysicalImagePath );
            Img_Game.Picture.Graphic:= _Image;
            Btn_RemovePicture.Enabled:= True;
            //on affiche l'image background que si le jeu n'a pas d'image
            Img_BackGround.Visible:= ( Img_Game.Picture.Graphic = nil );
            Btn_Scrape.Enabled:= FileExists( aGame.PhysicalRomPath );
            Chk_ManualCRC.Enabled:= Btn_Scrape.Enabled;
            Exit;
         finally
            _Image.Free;
         end;
      end else if ( ExtractFileExt( aGame.PhysicalImagePath ) = '.jpg' ) or
                  ( ExtractFileExt( aGame.PhysicalImagePath ) = '.jpeg' ) then begin
         _ImageJpg:= TJPEGImage.Create;
         try
            _ImageJpg.LoadFromFile( aGame.PhysicalImagePath );
            Img_Game.Picture.Graphic:= _ImageJpg;
            Btn_RemovePicture.Enabled:= True;
            //on affiche l'image background que si le jeu n'a pas d'image
            Img_BackGround.Visible:= ( Img_Game.Picture.Graphic = nil );
            Btn_Scrape.Enabled:= FileExists( aGame.PhysicalRomPath );
            Chk_ManualCRC.Enabled:= Btn_Scrape.Enabled;
            Exit;
         finally
            _ImageJpg.Free;
         end;
      end;
   end else begin
      Btn_RemovePicture.Enabled:= False;
      Btn_Scrape.Enabled:= FileExists( aGame.PhysicalRomPath );
      Chk_ManualCRC.Enabled:= Btn_Scrape.Enabled;
   end;
end;

//Action au click sur bouton "change image"
//Ouvre une boite de dialogue pour changer l'image du jeu sélectionné
procedure TFrm_Editor.Btn_ChangeImageClick(Sender: TObject);
var
   _Game: TGame;
begin
   OpenFile.Filter:= 'Images|*.png;*.jpg;*.jpeg';
   if OpenFile.Execute and ( OpenFile.FileName <> '' ) then begin
      _Game:= ( Lbx_Games.Items.Objects[Lbx_Games.ItemIndex] as TGame );
      ChangeImage( OpenFile.FileName, _Game );
      LoadGame( _Game );
      Lbx_Games.SetFocus;
   end;
end;

procedure TFrm_Editor.Btn_ChangeVideoClick(Sender: TObject);
var
   _Game: TGame;
begin
   OpenFile.Filter:= 'Videos|*.mp4';
   if OpenFile.Execute and ( OpenFile.FileName <> '' ) then begin
      _Game:= ( Lbx_Games.Items.Objects[Lbx_Games.ItemIndex] as TGame );
      ChangeVideo( OpenFile.FileName, _Game );
      LoadGame( _Game );
      Lbx_Games.SetFocus;
   end;
end;

//Action au click sur bouton "change picture to default"
//Change l'image actuelle du jeu sélectionné pour celle par défaut
procedure TFrm_Editor.Btn_SetDefaultPictureClick(Sender: TObject);
var
   PathToDefault: string;
   _Game: TGame;
begin
   _Game:= ( Lbx_Games.Items.Objects[Lbx_Games.ItemIndex] as TGame );

   //On construit le lien vers l'image défaut selon le système
   PathToDefault:= ExtractFilePath(Application.ExeName) +
                   Cst_DefaultPicsFolderPath +
                   getCurrentFolderName +
                   Cst_DefaultImageNameSuffix;

   //si l'image defaut du systeme n'existe pas on prend la générique
   if not FileExists( PathToDefault ) then
      PathToDefault:= ExtractFilePath(Application.ExeName) +
                      Cst_DefaultPicsFolderPath +
                      Cst_DefaultImageName;

   ChangeImage( PathToDefault, _Game );
   LoadGame( _Game );
   Lbx_Games.SetFocus;
end;

//Action au click "change all missing to default"
//Assigne l'image defaut du système à tous les jeux qui n'ont pas d'image
procedure TFrm_Editor.Btn_ChangeAllClick(Sender: TObject);
var
   ii: Integer;
   PathToDefault: string;
   _Game: TGame;
begin
   //On construit le lien vers l'image défaut selon le système
   PathToDefault:= ExtractFilePath(Application.ExeName) +
                   Cst_DefaultPicsFolderPath + '\' +
                   getCurrentFolderName +
                   Cst_DefaultImageNameSuffix;

    //si l'image defaut du systeme n'existe pas on prend la générique
    if not FileExists( PathToDefault ) then
       PathToDefault:= ExtractFilePath(Application.ExeName) +
                       Cst_DefaultPicsFolderPath + '\' +
                       Cst_DefaultImageName;

   //et on boucle sur tous les jeux de la liste pour remplacer l'image
   ProgressBar.Visible:= True;
   ProgressBar.Max:= Pred( Lbx_Games.Items.Count );
   ProgressBar.Position:= 0;
   for ii:= 0 to Pred( Lbx_Games.Items.Count ) do begin
      _Game:= ( Lbx_Games.Items.Objects[ii] as TGame );
      ChangeImage( PathToDefault, _Game );
      ProgressBar.Position:= ( ProgressBar.Position + 1 );
   end;
   ProgressBar.Visible:= False;
   LoadGamesList( getCurrentFolderName );
   Lbx_Games.SetFocus;
end;

//Remplace l'image actuelle du jeu (par autre ou défaut).
procedure TFrm_Editor.ChangeImage( const aPath: string; aGame: TGame );
var
   _Image: TPngImage;
   _ImageJpg: TJPEGImage;
   _ImageLink: string;
   _Node: IXMLNode;
   _NodeAdded: Boolean;
begin
   _NodeAdded:= False;
   Screen.Cursor:= crHourGlass;

   //on détermine ensuite l'extension du fichier chargé et
   //on crée l'objet qui va bien pour affecter au TImage
   if ( ExtractFileExt( aPath ) = '.png' ) then begin
      _Image:= TPngImage.Create;
      try
         _Image.LoadFromFile( aPath );
         Img_Game.Picture.Graphic:= _Image;
      finally
         _Image.Free;
      end;
   end else begin
      _ImageJpg:= TJPEGImage.Create;
      try
         _ImageJpg.LoadFromFile( aPath );
         Img_Game.Picture.Graphic:= _ImageJpg;
      finally
         _ImageJpg.Free;
      end;
   end;

   //on sauvegarde l'image dans le dossier avec les autres !!
   // et on ajoute le chemin dans le xml
   Img_Game.Picture.SaveToFile( FRootPath + FCurrentFolder + FImageFolder +
                                '\' + aGame.RomNameWoExt + Cst_ImageSuffixPng );

   //On ouvre le fichier xml
   XMLDoc.LoadFromFile( FRootPath + FCurrentFolder + Cst_GameListFileName );

   //On récupère le premier noeud "game"
   _Node := XMLDoc.DocumentElement.ChildNodes.FindNode( Cst_Game );

   //Et on boucle pour trouver le noeud avec le bon Id
   repeat
      if ( _Node.ChildNodes.Nodes[Cst_Path].Text = aGame.RomPath ) then Break;
      _Node := _Node.NextSibling;
   until not Assigned( _Node );

   //on écrit le chemin vers l'image
   _ImageLink:= FXmlImageFolderPath + aGame.RomNameWoExt + Cst_ImageSuffixPng;

   if not Assigned( _Node.ChildNodes.FindNode( Cst_ImageLink ) ) then begin
      _Node.AddChild( Cst_ImageLink );
      _NodeAdded:= True;
   end;
   _Node.ChildNodes.Nodes[Cst_ImageLink].Text:= _ImageLink;

   //On enregistre le fichier.
   if _NodeAdded then begin
      XMLDoc.XML.Text:= Xml.Xmldoc.FormatXMLData( XMLDoc.XML.Text );
      XMLDoc.Active:= True;
   end;
   XMLDoc.SaveToFile( FRootPath + FCurrentFolder + Cst_GameListFileName );
   XMLDoc.Active:= False;

   //Et enfin on met à jour l'objet TGame associé
   aGame.ImagePath:= _ImageLink;
   aGame.PhysicalImagePath:= FRootPath + FCurrentFolder +
                             IncludeTrailingPathDelimiter( FImageFolder ) +
                             aGame.RomNameWoExt + Cst_ImageSuffixPng;

   Screen.Cursor:= crDefault;
end;

// Replace the video of a game.
procedure TFrm_Editor.ChangeVideo( const aPath: string; aGame: TGame );
var
   _VideoLink: string;
   _Node: IXMLNode;
   _NodeAdded: Boolean;
begin
   _NodeAdded:= False;
   Screen.Cursor:= crHourGlass;

   StopGameVideo();

   // Create the video directory if not existing
   if not TDirectory.Exists(FRootPath + FCurrentFolder + FVideoFolder ) then
      TDirectory.CreateDirectory(FRootPath + FCurrentFolder + FVideoFolder );

   // Copy the video to the rompath
   TFile.Copy(aPath, FRootPath + FCurrentFolder + FVideoFolder +
                     '\' + aGame.RomNameWoExt + Cst_VideoSuffixMp4, true );

   // Open the gamelist XML file
   XMLDoc.LoadFromFile( FRootPath + FCurrentFolder + Cst_GameListFileName );

   // Get the first game node
   _Node := XMLDoc.DocumentElement.ChildNodes.FindNode( Cst_Game );

   // And we loop to find the node with the right Id
   repeat
      if ( _Node.ChildNodes.Nodes[Cst_Path].Text = aGame.RomPath ) then Break;
      _Node := _Node.NextSibling;
   until not Assigned( _Node );

   // We write the path to the video
   _VideoLink:= FXmlVideoFolderPath + aGame.RomNameWoExt + Cst_VideoSuffixMp4;

   if not Assigned( _Node.ChildNodes.FindNode( Cst_VideoLink ) ) then begin
      _Node.AddChild( Cst_VideoLink );
      _NodeAdded:= True;
   end;
   _Node.ChildNodes.Nodes[Cst_VideoLink].Text:= _VideoLink;

   // Save the file
   if _NodeAdded then begin
      XMLDoc.XML.Text:= Xml.Xmldoc.FormatXMLData( XMLDoc.XML.Text );
      XMLDoc.Active:= True;
   end;
   XMLDoc.SaveToFile( FRootPath + FCurrentFolder + Cst_GameListFileName );
   XMLDoc.Active:= False;

   // And finally we update the associated TGame object
   aGame.VideoPath:= _VideoLink;
   aGame.PhysicalVideoPath:= FRootPath + FCurrentFolder +
                             IncludeTrailingPathDelimiter( FVideoFolder ) +
                             aGame.RomNameWoExt + Cst_VideoSuffixMp4;

   Screen.Cursor:= crDefault;
end;

//Au click sur le bouton delete picture
procedure TFrm_Editor.Btn_RemovePictureClick(Sender: TObject);
begin
   DeleteGamePicture;
   Lbx_Games.SetFocus;
end;

procedure TFrm_Editor.Btn_RemoveVideoClick(Sender: TObject);
begin
   DeleteGameVideo;
   Lbx_Games.SetFocus;
end;

//Supprime l'image d'un jeu (dans le xml et physiquement)
procedure TFrm_Editor.DeleteGamePicture;
var
   _Game: TGame;
   _GameListPath: string;
   _Node: IXMLNode;
begin
   //on commence par récupérer l'objet TGame correspondant
   _Game:= ( Lbx_Games.Items.Objects[Lbx_Games.ItemIndex] as TGame );

   //on construit le chemin vers le gamelist.xml
   _GameListPath:= FRootPath + FCurrentFolder + Cst_GameListFileName;

   //On ouvre le fichier xml
   XMLDoc.LoadFromFile( _GameListPath );

   //On récupère le premier noeud "game"
   _Node := XMLDoc.DocumentElement.ChildNodes.FindNode( Cst_Game );

   //Et on boucle pour trouver le bon noeud
   repeat
      if ( _Node.ChildNodes.Nodes[Cst_Path].Text = _Game.RomPath ) then Break;
         _Node := _Node.NextSibling;
   until not Assigned( _Node );

   //on vire le noeud du fichier xml
   _Node.ChildNodes.FindNode( Cst_ImageLink ).Text:= '';
   XMLDoc.Active:= True;
   XMLDoc.SaveToFile( _GameListPath );
   XMLDoc.Active:= False;

   //On supprime l'image du jeu
   DeleteFile( _Game.PhysicalImagePath );

   //on vide l'image jeu
   Img_Game.Picture.Graphic:= nil;

   //on update l'objet TGame
   _Game.ImagePath:= '';

   //on recharge le jeu pour refléter les changements
   LoadGame( _Game );
end;

// Remove the image from a game (in the XML and physically)
procedure TFrm_Editor.DeleteGameVideo;
var
   _Game: TGame;
   _GameListPath: string;
   _Node: IXMLNode;
begin
   Screen.Cursor:= crHourGlass;

   // Start by retrieving the corresponding TGame object
   _Game:= ( Lbx_Games.Items.Objects[Lbx_Games.ItemIndex] as TGame );

   // Build the path to the gamelist.xml
   _GameListPath:= FRootPath + FCurrentFolder + Cst_GameListFileName;

   // We open the xml file
   XMLDoc.LoadFromFile( _GameListPath );

   // Get the first "game" node
   _Node := XMLDoc.DocumentElement.ChildNodes.FindNode( Cst_Game );

   // And we loop to find the right node
   repeat
      if ( _Node.ChildNodes.Nodes[Cst_Path].Text = _Game.RomPath ) then Break;
         _Node := _Node.NextSibling;
   until not Assigned( _Node );

   // Remove the node from the xml file
   _Node.ChildNodes.FindNode( Cst_VideoLink ).Text:= '';
   XMLDoc.Active:= True;
   XMLDoc.SaveToFile( _GameListPath );
   XMLDoc.Active:= False;

   StopGameVideo();

   // Remove physical file
   DeleteFile( _Game.PhysicalVideoPath );

   // Update the TGame object
   _Game.VideoPath:= '';

   Screen.Cursor:= crDefault;

   // Reload the game to reflect the changes
   LoadGame( _Game );
end;

//Récupère le nom d'enum du systeme sélectionné dans le combobox
function TFrm_Editor.getSystemKind: TSystemKind;
begin
   Result:= TSystemKindObject( Cbx_Systems.Items.Objects[Cbx_Systems.ItemIndex] ).FSystemKind;
end;

//Récupère le nom du dossier du systeme selectionné dans le combobox
function TFrm_Editor.getCurrentFolderName: string;
begin
   if getSystemKind = skOther then
      Result:= Cbx_Systems.Text
   else
      Result:= Cst_SystemKindFolderNames[getSystemKind];
end;

//Récupère le nom du logo du système sélectionné dans le combobox
function TFrm_Editor.GetCurrentLogoName: string;
begin
   Result:= Cst_SystemKindImageNames[getSystemKind];
end;

//Récupère le systemid du système sélectionné dans le combobox
function TFrm_Editor.GetCurrentSystemId: string;
begin
   Result:= Cst_SystemKindId[getSystemKind];
end;

//Action au click sur bouton "save changes"
procedure TFrm_Editor.Btn_SaveChangesClick( Sender: TObject );
begin
   SaveChangesToGamelist( False, False, True );
   Btn_SaveChanges.Enabled:= False;
//   Lbx_Games.SetFocus;
   if Assigned( FPrevWinControl ) then
      FPrevWinControl.SetFocus;
end;

//vidage des champs de scrape
procedure TFrm_Editor.EmptyScrapeFields;
begin
   Edt_ScrapeGenre.Text:= '';
   Edt_ScrapeName.Text:= '';
   Edt_ScrapePlayers.Text:= '';
   Edt_ScrapeDate.Text:= '';
   Edt_ScrapeRegion.Text:= '';
   Edt_ScrapeDeveloper.Text:= '';
   Edt_ScrapePublisher.Text:= '';
   Edt_ScrapeRating.Text:= '';
   Mmo_ScrapeDescription.Text:= '';
   Img_Scrape.Picture.Graphic:= nil;
   Img_ScrapeBackground.Visible:= True;

   EnableScrapeComponents( False );

   FInfosList.Clear;
   FPictureLinks.Clear;
   FImgList.Clear;
end;

//Enregistre les changements effectués pour le jeu dans le fichier .xml
//et rafraichit le listbox si besoin
procedure TFrm_Editor.SaveChangesToGamelist( aScrape, aSavePic, aSaveInfos: Boolean );

   //Permet de s'assurer q'un noeud existe
   function NodeExists( aNode: IXMLNode; const aNodeName: string ): Boolean;
   begin
      Result:= False;
      if Assigned( aNode.ChildNodes.FindNode( aNodeName ) ) then
         Result:= True;
   end;

var
   _Node: IXMLNode;
   _Game: TGame;
   _GameListPath, _Date, _NewName, _ImageLink,
   Name, Region, Rating, Developer, Players,
   Description, Publisher, Date, Genre: string;
   _NodeAdded, _NameChanged: Boolean;
   _Index: Integer;
begin
   Screen.Cursor:= crHourGlass;

   _NodeAdded:= False;
   _NameChanged:= False;

   //On récupère le chemin du fichier gamelist.xml
   _GameListPath:= FRootPath + FCurrentFolder + Cst_GameListFileName;

   //On récupère l'objet TGame qu'on souhaite modifier
   if aScrape then _Game:= FScrapedGame
   else _Game:= ( Lbx_Games.Items.Objects[Lbx_Games.ItemIndex] as TGame );

   _Index:= Lbx_Games.ItemIndex;

   //On ouvre le fichier xml
   XMLDoc.LoadFromFile( _GameListPath );

   //On récupère le premier noeud "game"
   _Node := XMLDoc.DocumentElement.ChildNodes.FindNode( Cst_Game );
   if not Assigned( _Node) then Exit;

   //Et on boucle pour trouver le bon noeud
   repeat
      if ( _Node.ChildNodes.Nodes[Cst_Path].Text = _Game.RomPath ) then Break;
      _Node:= _Node.NextSibling;
   until not Assigned( _Node );
   if not Assigned( _Node ) then Exit;

   if aSaveInfos then begin
      //On peut maintenant mettre les infos à jour dans le xml si besoin
      if aScrape then Name:= Edt_ScrapeName.Text
      else Name:= Edt_Name.Text;
      if not ( _Game.Name.Equals( Name ) ) then begin
         _Node.ChildNodes.Nodes[Cst_Name].Text:= Name;
         _Game.Name:= Name;
         Lbx_Games.Items[Lbx_Games.ItemIndex]:= Name;
         _NameChanged:= True;
         _NewName:= Name;
      end;

      if aScrape then Genre:= Edt_ScrapeGenre.Text
      else Genre:= Edt_Genre.Text;
      if not ( _Game.Genre.Equals( Genre ) ) then begin
         if not ( NodeExists( _Node, Cst_Genre ) ) then begin
            _Node.AddChild( Cst_Genre );
            _NodeAdded:= True;
         end;
         _Node.ChildNodes.Nodes[Cst_Genre].Text:= Genre;
         _Game.Genre:= Genre;
      end;

      if aScrape then Rating:= Edt_ScrapeRating.Text
      else Rating:= Edt_Rating.Text;
      if not ( _Game.Rating.Equals( Rating ) ) then begin
         if not ( NodeExists( _Node, Cst_Rating ) ) then begin
            _Node.AddChild( Cst_Rating );
            _NodeAdded:= True;
         end;
         _Node.ChildNodes.Nodes[Cst_Rating].Text:= Rating;
         _Game.Rating:= Rating;
      end;

      if aScrape then Players:= Edt_ScrapePlayers.Text
      else Players:= Edt_NbPlayers.Text;
      if not ( _Game.Players.Equals( Players ) ) then begin
         if not ( NodeExists( _Node, Cst_Players ) ) then begin
            _Node.AddChild( Cst_Players );
            _NodeAdded:= True;
         end;
         _Node.ChildNodes.Nodes[Cst_Players].Text:= Players;
         _Game.Players:= Players;
      end;

      if aScrape then Developer:= Edt_ScrapeDeveloper.Text
      else Developer:= Edt_Developer.Text;
      if not ( _Game.Developer.Equals( Developer ) ) then begin
         if not ( NodeExists( _Node, Cst_Developer ) ) then begin
            _Node.AddChild( Cst_Developer );
            _NodeAdded:= True;
         end;
         _Node.ChildNodes.Nodes[Cst_Developer].Text:= Developer;
         _Game.Developer:= Developer;
      end;

      if aScrape then Date:= Edt_ScrapeDate.Text
      else Date:= Edt_ReleaseDate.Text;
      if not ( _Game.ReleaseDate.Equals( Date ) ) then begin
         if not ( NodeExists( _Node, Cst_ReleaseDate ) ) then begin
            _Node.AddChild( Cst_ReleaseDate );
            _NodeAdded:= True;
         end;
         _Date:= FormatDateFromString( Date, True );
         if not _Date.IsEmpty then
            _Game.ReleaseDate:= Date
         else begin
            _Game.ReleaseDate:= '';
            if aScrape then Edt_ScrapeDate.Text:= ''
            else Edt_ReleaseDate.Text:= '';
         end;
         _Node.ChildNodes.Nodes[Cst_ReleaseDate].Text:= _Date;
      end;

      if aScrape then Publisher:= Edt_ScrapePublisher.Text
      else Publisher:= Edt_Publisher.Text;
      if not ( _Game.Publisher.Equals( Publisher ) ) then begin
         if not ( NodeExists( _Node, Cst_Publisher ) ) then begin
            _Node.AddChild( Cst_Publisher );
            _NodeAdded:= True;
         end;
         _Node.ChildNodes.Nodes[Cst_Publisher].Text:= Publisher;
         _Game.Publisher:= Publisher;
      end;

      if aScrape then Description:= Mmo_ScrapeDescription.Text
      else Description:= Mmo_Description.Text;
      if not ( _Game.Description.Equals( Description ) ) then begin
         if not ( NodeExists( _Node, Cst_Description ) ) then begin
            _Node.AddChild( Cst_Description );
            _NodeAdded:= True;
         end;
         _Node.ChildNodes.Nodes[Cst_Description].Text:= Description;
         _Game.Description:= Description;
      end;

      if aScrape then Region:= Edt_ScrapeRegion.Text
      else Region:= Edt_Region.Text;
      if not ( _Game.Region.Equals( Region ) ) then begin
         if not ( NodeExists( _Node, Cst_Region ) ) then begin
            _Node.AddChild( Cst_Region );
            _NodeAdded:= True;
         end;
         _Node.ChildNodes.Nodes[Cst_Region].Text:= Region;
         _Game.Region:= Region;
      end;

      if not aScrape then begin
         if not ( _Game.Hidden = Cbx_Hidden.ItemIndex ) then begin
            if not ( NodeExists( _Node, Cst_Hidden ) ) then begin
               _Node.AddChild( Cst_Hidden );
               _NodeAdded:= True;
            end;
            if ( Cbx_Hidden.ItemIndex = 0 ) then _Node.ChildNodes.Nodes[Cst_Hidden].Text:= Cst_False
            else _Node.ChildNodes.Nodes[Cst_Hidden].Text:= Cst_True;
            _Game.Hidden:= Cbx_Hidden.ItemIndex;
         end;

         if not ( _Game.Favorite = Cbx_Favorite.ItemIndex ) then begin
            if not ( NodeExists( _Node, Cst_Favorite ) ) then begin
               _Node.AddChild( Cst_Favorite );
               _NodeAdded:= True;
            end;
            if ( Cbx_Favorite.ItemIndex = 0 ) then _Node.ChildNodes.Nodes[Cst_Favorite].Text:= Cst_False
            else _Node.ChildNodes.Nodes[Cst_Favorite].Text:= Cst_True;
            _Game.Favorite:= Cbx_Favorite.ItemIndex;
         end;
      end;
   end;

   if ( aSavePic ) and ( Img_Scrape.Picture.Graphic <> nil ) then begin
      Img_Scrape.Picture.SaveToFile( FRootPath + FCurrentFolder + FImageFolder +
                                     '\' + FScrapedGame.RomNameWoExt + Cst_ImageSuffixPng );

      _ImageLink:= FXmlImageFolderPath + FScrapedGame.RomNameWoExt + Cst_ImageSuffixPng;

      if not Assigned( _Node.ChildNodes.FindNode( Cst_ImageLink ) ) then begin
         _Node.AddChild( Cst_ImageLink );
         _NodeAdded:= True;
      end;
      _Node.ChildNodes.Nodes[Cst_ImageLink].Text:= _ImageLink;
   end;

   //Et enfin on enregistre le fichier (en formatant correctement si on a ajouté un noeud)
   if _NodeAdded then begin
      Screen.Cursor:= crHourGlass;
      XMLDoc.XML.Text:= Xml.Xmldoc.FormatXMLData( XMLDoc.XML.Text );
      Screen.Cursor:= crDefault;
      XMLDoc.Active:= True;
   end;
   XMLDoc.SaveToFile( _GameListPath );
   XMLDoc.Active:= False;

   //on rafraichit la liste
   LoadGamesList( getCurrentFolderName );

   if ( Lbx_Games.Count > 0 ) then Lbx_Games.Selected[0]:= False;

   //et on remet la sélection sur le bon item si possible
   if ( Lbx_Games.Count = 0 ) then
      Lbx_Games.ItemIndex:= -1
   else if ( Lbx_Games.Count > 0 ) then begin
      if _NameChanged then begin
         if ( Lbx_Games.Items.IndexOf( _NewName ) >=0 ) then
            Lbx_Games.ItemIndex:= Lbx_Games.Items.IndexOf( _NewName )
         else
         Lbx_Games.ItemIndex:= Pred( _Index );
      end else if ( _Index >= Lbx_Games.Count ) then begin
         Lbx_Games.ItemIndex:= Pred( Lbx_Games.Count );
      end else
      Lbx_Games.ItemIndex:= _Index;
   end;

   if aScrape then begin
      Pgc_Editor.ActivePage:= Tbs_Main;
      Tbs_ScrapeHide( nil );
   end;

   if ( Lbx_Games.Count > 0 ) then begin
      Lbx_Games.Selected[Lbx_Games.ItemIndex]:= True;
      LoadGame( ( Lbx_Games.Items.Objects[Lbx_Games.ItemIndex] as TGame ) );
   end;

   Screen.Cursor:= crDefault;
end;

//Diverse sections du menu sélection
procedure TFrm_Editor.Mnu_SetFavoriteClick(Sender: TObject);
begin
   SetFavOrHidden( True, True );
end;

procedure TFrm_Editor.Mnu_SetHiddenClick(Sender: TObject);
begin
   SetFavOrHidden( False, True );
end;

procedure TFrm_Editor.Mnu_SetNoFavoriteClick(Sender: TObject);
begin
   SetFavOrHidden( True, False );
end;

procedure TFrm_Editor.Mnu_SetNoHiddenClick(Sender: TObject);
begin
   SetFavOrHidden( False, False );
end;

//Passe la sélection en favoris ou hidden (et inversement)
procedure TFrm_Editor.SetFavOrHidden( aFav, aValue: Boolean );

   //Permet de s'assurer q'un noeud existe
   function NodeExists( aNode: IXMLNode; const aNodeName: string ): Boolean;
   begin
      Result:= False;
      if Assigned( aNode.ChildNodes.FindNode( aNodeName ) ) then
         Result:= True;
   end;

var
   _Node: IXMLNode;
   _GameListPath: string;
   _NodeAdded: Boolean;
   _Game: TGame;
   ii: Integer;
begin
   _NodeAdded:= False;
   //On récupère le chemin du fichier gamelist.xml
   _GameListPath:= FRootPath + FCurrentFolder + Cst_GameListFileName;

   //On ouvre le fichier xml
   XMLDoc.LoadFromFile( _GameListPath );

   Screen.Cursor:= crHourGlass;
   ProgressBar.Visible:= True;
   ProgressBar.Position:= 0;
   ProgressBar.Max:= Lbx_Games.SelCount;

   //on boucle sur les jeux sélectionnés
   for ii:= 0 to Pred( Lbx_Games.Items.Count ) do begin
      if ( Lbx_Games.Selected[ii] ) then begin

         //On récupère le jeu correspondant
         _Game:= ( Lbx_Games.Items.Objects[ii] as TGame );

         //On récupère le premier noeud "game"
         _Node := XMLDoc.DocumentElement.ChildNodes.FindNode( Cst_Game );

         //Et on boucle pour trouver le bon noeud
         repeat
            if ( _Node.ChildNodes.Nodes[Cst_Path].Text = _Game.RomPath ) then Break;
            _Node := _Node.NextSibling;
         until not Assigned( _Node );

         if aFav then begin
            if not ( NodeExists( _Node, Cst_Favorite ) ) then begin
               _Node.AddChild( Cst_Favorite );
               _NodeAdded:= True;
            end;
            if aValue then _Node.ChildNodes.Nodes[Cst_Favorite].Text:= Cst_True
            else _Node.ChildNodes.Nodes[Cst_Favorite].Text:= Cst_False;
            _Game.Favorite:= Ord( aValue );
         end else begin
            if not ( NodeExists( _Node, Cst_Hidden ) ) then begin
               _Node.AddChild( Cst_Hidden );
               _NodeAdded:= True;
            end;
            if aValue then _Node.ChildNodes.Nodes[Cst_Hidden].Text:= Cst_True
            else _Node.ChildNodes.Nodes[Cst_Hidden].Text:= Cst_False;
            _Game.Hidden:= Ord( aValue );
         end;

         ProgressBar.Position:= ProgressBar.Position + 1;

      end;
   end;

   ProgressBar.Visible:= False;

   if _NodeAdded then begin
      XMLDoc.XML.Text:= Xml.Xmldoc.FormatXMLData( XMLDoc.XML.Text );
      XMLDoc.Active:= True;
   end;
   XMLDoc.SaveToFile( _GameListPath );
   XMLDoc.Active:= False;

   //on rafraichit la liste
   LoadGamesList( getCurrentFolderName );

   Screen.Cursor:= crDefault;
end;

//Action au click sur le bouton delete this game
procedure TFrm_Editor.Btn_DeleteClick(Sender: TObject);
var
   _Index: Integer;
begin
   if FDelWoPrompt or
      ( MyMessageDlg( Rst_DeleteWarning, mtInformation,
                    [mbYes, mbNo], [Rst_Yes, Rst_No], Rst_Info ) = mrYes ) then begin
      //on mémorise l'index du listbox pour remettre à la fin
      _Index:= Lbx_Games.ItemIndex;
      //on supprime le jeu
      DeleteGame( ( Lbx_Games.Items.Objects[Lbx_Games.ItemIndex] as TGame ) );
      //et on remet la sélection sur le jeu précédent le supprimé( si possible )
      if ( ( _Index = 0 ) and ( Lbx_Games.Count = 0 ) ) or
         ( ( _Index > 1 ) and ( Lbx_Games.Count > 1 ) ) then
         Lbx_Games.ItemIndex:= Pred( _Index )
      else Lbx_Games.ItemIndex:= _Index;
      //et on charge les infos du jeu (si liste non vide)
      if ( Lbx_Games.Count > 0 ) then
         LoadGame( ( Lbx_Games.Items.Objects[Lbx_Games.ItemIndex] as TGame ) );
      Lbx_Games.SetFocus;
      Lbx_Games.Selected[Lbx_Games.ItemIndex]:= True;
      if ( Lbx_Games.ItemIndex > 0 ) then Lbx_Games.Selected[0]:= False;
   end;
end;

//Au click sur le menu item delete orphans
procedure TFrm_Editor.Mnu_DeleteOrphansClick(Sender: TObject);
var
   _List: TObjectList<TGame>;
   ii: Integer;
begin
   //on boucle sur les jeux de la liste pour supprimer les orphelins.
   GSystemList.TryGetValue( getCurrentFolderName, _List );
   Screen.Cursor:= crHourGlass;
   ProgressBar.Visible:= True;
   ProgressBar.Max:= Pred( _List.Count );
   ProgressBar.Position:= 0;
   for ii:= Pred( _List.Count ) downto 0 do begin
      if _List.Items[ii].IsOrphan then
         DeleteGame( _List.Items[ii] );
      ProgressBar.Position:= ( ProgressBar.Position + 1);
   end;
   ProgressBar.Visible:= False;
   Screen.Cursor:= crDefault;
end;

//Supprime un jeu du gamelist et physiquement sur le disque (ou carte SD ou clé...)
procedure TFrm_Editor.DeleteGame( aGame: TGame );
var
   _Node: IXMLNode;
   _GameListPath: string;
   _List: TObjectList<TGame>;
begin
   //on construit le chemin vers le gamelist.xml
   _GameListPath:= FRootPath + FCurrentFolder + Cst_GameListFileName;

   //on chope la liste de jeux correspondante
   GSystemList.TryGetValue( getCurrentFolderName, _List );

    //On ouvre le fichier xml
    XMLDoc.LoadFromFile( _GameListPath );

    //On récupère le premier noeud "game"
    _Node := XMLDoc.DocumentElement.ChildNodes.FindNode( Cst_Game );

    //Et on boucle pour trouver le bon noeud
    repeat
       if ( _Node.ChildNodes.Nodes[Cst_Path].Text = aGame.RomPath ) then Break;
       _Node := _Node.NextSibling;
    until not Assigned( _Node );

    //on vire le noeud du fichier xml
    XMLDoc.DocumentElement.ChildNodes.Remove( _Node );
    XMLDoc.Active:= True;
    XMLDoc.SaveToFile( _GameListPath );
    XMLDoc.Active:= False;

    //On supprime l'image du jeu
    DeleteFile( aGame.PhysicalImagePath );

    // Delete video
    DeleteFile( aGame.PhysicalVideoPath );

    //suppression du jeu physiquement (action spéciale pour PSX)
    if ( getSystemKind = skPS ) then begin
       DeleteFile( StringReplace( aGame.PhysicalRomPath, '.cue', '.bin', [rfReplaceAll] ) );
       DeleteFile( StringReplace( aGame.PhysicalRomPath, '.bin', '.cue', [rfReplaceAll] ) );
    end else
       DeleteFile( aGame.PhysicalRomPath );

    //Suppression du jeu dans sa liste mère
    _List.Remove( aGame );

    //et mise à jour de l'affichage du listbox pour prendre en compte la suppression
    LoadGamesList( getCurrentFolderName );
end;

//au click sur le menu itzm delete duplicates
procedure TFrm_Editor.Mnu_DeleteDuplicatesClick(Sender: TObject);
begin
   DeleteDuplicates( getCurrentFolderName );
end;

//Delete duplicates in the gamelist.xml
procedure TFrm_Editor.DeleteDuplicates( const aSystem: string );
var
   _NodeList: IXMLNodeList;
   _Node1, _Node2: IXMLNode;
   ii, jj, Count: Integer;
   _List: TObjectList<TGame>;
   _GameListPath: string;
begin
   //on commence par vider les champs
   Lbx_Games.Clear;
   ClearAllFields;

   //on construit le chemin vers le gamelist.xml
   _GameListPath:= FRootPath + FCurrentFolder + Cst_GameListFileName;

   //On ouvre le fichier xml
   XMLDoc.LoadFromFile( _GameListPath );

   //on l'active
   XMLDoc.Active:= True;

   //On récupère la liste de noeuds "game"
   _NodeList:= XMLDoc.DocumentElement.ChildNodes;
   Count:= _NodeList.Count;

   //on active la progressbar
   Screen.Cursor:= crHourGlass;
   ProgressBar.Visible:= True;
   ProgressBar.Max:= Pred( Count );
   ProgressBar.Position:= 0;

   //on boucle sur tous les noeuds pour check si doublon
   //si c'est le cas on supprime
   for ii:= Pred( Count ) downto 0 do begin
      _Node1:= _NodeList.Nodes[ii];
      for jj:= 0 to Pred( ii ) do begin
         _Node2:= _NodeList.Nodes[jj];
         if ( _Node1.ChildNodes.FindNode( Cst_Path ).Text =
              _Node2.ChildNodes.FindNode( Cst_Path ).Text ) then begin
            _NodeList.Remove( _Node1 );
            Break;
         end;
      end;
      ProgressBar.Position:= ( ProgressBar.Position + 1 );
   end;

   //on désactive la progressbar
   ProgressBar.Visible:= False;

   //ensuite on sauvegarde le gamelist nettoyé
   XMLDoc.SaveToFile( _GameListPath );
   XMLDoc.Active:= False;

   //on supprime la liste de jeu de la liste générale des sytèmes
   //et on la reconstruit et ajoute
   GSystemList.Remove( aSystem );
   _List:= BuildGamesList( _GameListPath );
   GSystemList.Add( aSystem, _List );

   //on recharge la liste des jeux
   LoadGamesList( aSystem );
   Screen.Cursor:= crDefault;
end;

//Vidage de tous les champs et de l'image
procedure TFrm_Editor.ClearAllFields;
begin
   //On désactive les évènements sur les changements dans les champs
   FIsLoading:= True;

   Edt_Name.Text:= '';
   Edt_Rating.Text:= '';
   Edt_ReleaseDate.Text:= '';
   Edt_Publisher.Text:= '';
   Edt_Developer.Text:= '';
   Edt_NbPlayers.Text:= '';
   Edt_Genre.Text:= '';
   Edt_Region.Text:= '';
   Edt_RomPath.Text:= '';
   Mmo_Description.Text:= '';
   Img_Game.Picture.Graphic:= nil;
   Cbx_Hidden.ItemIndex:= -1;
   Cbx_Favorite.ItemIndex:= -1;

   //on remet les évènements sur les champs
   FIsLoading:= False;
end;

//Au click sur la checkbox "list by rom name"
procedure TFrm_Editor.Chk_FullRomNameClick(Sender: TObject);
begin
   LoadGamesList( getCurrentFolderName );
end;

procedure TFrm_Editor.Chk_ListByRomClick(Sender: TObject);
begin
   Chk_FullRomName.Enabled:= Chk_ListByRom.Checked;
   LoadGamesList( getCurrentFolderName );
end;

//Au click sur le menuitem godmode on change la visibilité du bouton delete
procedure TFrm_Editor.Mnu_GodModeClick(Sender: TObject);
begin
   Btn_Delete.Visible:= Mnu_GodMode.Checked;
   FGodMode:= Mnu_GodMode.Checked;
   Mnu_DeleteWoPrompt.Enabled:= FGodMode;
   if not FGodMode then begin
      Mnu_DeleteWoPrompt.Checked:= False;
      FDelWoPrompt:= False;
   end;
end;

procedure TFrm_Editor.Mnu_GenesisClick(Sender: TObject);
var
   ii: Integer;
begin
   FGenesisLogo:= Mnu_Genesis.Checked;

   //on boucle sur les items du combo pour trouver le bon et changer son nom
   for ii:= 0 to Pred( Cbx_Systems.Items.Count ) do begin
      if ( ( Cbx_Systems.Items.Objects[ii] as TSystemKindObject).FSystemKind = skMegadrive ) then begin
         if FGenesisLogo then
            Cbx_Systems.Items[ii]:= Cst_SystemKindStr[skGenesis]
         else if not FGenesisLogo then
            Cbx_Systems.Items[ii]:= Cst_SystemKindStr[skMegaDrive];
         Break;
      end;
   end;

   //et on recharge la liste
   Cbx_Systems.ItemIndex:= ii;
   LoadGamesList( getCurrentFolderName );
end;

//Au click sur Menuitem autohash
procedure TFrm_Editor.Mnu_AutoHashClick(Sender: TObject);
begin
   FAutoHash:= Mnu_AutoHash.Checked;
end;

//Au click sur le menu item Del Without Prompt
procedure TFrm_Editor.Mnu_DeleteWoPromptClick(Sender: TObject);
begin
   FDelWoPrompt:= Mnu_DeleteWoPrompt.Checked;
end;

//Au click sur le menu item export to txt file
procedure TFrm_Editor.Mnu_ExportTxtClick(Sender: TObject);
begin
   ExportToTxt;
end;

//Permet d'exporter la liste des jeux du système courant dans un fichier txt
//trié par ordre alphabétique avec délimiteur par lettre
procedure TFrm_Editor.ExportToTxt;
var
   FirstCharRef, FirstCharCurrent: string;
   SortedList, FormatedList: TStringList;
   SystemList: TObjectList<TGame>;
   Game: TGame;
   ii: Integer;
begin
   //on récupère la liste du système courant
   GSystemList.TryGetValue( getCurrentFolderName, SystemList );

   //On crée la stringlist triée et on la remplit avec noms des jeux.
   SortedList:= TStringList.Create;
   SortedList.Sorted:= True;
   SortedList.Duplicates:= dupAccept;
   //on crée la liste finale formatée pour export
   FormatedList:= TStringList.Create;
   try
      for Game in SystemList do begin
         if Chk_ListByRom.Checked then SortedList.Add( Game.RomName )
         else SortedList.Add( Game.Name );
      end;

      //on chope le premier caractère du premier élément de la liste triée
      FirstCharRef:= SortedList[0][1];
      FormatedList.Add( '---------- ' + AnsiUpperCase( FirstCharRef ) + ' ----------' );
      FormatedList.Add( sLineBreak );
      //ici on boucle sur la liste triée pour remplir la liste formatée
      for ii:= 0 to Pred( SortedList.Count ) do begin
         FirstCharCurrent:= SortedList[ii][1];
         if ( FirstCharCurrent = FirstCharRef ) then
            FormatedList.Add( SortedList[ii] )
         else begin
            FirstCharRef:= FirstCharCurrent;
            FormatedList.Add( sLineBreak );
            FormatedList.Add( '---------- ' + AnsiUpperCase( FirstCharRef ) + ' ----------' );
            FormatedList.Add( sLineBreak );
            FormatedList.Add( SortedList[ii] );
         end;
      end;

      //et on demande à l'utilisateur où il veut sauvegarder et avec quel nom
      if SaveDialog.Execute then
         FormatedList.SaveToFile( SaveDialog.FileName + Cst_TxtExtension );

   finally
      //et enfin on libère tout ce petit monde
      SortedList.Free;
      FormatedList.Free;
   end;
end;

//au click sur le menu item configure SSH
procedure TFrm_Editor.Mnu_ConfigSSHClick(Sender: TObject);
var
   Frm_ConfigSSH: TFrm_ConfigureSSH;
begin
   //on affiche la fenêtre pour saisir les id de connexion SSH
   Frm_ConfigSSH:= TFrm_ConfigureSSH.Create( nil );
   try
      Frm_ConfigSSH.Execute( FRecalLogin, FRecalPwd, FRetroLogin, FRetroPwd );
   finally
      Frm_ConfigSSH.Free;
   end;
end;

//Au click sur menu item configure network
procedure TFrm_Editor.Mnu_ConfigureNetworkClick(Sender: TObject);
var
   Frm_Network: TFrm_Network;
begin
   //on affiche la fenêtre pour saisir les id screenscraper et proxy
   Frm_Network:= TFrm_Network.Create( nil );
   try
      Frm_Network.Execute( FSSLogin, FSSPwd, FProxyUser, FProxyPwd,
                           FProxyServer, FProxyPort, FProxyUse );
   finally
      Frm_Network.Free;
   end;
   ReloadIni;
end;

//permet de recharger certaines infos depuis le fichier ini
procedure TFrm_Editor.ReloadIni;
var
   FileIni: TIniFile;
begin
   FileIni:= TIniFile.Create( ExtractFilePath( Application.ExeName ) + Cst_IniFilePath );
   try
      FSSLogin:= FileIni.ReadString( Cst_IniOptions, Cst_IniSSUser, '');
      FSSPwd:= FileIni.ReadString( Cst_IniOptions, Cst_IniSSPwd, '');
      FProxyUser:= FileIni.ReadString( Cst_IniOptions, Cst_IniProxyUser, '');
      FProxyPwd:= FileIni.ReadString( Cst_IniOptions, Cst_IniProxyPwd, '');
      FProxyServer:= FileIni.ReadString( Cst_IniOptions, Cst_IniProxyServer, '');
      FProxyPort:= FileIni.ReadString( Cst_IniOptions, Cst_IniProxyPort, '');
      FProxyUse:= FileIni.ReadBool( Cst_IniOptions, Cst_IniProxyUse, False);
   finally
      FileIni.Free;
   end;
end;

//Au click sur le menu item convert to lower ou upper case (system)
procedure TFrm_Editor.ChangeCaseClick(Sender: TObject);
var
   _Game: TGame;
   ii: Integer;
   _List: TObjectList<TGame>;
begin
   GSystemList.TryGetValue( getCurrentFolderName, _List );

   Screen.Cursor:= crHourGlass;
   ProgressBar.Visible:= True;
   ProgressBar.Max:= Pred( _List.Count );
   ProgressBar.Position:= 0;
   for ii:= 0 to Pred( _List.Count ) do begin
      _Game:= ( Lbx_Games.Items.Objects[ii] as TGame );
      if ( ( sender as TMenuItem ).Tag = 10 ) then
         ConvertFieldsCase( _Game )
      else if ( ( sender as TMenuItem ).Tag = 11 ) then
         ConvertFieldsCase( _Game, False, True );
      ProgressBar.Position:= ( ProgressBar.Position + 1 );
   end;
   LoadGamesList( getCurrentFolderName );
   ProgressBar.Visible:= False;
   Screen.Cursor:= crDefault;
end;

//Au click sur le menu item convert to lower ou upper case (game)
procedure TFrm_Editor.ChangeCaseGameClick(Sender: TObject);
var
   _Game: TGame;
begin
   _Game:= ( Lbx_Games.Items.Objects[Lbx_Games.ItemIndex] as TGame );
   if ( ( sender as TMenuItem ).Tag = 12 ) then
      ConvertFieldsCase( _Game, True )
   else if ( ( sender as TMenuItem ).Tag = 13 ) then
      ConvertFieldsCase( _Game, True, True );
end;

//Permet de convertir les champs en majuscule ou minuscule en fonction
// des paramètres passés (fonctionne par systeme ou par jeu)
procedure TFrm_Editor.ConvertFieldsCase( aGame: TGame; aUnique: Boolean = False;
                                          aUp: Boolean = False );

   //rafraichit les données des champs EDIT dans le cas de modif d'un seul jeu
   procedure RefreshDisplay( aGame: TGame );
   begin
      Edt_Name.Text:= aGame.Name;
      Edt_Genre.Text:= aGame.Genre;
      Edt_Region.Text:= aGame.Region;
      Edt_Publisher.Text:= aGame.Publisher;
      Edt_Developer.Text:= aGame.Developer;
      Mmo_Description.Text:= aGame.Description;
      Lbx_Games.Items[Lbx_Games.ItemIndex]:= Edt_Name.Text;
   end;

   //factorisation de code
   function ConvertUpOrLow( aNode: IXMLNode; const aNodeName: string; aUp: Boolean; const aField: string ): string;
   begin
      if aUp then begin
         Result:= AnsiUpperCase( aField );
      end else begin
         Result:= AnsiLowerCase( aField );
      end;
      if Assigned( aNode.ChildNodes.FindNode( aNodeName ) ) then
         aNode.ChildNodes.Nodes[aNodeName].Text:= Result;
   end;

var
   _Node: IXMLNode;
   _GameListPath: string;
begin
   //on construit le chemin vers le gamelist.xml
   _GameListPath:= FRootPath + FCurrentFolder + Cst_GameListFileName;

   //On ouvre le fichier xml
   XMLDoc.LoadFromFile( _GameListPath );

   //on l'active
   XMLDoc.Active:= True;

   //On récupère le premier noeud correspondant au jeu
   _Node := XMLDoc.DocumentElement.ChildNodes.FindNode( Cst_Game );

   //Et on boucle pour trouver le bon noeud
   repeat
      if ( _Node.ChildNodes.Nodes[Cst_Path].Text = aGame.RomPath ) then Break;
         _Node := _Node.NextSibling;
   until not Assigned( _Node );

   //on met à jour le xml et l'objet game
   aGame.Name:= ConvertUpOrLow( _Node, Cst_Name, aUp, aGame.Name );
   aGame.Region:= ConvertUpOrLow( _Node, Cst_Region, aUp, aGame.Region );
   aGame.Developer:= ConvertUpOrLow( _Node, Cst_Developer, aUp, aGame.Developer );
   aGame.Publisher:= ConvertUpOrLow( _Node, Cst_Publisher, aUp, aGame.Publisher );
   aGame.Genre:= ConvertUpOrLow( _Node, Cst_Genre, aUp, aGame.Genre );
   aGame.Description:= ConvertUpOrLow( _Node, Cst_Description, aUp, aGame.Description );

   //si maj d'un seul jeu on met à jour l'affichage du jeu
   if aUnique then RefreshDisplay( aGame );

   //on enregistre le fichier xml
   XMLDoc.SaveToFile( _GameListPath );
   XMLDoc.Active:= False;
end;

//Action au click sur menu item About
procedure TFrm_Editor.Mnu_AboutClick(Sender: TObject);
var
   Frm_About: TFrm_About;
begin
   //Affiche la fenêtre "About"
   Frm_About:= TFrm_About.Create(nil);
   try
      Frm_About.Execute;
   finally
      Frm_About.Free;
   end;
end;

//au click sur le menu item Help
procedure TFrm_Editor.Mnu_HelpClick(Sender: TObject);
var
   Frm_Help: TFrm_Help;
begin
   //Affiche la fenêtre "Help"
   Frm_Help:= TFrm_Help.Create(nil);
   Frm_Help.Chk_ShowTips.Visible:= False;
   try
      FShowTips:= Frm_Help.Execute( FShowTips);
   finally
      Frm_Help.Free;
   end;
end;

//au click sur le menu item disable pi prompts
procedure TFrm_Editor.Mnu_PiPromptsClick(Sender: TObject);
begin
   FPiPrompts:= Mnu_PiPrompts.Checked;
end;

//Sans ça pas de Ctrl+A dans le mémo...(c'est triste en 2017)
procedure TFrm_Editor.Mmo_DescriptionKeyPress(Sender: TObject; var Key: Char);
begin
   if ( Key = ^A ) then begin
      (Sender as TMemo).SelectAll;
       Key:= #0;
   end;
end;

//Click sur le bouton more infos pour afficher la fenêtre de complément d'infos
//sur le jeu sélectionné
procedure TFrm_Editor.Btn_MoreInfosClick(Sender: TObject);
var
   _Game: TGame;
   MoreInfos: TFrm_MoreInfos;
begin
   //on récupère le jeu sélectionné
   _Game:= TGame( Lbx_Games.Items.Objects[Lbx_Games.ItemIndex] );

   //On ajoute les hash si nécessaire.
   if ( ( _Game.Md5.IsEmpty ) or
        ( _Game.Sha1.IsEmpty ) or
        ( _Game.Crc32.IsEmpty ) ) then begin
      if FAutoHash or
         ( ( not FAutoHash ) and ( MyMessageDlg( Rst_HashWarning, mtInformation,
         [mbYes, mbNo], [Rst_Yes, Rst_No], Rst_Info ) = mrYes ) ) then begin

         _Game.Md5:= _Game.CalculateMd5( _Game.PhysicalRomPath );
         _Game.Sha1:= _Game.CalculateSha1( _Game.PhysicalRomPath );
         _Game.Crc32:= _Game.CalculateCrc32( _Game.PhysicalRomPath );
      end;
   end;

   //et on affiche la fenêtre
   MoreInfos:= TFrm_MoreInfos.Create( nil );
   try
      MoreInfos.Execute( _Game );
   finally
      MoreInfos.Free;
   end;
   Lbx_Games.SetFocus;
end;

//click sur le menu item remove region from games names
procedure TFrm_Editor.Mnu_RemoveRegionClick(Sender: TObject);
var
   ii, _Pos: Integer;
   _List: TObjectList<TGame>;
   _Game: TGame;
begin
   //on chope la liste de jeux
   GSystemList.TryGetValue( getCurrentFolderName, _List );

   Screen.Cursor:= crHourGlass;
   ProgressBar.Visible:= True;
   ProgressBar.Max:= Pred( _List.Count );
   ProgressBar.Position:= 0;

   //on boucle sur les jeux de la liste
   for ii:= 0 to Pred( _List.Count ) do begin
      _Game:= ( Lbx_Games.Items.Objects[ii] as TGame );
      _Pos:= Pos( '[', _Game.Name );

      //si on trouve le caractère, on traite
      if not ( _Pos = 0 ) then
         RemoveRegionFromGameName( _Game, Pred( _Pos ) );
      ProgressBar.Position:= ( ProgressBar.Position + 1 );
   end;
   LoadGamesList( getCurrentFolderName );
   ProgressBar.Visible:= False;
   Screen.Cursor:= crDefault;
   Lbx_Games.SetFocus;
end;

//au click sur le menu item ShowTips at start
procedure TFrm_Editor.Mnu_ShowTipsClick(Sender: TObject);
begin
   FShowTips:= Mnu_ShowTips.Checked;
end;

//supprime le tag entre [] de region dans le nom des jeux
procedure TFrm_Editor.RemoveRegionFromGameName( aGame: TGame; aStartPos: Integer );
var
   _Node: IXMLNode;
   _GameListPath, _Name: string;
   _EndPos: Integer;
begin
   //on construit le chemin vers le gamelist.xml
   _GameListPath:= FRootPath + FCurrentFolder + Cst_GameListFileName;

   //On ouvre le fichier xml
   XMLDoc.LoadFromFile( _GameListPath );

   //on l'active
   XMLDoc.Active:= True;

   //On récupère le premier noeud correspondant au jeu
   _Node := XMLDoc.DocumentElement.ChildNodes.FindNode( Cst_Game );

   //Et on boucle pour trouver le bon noeud
   repeat
      if ( _Node.ChildNodes.Nodes[Cst_Path].Text = aGame.RomPath ) then Break;
         _Node := _Node.NextSibling;
   until not Assigned( _Node );

   //on repère la position du caractère ]
   _EndPos:= Pos( ']', aGame.Name );

    //On met à jour l'objet TGame
    _Name:= aGame.Name;
    Delete( _Name, aStartPos,  Succ( _EndPos - aStartPos ) );
    aGame.Name:= _Name;

   //on change le text dans le xml
   _Node.ChildNodes.FindNode( Cst_Name ).Text:= aGame.Name;

   //on enregistre le fichier xml
   XMLDoc.SaveToFile( _GameListPath );
   XMLDoc.Active:= False;
end;

//choix du theme
procedure TFrm_Editor.Mnu_ThemeClick(Sender: TObject);
begin
   TStyleManager.TrySetStyle( Cst_ThemeNameStr[GetThemeEnum( ( Sender as TMenuItem).Tag )] );
   FThemeNumber:= ( Sender as TMenuItem ).Tag;
end;

//Choix de la langue
procedure TFrm_Editor.Mnu_LangClick(Sender: TObject);
var
   index, index2, index3: Integer;
   _TmpList: TObjectList<TGame>;
begin
   index:= Cbx_Filter.ItemIndex;
   index2:= Cbx_Hidden.ItemIndex;
   index3:= Cbx_Favorite.ItemIndex;
   UseLanguage( Cst_LangNameStr[GetLangEnum( ( Sender as TMenuItem).Tag )] );
   FLanguage:= ( Sender as TMenuItem ).Tag;
   RetranslateComponent( Self );
   Cbx_Filter.ItemIndex:= index;
   Cbx_Hidden.ItemIndex:= index2;
   Cbx_Favorite.ItemIndex:= index3;

   //On indique le nombre de jeux trouvés
   //Je suis obligé de refaire ça ici sinon le label reste sur l'ancienne langue
   //tant qu'on a pas changé de système (pas trouvé d'autre moyen)
   if ( Cbx_Systems.ItemIndex <> -1 ) then begin
      Lbl_NbGamesFound.Caption:= '';
      GSystemList.TryGetValue( getCurrentFolderName, _TmpList );
      if Cbx_Filter.ItemIndex = 0 then
         Lbl_NbGamesFound.Caption:= IntToStr( Lbx_Games.Items.Count ) + Rst_GamesFound
      else
         Lbl_NbGamesFound.Caption:= IntToStr( Lbx_Games.Items.Count ) + ' / ' +
                                    IntToStr( _TmpList.Count ) + Rst_GamesFound;
   end;

   //Pour changer la langue du scrape en live si on est sur l'onglet scrape
   if ( Pgc_Editor.ActivePage = Tbs_Scrape ) then FillFields;
end;

//Au click sur le menu item Advanced name editor
procedure TFrm_Editor.Mnu_NameEditorClick(Sender: TObject);
var
   FrmNameEditor: TFrm_AdvNameEditor;
   RemChars, AddChars, ChangeCase: Boolean;
   NbStart, NbEnd, CaseIndex, ii: Integer;
   StringStart, StringEnd, Preview: string;
begin
   for ii:= 0 to Pred( Lbx_Games.Items.Count ) do begin
      if ( Lbx_Games.Selected[ii] ) then begin
         Preview:= ( Lbx_Games.Items.Objects[ii] as TGame).Name;
         Break;
      end;
   end;

   FrmNameEditor:= TFrm_AdvNameEditor.Create( nil );
   try
      if FrmNameEditor.Execute( RemChars, AddChars, ChangeCase, NbStart, NbEnd,
                                CaseIndex, StringStart, StringEnd, Preview ) then begin
         TransformGamesNames( RemChars, AddChars, ChangeCase, NbStart,
                                NbEnd, CaseIndex, StringStart, StringEnd );
         LoadGamesList( getCurrentFolderName );
      end;
   finally
      FrmNameEditor.Free;
   end;
end;

//Transforme les noms des jeux de la sélection selon les options
//choisies dans l'éditeur avancé.
procedure TFrm_Editor.TransformGamesNames( aRemChars, aAddChars, aChangecase: Boolean;
                                           aNbStart, aNbEnd, aCaseIndex: Integer;
                                           const aStringStart, aStringEnd : string );
var
   _Node: IXMLNode;
   _GameListPath, TmpStr: string;
   _Game: TGame;
   ii: Integer;
begin
   //On récupère le chemin du fichier gamelist.xml
   _GameListPath:= FRootPath + FCurrentFolder + Cst_GameListFileName;

   //On ouvre le fichier xml
   XMLDoc.LoadFromFile( _GameListPath );

   Screen.Cursor:= crHourGlass;
   ProgressBar.Visible:= True;
   ProgressBar.Position:= 0;
   ProgressBar.Max:= Lbx_Games.SelCount;

   //on boucle sur les jeux sélectionnés
   for ii:= 0 to Pred( Lbx_Games.Items.Count ) do begin
      if ( Lbx_Games.Selected[ii] ) then begin

         //On récupère le jeu correspondant
         _Game:= ( Lbx_Games.Items.Objects[ii] as TGame );
         TmpStr:= _Game.Name;

         if aRemChars then begin
            if ( aNbStart > 0 ) then
               TmpStr:= Copy( TmpStr, Succ( aNbStart ), ( TmpStr.Length - aNbStart ) );
            if ( aNbEnd > 0 ) then
               SetLength( TmpStr, TmpStr.Length - aNbEnd );
         end;

         if aChangeCase then begin
            case aCaseIndex of
               0: TmpStr[1]:= UpCase( TmpStr[1] );
               1: TmpStr:= UpperCase( TmpStr );
               2: TmpStr:= LowerCase( TmpStr );
            end;
         end;

         if aAddChars then begin
            if not ( aStringStart.IsEmpty ) then
               TmpStr:= aStringStart + TmpStr;
            if not ( aStringEnd.IsEmpty ) then
               TmpStr:= TmpStr + aStringEnd;
         end;

         //on change le nom du jeu par le nouveau
         _Game.Name:= TmpStr;

         //On récupère le premier noeud "game"
         _Node := XMLDoc.DocumentElement.ChildNodes.FindNode( Cst_Game );

         //Et on boucle pour trouver le bon noeud
         repeat
            if ( _Node.ChildNodes.Nodes[Cst_Path].Text = _Game.RomPath ) then Break;
            _Node := _Node.NextSibling;
         until not Assigned( _Node );

         //on change le nom du jeu dans le xml
         _Node.ChildNodes.Nodes[Cst_Name].Text:= TmpStr;

      end;
   end;

   ProgressBar.Visible:= False;

   //et on sauvegarde
   XMLDoc.SaveToFile( _GameListPath );
   XMLDoc.Active:= False;

    Screen.Cursor:= crDefault;
end;

//Click sur le menuitem "Quit"
procedure TFrm_Editor.Mnu_QuitClick(Sender: TObject);
begin
   //on save les options dans le ini
   SaveToIni;
   //si on a chargé au moins une fois le dossier depuis le bi, on reboot
   if FPiLoadedOnce then begin
      //on affiche ou non le prompt d'info reboot
      if not FPiPrompts then
         MyMessageDlg( Rst_RebootRecal, mtInformation, [mbOK], [Rst_Ok], Rst_Info );
      if FSysIsRecal then StopOrStartES( False, True )
      else StopOrStartES( False, False );
   end;
   Application.Terminate;
end;



// Ajouté par Benjamin.A le 13/11/2017 11:24:50 :
// A partir d'ici ce sont toutes les méthodes utilisées dans l'onglet de scrape
//******************************************************************************



// Ajouté par Benjamin.A le 13/11/2017 11:26:29 :
//A l'affichage de l'onglet Scrape
procedure TFrm_Editor.Tbs_ScrapeShow(Sender: TObject);
begin
   //si proxy, on le renseigne
   if FProxyUse then begin
      Net_HTTPClient.ProxySettings := TProxySettings.Create(
                                          FProxyServer,
                                          StrToInt( FProxyPort ),
                                          FProxyUser,
                                          FProxyPwd);
   end else begin
      Net_HTTPClient.ProxySettings := TProxySettings.Create('', 0, '', '');
   end;

   //on désactive les items du mainmenu qui ne doivent pas être utilisés
   Mnu_Actions.Enabled:= False;
   Mnu_Theme.Enabled:= False;
end;

//Quand on sort de l'onglet scrape, on vide les listes
//Et on reload le jeu au cas où on a modifié des trucs
procedure TFrm_Editor.Tbs_ScrapeHide(Sender: TObject);
begin
   if Assigned( FScrapedGame ) and
      ( ( Lbx_Games.Items.Objects[Lbx_Games.ItemIndex] as TGame ) =
      FScrapedGame ) then
      LoadGame( FScrapedGame );

   //on réactive les items du mainmenu désactivés à l'entrée dans l'onglet
   Mnu_Actions.Enabled:= True;
   Mnu_Theme.Enabled:= True;
end;

//Requête GET pour récupérer le XML des infos du jeu.
function TFrm_Editor.GetGameXml( const aSysId: string; aGame: TGame ): Boolean;
var
   Query, Crc32, Size: String;
   Stream: TBytesStream;
begin
   Result:= False;
   //Calcul du Crc et de la taille fichier
   if Chk_ManualCRC.Checked then Crc32:= Edt_ManualCRC.Text
   else Crc32:= aGame.CalculateCrc32( aGame.PhysicalRomPath );

   Size:= GetFileSize( aGame.PhysicalRomPath );

   //construction de la requête API pour le jeu
   Query:= Cst_ScraperAddress + Cst_Category + Cst_ScrapeLogin + Cst_ScrapePwd +
           Cst_DevSoftName + Cst_Output;

   if ( not FSSLogin.IsEmpty ) and ( not FSSPwd.IsEmpty ) then
      Query:= Query + Cst_SSId + FSSLogin + Cst_SSPwd + FSSPwd;

   Query:= Query + Cst_Crc + Crc32 + Cst_SystemId + aSysId;

   if not ( Chk_ManualCRC.Checked ) then
      Query:= Query + Cst_RomName + TIdURI.ParamsEncode( aGame.RomName ) + Cst_RomSize + Size;

   //chargement dans un stream pour ne pas corrompre l'encodage
   Stream:= TBytesStream.Create;
   try
      try
         Net_HTTPClient.Get( Query, Stream );
         if ( Stream.Size = 0 ) then begin
            WarnUser( Rst_StreamError );
            Exit;
         end;
         Stream.Position:= 0;
         XMLDoc.LoadFromStream( Stream );
         XMLDoc.SaveToFile( FTempXmlPath );
      except
         //gestion des erreurs de connexion
            //case E.HelpContext of
            //   400: WarnUser( Rst_ServerError1 );
            //   401: WarnUser( Rst_ServerError2 );
            //   403: WarnUser( Rst_ServerError3 );
            //   404: WarnUser( Rst_ServerError4 );
            //   423: WarnUser( Rst_ServerError5 );
            //   426: WarnUser( Rst_ServerError6 );
            //   429: WarnUser( Rst_ServerError7 );
            //end;
         WarnUser( Rst_ServerError8 );
         Exit;
      end;
   finally
      Stream.Free;
   end;
   Result:= True;
end;

//parsing du Xml pour récupérer tout ce qui est description, région, nombre joueurs etc...
procedure TFrm_Editor.ParseXml;

   function CreateDict( aNodeList: IXMLNodeList; const aAttName: string ): TDictionary<string, string>;
   var
      ii: Integer;
   begin
      Result:= TDictionary<string, string>.Create;
      for ii:= 0 to Pred( aNodeList.Count ) do begin
         Result.AddOrSetValue( aNodeList[ii].Attributes[aAttName], aNodeList[ii].Text );
      end;
   end;

   function CreateGenreDict( aNodeList: IXMLNodeList; const aAttId, aAttLang: string ): TObjectDictionary<string, TDictionary<string, string>>;
   var
      ii: Integer;
      id: string;
      List: TDictionary<string, string>;
   begin
      Result:= TObjectDictionary<string, TDictionary<string, string>>.Create( [doOwnsValues] );
      List:= TDictionary<string, string>.Create;
      id:= aNodeList[0].Attributes[aAttId];
      for ii:= 0 to Pred( aNodeList.Count ) do begin
         if ( aNodeList[ii].Attributes[aAttId] = id ) then
            List.AddOrSetValue ( aNodeList[ii].Attributes[aAttLang], aNodeList[ii].Text )
         else begin
            Result.Add( id, List );
            id:= aNodeList[ii].Attributes[aAttId];
            List:= TDictionary<string, string>.Create;
            List.AddOrSetValue ( aNodeList[ii].Attributes[aAttLang], aNodeList[ii].Text );
         end;
      end;
      Result.Add( id, List );
   end;

var
   Nodes: IXMLNodeList;
   RootNode, Node: IXMLNode;
   ii: Integer;
   List: TStringList;
   Media: TMediaInfo;
begin
   //ouverture du fichier xml
   XMLDoc.LoadFromFile( FTempXmlPath );

   //On trouve le noeud qui nous intéresse
   RootNode:= XMLDoc.ChildNodes[Cst_DataNode].ChildNodes[Cst_GameNode];

   Node:= RootNode.ChildNodes.FindNode(Cst_NamesNode);
   if Assigned( Node ) then begin
      Nodes:= Node.ChildNodes;
      if Assigned( Nodes ) then FInfosList.AddObject( Cst_NamesNode, CreateDict( Nodes, Cst_AttRegion ) );
   end else FInfosList.Add( '' );

   Node:= RootNode.ChildNodes.FindNode( Cst_RegionsNode );
   if Assigned( Node ) then begin
      Nodes:= Node.ChildNodes;
      if Assigned( Nodes ) then begin
         List:= TStringList.Create;
         for ii:= 0 to Pred( Nodes.Count ) do begin
            List.Add( Nodes[ii].Text );
         end;
         FInfosList.AddObject( Cst_RegionsNode, List );
      end;
   end else FInfosList.Add( '' );

   Node:= RootNode.ChildNodes.FindNode( Cst_SynopNode );
   if Assigned( Node ) then begin
      Nodes:= Node.ChildNodes;
      if Assigned( Nodes ) then FInfosList.AddObject( Cst_SynopNode, CreateDict( Nodes, Cst_AttLang ) );
   end else FInfosList.Add( '' );

   Node:= RootNode.ChildNodes.FindNode( Cst_DateNode );
   if Assigned( Node ) then begin
      Nodes:= Node.ChildNodes;
      if Assigned( Nodes ) then FInfosList.AddObject( Cst_DateNode, CreateDict( Nodes, Cst_AttRegion ) );
   end else FInfosList.Add( '' );

   Node:= RootNode.ChildNodes.FindNode( Cst_GenreNode );
   if Assigned( Node ) then begin
      Nodes:= Node.ChildNodes;
      if Assigned( Nodes ) then FInfosList.AddObject( Cst_GenreNode, CreateGenreDict( Nodes, Cst_AttId, Cst_AttLang ) );
   end else FInfosList.Add( '' );

   Node:= RootNode.ChildNodes.FindNode( Cst_EditNode );
   if Assigned( Node ) then FInfosList.Add( Node.Text )
   else FInfosList.Add( '' );

   Node:= RootNode.ChildNodes.FindNode( Cst_DevNode );
   if Assigned( Node ) then FInfosList.Add( Node.Text )
   else FInfosList.Add( '' );

   Node:= RootNode.ChildNodes.FindNode( Cst_PlayersNode );
   if Assigned( Node ) then FInfosList.Add( Node.Text )
   else FInfosList.Add( '' );

   Node:= RootNode.ChildNodes.FindNode( Cst_NoteNode );
   if Assigned( Node ) then FInfosList.Add( Node.Text )
   else FInfosList.Add( '' );

   Node:= RootNode.ChildNodes.FindNode( Cst_MediaNode );
   if Assigned( Node ) then begin
      Nodes:= Node.ChildNodes;
      if Assigned( Nodes ) and ( Nodes.Count > 0 ) then begin
         //Et on boucle pour trouver les noeuds qui nous intéressent
         for ii:= 0 to Pred( Nodes.Count ) do begin
            if ( ( Nodes[ii].Attributes[Cst_AttType] = Cst_MediaBox2d ) and
                 ( Chk_Box2D.Checked ) ) or
               ( ( Nodes[ii].Attributes[Cst_AttType] = Cst_MediaScreenShot ) and
                 ( Chk_Screenshot.Checked ) ) or
               ( ( Nodes[ii].Attributes[Cst_AttType] = Cst_MediaSsTitle ) and
                 ( Chk_Title.Checked ) ) or
               ( ( Nodes[ii].Attributes[Cst_AttType] = Cst_MediaBox3d ) and
                 ( Chk_Box3D.Checked ) ) or
               ( ( Nodes[ii].Attributes[Cst_AttType] = Cst_MediaMix1 ) and
                 ( Chk_Mix1.Checked ) ) or
               ( ( Nodes[ii].Attributes[Cst_AttType] = Cst_MediaMix2 ) and
                 ( Chk_Mix2.Checked ) ) or
               ( ( Nodes[ii].Attributes[Cst_AttType] = Cst_MediaArcadeBox1 ) and
                 ( Chk_ArcadeBox.Checked ) ) or
               ( ( Nodes[ii].Attributes[Cst_AttType] = Cst_MediaWheel ) and
                 ( Chk_Wheel.Checked ) ) then begin
               Media:= TMediaInfo.Create;
               Media.FileExt:= Nodes[ii].Attributes[Cst_AttFormat];
               Media.FileLink:= Nodes[ii].Text;
               FPictureLinks.Add( Media );
            end;
         end;
      end;
   end;

   try
      RootNode:= XMLDoc.ChildNodes[Cst_DataNode].ChildNodes[Cst_UserNode];
      Node:= RootNode.ChildNodes.FindNode( Cst_ThreadNode );
      if Assigned( Node ) then begin
        if not TryStrToInt( Node.Text, FMaxThreads ) then
           FMaxThreads:= 1;
      end;
   except
      FMaxThreads:= 1;
   end;

   //on delete le fichier xml temporaire (plus besoin)
   DeleteFile( FTempXmlPath );
end;

//Crée les images depuis la liste globale des liens.
//(lancement du nombre de thread en fonction du user screenscraper)
procedure TFrm_Editor.GetPictures;
var
   ii: Integer;
begin
   //si il n'y a pas d'image à récup, on réactive tout le bazar et on sort
   if ( FPictureLinks.Count = 0 ) then begin
      Img_Loading.Visible:= False;
      FillFields;
      EnableScrapeComponents( True );
      Enabled:= True;
      Exit;
   end;

   FThreadCount:= 0;
   FStartCount:= FPictureLinks.Count;
   for ii:= 0 to Pred( FMaxthreads ) do begin
      if ( FPictureLinks.Count > 0 ) then
         GetPicture( FPictureLinks.Extract( FPictureLinks[0] ) );
   end;
end;

//Crée un thread de download d'image
procedure TFrm_Editor.GetPicture( aMedia: TMediaInfo );
var
   Thread: TDOwnThread;
begin
   Thread:= TDOwnThread.Create;
   Thread.Url:= aMedia.FileLink;
   Thread.Ext:= aMedia.FileExt;
   Thread.OnTerminate:= ThreadTerminated;
   Thread.Start;
end;

//Action réalisée par un thread lorsqu'il se termine
procedure TFrm_Editor.ThreadTerminated( Sender: TObject );
begin
   //on lock l'accés au compteur de threads
   CounterGuard.Acquire;

   Inc( FThreadCount );
   if ( FPictureLinks.Count > 0 ) then begin
      GetPicture( FPictureLinks.Extract( FPictureLinks[0] ) );
   end else if ( FThreadCount = FStartCount ) then begin
      DisplayPictures;
      Img_Loading.Visible:= False;
      FillFields;
      EnableScrapeComponents( True );
      Enabled:= True;
   end;

   //on libère le lock du compteur
   CounterGuard.Release;
end;

//Affichage des images récupérées
procedure TFrm_Editor.DisplayPictures;
var
   ii, Left, Count: Integer;
begin
   Count:= FImgList.Count;
   if ( Count = 0 ) then Exit;

   case Count of
      1: Left:= 430;
      2: Left:= 250;
      else Left:= 50;
   end;

   for ii:= 0 to Pred( Count ) do begin
      FImgList.Items[ii].Parent:= Scl_Pictures;
      FImgList.Items[ii].Top:= 0;
      FImgList.Items[ii].Left:= Left;
      FImgList.Items[ii].Constraints.MinHeight:= 300;
      FImgList.Items[ii].Constraints.MaxHeight:= 300;
      FImgList.Items[ii].Constraints.MaxWidth:= 300;
      FImgList.Items[ii].OnClick:= ImgScrapedClick;
      FImgList.Items[ii].Center:= True;
      FImgList.Items[ii].Visible:= True;
      Left:= Left + FImgList.Items[ii].Width + 50;
   end;

   //pour forcer la scrollbox a afficher correctement la scrollbar...
   Scl_Pictures.Realign;
end;

//Remplissage des champs avec les infos scrapées
procedure TFrm_Editor.FillFields;

   function GetFormatedDate( const aStr: string ): string;
   var
      Day, Month, Year: string;
   begin
      //si la chaine fait 4 caractères de long
      if ( Length( aStr) = 4 ) then
         Result:= aStr;
      
      //si la chaine fait 7 caractères de long
      if ( Length( aStr) = 7 ) then begin
         Month:= Copy( aStr, 6, 2 );
         Year:= Copy( aStr, 1, 4 );
         Result:= Month + '/' + Year;
      end;
      
      //si la chaine fait 10 caractères de long
      if ( Length( aStr) = 10 ) then begin
         Day:= Copy( aStr, 9, 2 );
         Month:= Copy( aStr, 6, 2 );
         Year:= Copy( aStr, 1, 4 );
         Result:= Day + '/' + Month + '/' + Year;
      end;      
   end;
   
var
   LangStr, TmpStr: string;
   ii, Count: Integer;
   Dict: TDictionary<string, string>;
   ObjectDict: TObjectDictionary<string, TDictionary<string, string>>;
   Item: TPair<string, TDictionary<string, string>>;
   List: TStringList;
begin
   //On chope la string correspondant à la langue "en cours"
   LangStr:= Copy( Cst_LangNameStr[GetLangEnum( FLanguage )], 1 , 2 );

   if ( FInfosList.Count = 0 ) then Exit;

   //nom
   if ( not FInfosList[0].IsEmpty ) then begin
      Dict:= ( FInfosList.Objects[0] as TDictionary<string, string> );
      if Dict.TryGetValue( LangStr, TmpStr ) or
         Dict.TryGetValue( Cst_CountryName[cnEu], TmpStr ) or
         Dict.TryGetValue( Cst_CountryName[cnWor], TmpStr ) or
         Dict.TryGetValue( 'ss', TmpStr ) then
         Edt_ScrapeName.Text:= TmpStr
      else Edt_ScrapeName.Text:= '';
   end else Edt_ScrapeName.Text:= '';

   //région
   if not FInfosList[1].IsEmpty then begin
      List:= ( FInfosList.Objects[1] as TStringList );
      Edt_ScrapeRegion.Text:= '';
      for ii:= 0 to Pred( List.Count ) do begin
         Edt_ScrapeRegion.Text:= Edt_ScrapeRegion.Text +
                                 Cst_CountryNameFull[GetCountryEnum( List[ii] )][Succ(FLanguage)];
         if ( ii < Pred( List.Count ) ) then
         Edt_ScrapeRegion.Text:= Edt_ScrapeRegion.Text + ' - ';
      end;
   end else Edt_ScrapeRegion.Text:= '';

   //description
   if ( not FInfosList[2].IsEmpty )  then begin
      Dict:= ( FInfosList.Objects[2] as TDictionary<string, string> );
      if Dict.TryGetValue( LangStr, TmpStr ) or
         Dict.TryGetValue( Cst_LangNameStr[lnEnglish], TmpStr ) or
         Dict.TryGetValue( Cst_LangNameStr[lnGerman], TmpStr ) or
         Dict.TryGetValue( Cst_LangNameStr[lnSpanish], TmpStr ) or
         Dict.TryGetValue( Copy( Cst_LangNameStr[lnPortuguese_BR], 1, 2 ), TmpStr ) then
         Mmo_ScrapeDescription.Text:= TmpStr
      else Mmo_ScrapeDescription.Text:= '';
   end else Mmo_ScrapeDescription.Text:= '';

   //date
   if ( not FInfosList[3].IsEmpty )  then begin
      Dict:= ( FInfosList.Objects[3] as TDictionary<string, string> );
      if Dict.TryGetValue( LangStr, TmpStr ) or
         Dict.TryGetValue( Cst_CountryName[cnEu], TmpStr ) or
         Dict.TryGetValue( Cst_CountryName[cnWor], TmpStr ) or
         Dict.TryGetValue( Cst_CountryName[cnUs], TmpStr ) or
         Dict.TryGetValue( Cst_CountryName[cnJp], TmpStr )then
         Edt_ScrapeDate.Text:= GetFormatedDate( TmpStr )
      else Edt_ScrapeDate.Text:= '';
   end else Edt_ScrapeDate.Text:= '';

   //genre
   if ( not FInfosList[4].IsEmpty )  then begin
      ObjectDict:= ( FInfosList.Objects[4] as TObjectDictionary<string, TDictionary<string, string>> );
      Edt_ScrapeGenre.Text:= '';
      Count:= 0;
      for Item in ObjectDict do begin
         Inc( Count );
         if ( Item.Value.TryGetValue( LangStr, TmpStr ) ) or
            ( Item.Value.TryGetValue( Cst_LangNameStr[lnEnglish], TmpStr ) ) or
            ( Item.Value.TryGetValue( Cst_LangNameStr[lnGerman], TmpStr ) ) or
            ( Item.Value.TryGetValue( Cst_LangNameStr[lnSpanish], TmpStr ) ) or
            ( Item.Value.TryGetValue( Copy( Cst_LangNameStr[lnPortuguese_BR], 1, 2 ), TmpStr ) ) then
            Edt_ScrapeGenre.Text:= Edt_ScrapeGenre.Text + TmpStr
         else Edt_ScrapeGenre.Text:= Edt_ScrapeGenre.Text + '';
         if ( Count < ObjectDict.Count ) then Edt_ScrapeGenre.Text:= Edt_ScrapeGenre.Text + ' - ';
      end;
   end else Edt_ScrapeGenre.Text:= '';

   //editeur
   Edt_ScrapePublisher.Text:= FInfosList[5];

   //developpeur
   Edt_ScrapeDeveloper.Text:= FInfosList[6];

   //players
   Edt_ScrapePlayers.Text:= FInfosList[7];

   //note
   Edt_ScrapeRating.Text:= FInfosList[8];

end;

//convertit les champs du scrape en maj ou min
procedure TFrm_Editor.ConvertScrapeToUpOrLow( aUp: Boolean = False );
begin
   Edt_ScrapeGenre.Text:=  IfThen( aUp, AnsiUpperCase( Edt_ScrapeGenre.Text ),
                                        AnsiLowerCase( Edt_ScrapeGenre.Text ) );
   Edt_ScrapeName.Text:= IfThen( aUp, AnsiUpperCase( Edt_ScrapeName.Text ),
                                      AnsiLowerCase( Edt_ScrapeName.Text ) );
   Edt_ScrapeRegion.Text:= IfThen( aUp, AnsiUpperCase( Edt_ScrapeRegion.Text ),
                                        AnsiLowerCase( Edt_ScrapeRegion.Text ) );
   Edt_ScrapeDeveloper.Text:= IfThen( aUp, AnsiUpperCase( Edt_ScrapeDeveloper.Text ),
                                           AnsiLowerCase( Edt_ScrapeDeveloper.Text ) );
   Edt_ScrapeRating.Text:= IfThen( aUp, AnsiUpperCase( Edt_ScrapeRating.Text ),
                                        AnsiLowerCase( Edt_ScrapeRating.Text ) );
   Edt_ScrapePlayers.Text:= IfThen( aUp, AnsiUpperCase( Edt_ScrapePlayers.Text ),
                                         AnsiLowerCase( Edt_ScrapePlayers.Text ) );
   Edt_ScrapePublisher.Text:= IfThen( aUp, AnsiUpperCase( Edt_ScrapePublisher.Text ),
                                           AnsiLowerCase( Edt_ScrapePublisher.Text ) );
   Mmo_ScrapeDescription.Text:= IfThen( aUp, AnsiUpperCase( Mmo_ScrapeDescription.Text ),
                                             AnsiLowerCase( Mmo_ScrapeDescription.Text ) );
end;

//active les composants de la fenêtre de scrape
procedure TFrm_Editor.EnableScrapeComponents( aValue: Boolean );
begin
   Edt_ScrapeGenre.Enabled:= aValue;
   Edt_ScrapeDate.Enabled:= aValue;
   Edt_ScrapeName.Enabled:= aValue;
   Edt_ScrapeRegion.Enabled:= aValue;
   Edt_ScrapeDeveloper.Enabled:= aValue;
   Edt_ScrapeRating.Enabled:= aValue;
   Edt_ScrapePlayers.Enabled:= aValue;
   Edt_ScrapePublisher.Enabled:= aValue;
   Mmo_ScrapeDescription.Enabled:= aValue;

   Lbl_ScrapeDate.Enabled:= aValue;
   Lbl_ScrapeGenre.Enabled:= aValue;
   Lbl_ScrapeName.Enabled:= aValue;
   Lbl_ScrapeRegion.Enabled:= aValue;
   Lbl_ScrapeDeveloper.Enabled:= aValue;
   Lbl_ScrapeRating.Enabled:= aValue;
   Lbl_ScrapePlayers.Enabled:= aValue;
   Lbl_ScrapePublisher.Enabled:= aValue;
   Lbl_ScrapeDescription.Enabled:= aValue;

   Btn_ScrapeSave.Enabled:= aValue;
   Btn_ScrapeLower.Enabled:= aValue;
   Btn_ScrapeUpper.Enabled:= aValue;

   Chk_ScrapeInfos.Enabled:= aValue;
end;

//Pour prévenir le user si problème ou pas de médias trouvés
procedure TFrm_Editor.WarnUser( const aMessage: string );
begin
   Screen.Cursor:= crDefault;
   ShowMessage( aMessage );
end;

//Pour récupérer la taille du fichier du jeu
function TFrm_Editor.GetFileSize( const aPath: string ): string;
var
   Reader: TFileStream;
begin
   Reader:= TFile.OpenRead( aPath );
   try
      Result:= IntToStr( Reader.Size );
   finally
      Reader.Free;
   end;
end;

//Au click sur le bouton Scraper
procedure TFrm_Editor.Btn_ScrapeClick( Sender: TObject );
begin
   //On nettoie les listes et champs pour commencer
   EmptyScrapeFields;

   //on désactive pour éviter les clicks intempestifs pendant le chargement
   Img_Loading.Visible:= True;
   Refresh;
   Enabled:= False;
   if ( Lbx_Games.Count > 0 ) then begin
      FScrapedGame:= ( Lbx_Games.Items.Objects[Lbx_Games.ItemIndex] as TGame );
      if GetGameXml( GetCurrentSystemId, FScrapedGame ) then begin
         ParseXml;
         GetPictures;
      end else begin
         Img_Loading.Visible:= False;
         Enabled:= True;
      end;
   end;
end;

//au click sur bouton save changes scrape
procedure TFrm_Editor.Btn_ScrapeSaveClick(Sender: TObject);
begin
   SaveChangesToGamelist( True, Chk_ScrapePicture.Checked, Chk_ScrapeInfos.Checked );
end;

//au click sur les checkbox de l'onglet scrape (pour save les changements)
procedure TFrm_Editor.Chk_ScrapeClick(Sender: TObject);
begin
   Btn_ScrapeSave.Enabled:= ( Chk_ScrapeInfos.Checked ) or ( Chk_ScrapePicture.Checked );
end;

//au click sur le bouton convert all text to uppercase
procedure TFrm_Editor.Btn_ScrapeUpperClick(Sender: TObject);
begin
   ConvertScrapeToUpOrLow( True );
end;

//au click sur le bouton convert all text to lowercase
procedure TFrm_Editor.Btn_ScrapeLowerClick(Sender: TObject);
begin
   ConvertScrapeToUpOrLow;
end;

//scroll horizontal avec souris
procedure TFrm_Editor.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
          MousePos: TPoint; var Handled: Boolean);
begin
   if ( Pgc_Editor.ActivePage = Tbs_Scrape ) then
      Scl_Pictures.Perform(WM_HSCROLL,1,0);
end;

//scroll horizontal avec souris
procedure TFrm_Editor.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
          MousePos: TPoint; var Handled: Boolean);
begin
   if ( Pgc_Editor.ActivePage = Tbs_Scrape ) then
      Scl_Pictures.Perform(WM_HSCROLL,0,0);
end;

procedure TFrm_Editor.ImgScrapedClick(Sender: TObject);
begin
   Img_ScrapeBackground.Visible:= False;
   Img_Scrape.Picture.Graphic:= ( Sender as TImage ).Picture.Graphic;
   Chk_ScrapePicture.Enabled:= True;
   Chk_ScrapePicture.Checked:= True;
end;

procedure TFrm_Editor.Chk_ManualCRCClick(Sender: TObject);
begin
   Edt_ManualCRC.Enabled:= Chk_ManualCRC.Checked;
end;


//******************************************************************************
//Juste avant la fermeture du programme, on sauvegarde les options dansle .INI
procedure TFrm_Editor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //on save les options dans le ini
   SaveToIni;
   //si on a chargé au moins une fois le dossier depuis le pi, on reboot
   if FPiLoadedOnce then begin
      //on affiche ou non le prompt d'info reboot
      if not FPiPrompts then
         MyMessageDlg( Rst_RebootRecal, mtInformation, [mbOK], [Rst_Ok], Rst_Info );
      if FSysIsRecal then StopOrStartES( False, True )
      else StopOrStartES( False, False );
   end;
end;

// Stop video to prevent crashing the app on closing
procedure TFrm_Editor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   Wmp_Video.controls.stop;
end;

//Nettoyage mémoire à la fermeture du programme
procedure TFrm_Editor.FormDestroy(Sender: TObject);
begin
   //Toutes les listes étant "owner" de leurs objets
   //un simple Free sur cette liste videra automatiquement les autres
   GSystemList.Free;

   //On libère toutes les listes du scrape
   FImgList.Free;
   FInfosList.Free;
   FPictureLinks.Free;

   //libère l'objet lock du compteur de threads
   CounterGuard.Free;
end;

end.
