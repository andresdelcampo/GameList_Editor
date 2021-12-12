unit U_Game;

interface

uses
   System.StrUtils, System.Classes, System.SysUtils,
   IdHashMessageDigest, IdHashSHA, IdHashCRC,
   U_Resources;

type
   //Objet stockant uniquement le type système (enum) pour
   //combobox systems, permet de retrouver facile l'image et le nom du systeme
   TSystemKindObject = class
   public
      FSystemKind: TSystemKind;
      constructor Create( const aName: string );
   end;

   TGame = class
   private

      FRomPath: string;
      FRomName: string;
      FRomNameWoExt: string;
      FImagePath: string;
      FName: string;
      FDescription: string;
      FRating: string;
      FReleaseDate: string;
      FDeveloper: string;
      FPublisher: string;
      FGenre: string;
      FPlayers: string;
      FRegion: string;
      FPlaycount: string;
      FLastplayed: string;
      FCrc32: string;
      FMd5: string;
      FSha1: string;
      FHidden: Integer;
      FFavorite: Integer;
      FIsOrphan: Boolean;
      FPhysicalRomPath: string;
      FPhysicalImagePath: string;

      procedure Load( aPath, aName, aDescription, aImagePath, aRating,
                      aDeveloper, aPublisher, aGenre, aPlayers, aDate,
                      aRegion, aPlaycount, aLastplayed, aHidden, aFavorite: string );

      function GetRomName( const aRomPath: string ): string;

   public
      constructor Create( aPath, aName, aDescription, aImagePath, aRating,
                          aDeveloper, aPublisher, aGenre, aPlayers, aDate,
                          aRegion, aPlaycount, aLastplayed, aHidden, aFavorite: string ); reintroduce;

      property RomPath: string read FRomPath write FRomPath;
      property RomName: string read FRomName write FRomName;
      property RomNameWoExt: string read FRomNameWoExt write FRomNameWoExt;
      property ImagePath: string read FImagePath write FImagePath;
      property Name: string read FName write FName;
      property Description: string read FDescription write FDescription;
      property Rating: string read FRating write FRating;
      property ReleaseDate: string read FReleaseDate write FReleaseDate;
      property Developer: string read FDeveloper write FDeveloper;
      property Publisher: string read FPublisher write FPublisher;
      property Genre: string read FGenre write FGenre;
      property Players: string read FPlayers write FPlayers;
      property Region: string read FRegion write FRegion;
      property Playcount: string read FPlaycount write FPlaycount;
      property Lastplayed: string read FLastplayed write FLastplayed;
      property Crc32: string read FCrc32 write FCrc32;
      property Md5: string read FMd5 write FMd5;
      property Sha1: string read FSha1 write FSha1;
      property Hidden: Integer read FHidden write FHidden;
      property Favorite: Integer read FFavorite write FFavorite;
      property IsOrphan: Boolean read FIsOrphan write FIsOrphan;
      property PhysicalRomPath: string read FPhysicalRomPath write FPhysicalRomPath;
      property PhysicalImagePath: string read FPhysicalImagePath write FPhysicalImagePath;

      function CalculateMd5( const aFileName: string ): string;
      function CalculateSha1( const aFileName: string ): string;
      function CalculateCrc32( const aFileName: string ): string;

   end;

implementation

//Constructeur object SystemKindObject
constructor TSystemKindObject.Create( const aName: string );
var
   _systemKind: TSystemKind;
begin
   FSystemKind:= skOther;
   for _systemKind:= Low( TSystemKind )to High( _systemKind ) do begin
      if ( Cst_SystemKindFolderNames[_systemKind] = aName ) then begin
         FSystemKind:= _systemKind;
         Break;
      end;
   end;
end;

//Constructeur de l'objet TGame
constructor TGame.Create( aPath, aName, aDescription, aImagePath, aRating,
                          aDeveloper, aPublisher, aGenre, aPlayers, aDate,
                          aRegion, aPlaycount, aLastplayed, aHidden, aFavorite: string );
begin
   Load( aPath, aName, aDescription, aImagePath, aRating,
         aDeveloper, aPublisher, aGenre, aPlayers, aDate, aRegion, aPlaycount,
         aLastplayed, aHidden, aFavorite );
end;

//Chargement des attributs dans l'objet TGame
procedure TGame.Load( aPath, aName, aDescription, aImagePath, aRating,
                      aDeveloper, aPublisher, aGenre, aPlayers, aDate,
                      aRegion, aPlaycount, aLastplayed, aHidden, aFavorite: string );
begin
   FRomPath:= aPath;
   FRomName:= GetRomName( aPath );
   FRomNameWoExt:= ChangeFileExt( FRomName, '' );
   FImagePath:= aImagePath;
   FName:= aName;
   FDescription:= aDescription;
   FRating:= aRating;
   FReleaseDate:= aDate;
   FDeveloper:= aDeveloper;
   FPublisher:= aPublisher;
   FGenre:= aGenre;
   FPlayers:= aPlayers;
   FRegion:= aRegion;
   FPlaycount:= aPlaycount;
   FLastplayed:= aLastplayed;
   if ( aHidden = Cst_True ) then FHidden:= 1
   else FHidden:= 0;
   if ( aFavorite = Cst_True ) then FFavorite:= 1
   else FFavorite:= 0;
end;

//Fonction permettant de récupérer le nom de la rom avec son extension
function TGame.GetRomName( const aRomPath: string ): string;
var
   _Pos: Integer;
begin
   _Pos:= LastDelimiter( '/', aRomPath );
   Result:= Copy( aRomPath, Succ( _Pos ), ( aRomPath.Length - _Pos ) );
end;

//Fonction permettant de récupérer le MD5 des roms
function TGame.CalculateMd5( const aFileName: string ): string;
var
   IdMD5: TIdHashMessageDigest5;
   FS: TFileStream;
begin
   if FileExists( aFileName ) then begin
      IdMD5:= TIdHashMessageDigest5.Create;
      FS:= TFileStream.Create( aFileName, fmOpenRead or fmShareDenyWrite );
      try
         Result:= IdMD5.HashStreamAsHex(FS)
      finally
         FS.Free;
         IdMD5.Free;
      end;
   end;
end;

//fonction permettant de récupérer le SHA1 des roms
function TGame.CalculateSha1( const aFileName: string ): string;
var
   IdSHA1: TIdHashSHA1;
   FS: TFileStream;
begin
   if FileExists( aFileName ) then begin
      IdSHA1:= TIdHashSHA1.Create;
      FS:= TFileStream.Create( aFileName, fmOpenRead or fmShareDenyWrite );
      try
         Result:= IdSHA1.HashStreamAsHex(FS)
      finally
         FS.Free;
         IdSHA1.Free;
      end;
   end;
end;

//fonction permettant de récupérer le SHA1 des roms
function TGame.CalculateCrc32( const aFileName: string ): string;
var
   IdCRC32: TIdHashCRC32;
   FS: TFileStream;
begin
   if FileExists( aFileName ) then begin
      IdCRC32:= TIdHashCRC32.Create;
      FS:= TFileStream.Create( aFileName, fmOpenRead or fmShareDenyWrite );
      try
         Result:= IdCRC32.HashStreamAsHex(FS)
      finally
         FS.Free;
         IdCRC32.Free;
      end;
   end;
end;

end.
