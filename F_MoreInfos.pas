unit F_MoreInfos;

interface

uses
   Winapi.Windows, Winapi.Messages,
   System.SysUtils, System.Variants, System.Classes, System.DateUtils,
   Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
   U_gnugettext, U_Game;

type
   TFrm_MoreInfos = class(TForm)
      Btn_Close: TButton;
      Edt_Playcount: TEdit;
      Edt_LastPlayed: TEdit;
      Edt_Crc32: TEdit;
      Edt_Md5: TEdit;
      Edt_Sha1: TEdit;
      Lbl_Playcount: TLabel;
      Lbl_LastPlayed: TLabel;
      Lbl_Crc32: TLabel;
      Lbl_Md5: TLabel;
      Lbl_Sha1: TLabel;
      procedure Btn_CloseClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
   public
      procedure Execute( aGame: TGame );
   end;

implementation

{$R *.dfm}

procedure TFrm_MoreInfos.Execute( aGame: TGame );
begin
   //on remplit les champs
   Edt_Playcount.Text:= aGame.PlayCount;
   if not aGame.Lastplayed.IsEmpty then
      Edt_LastPlayed.Text:= FormatDateTime('dd/mm/yyyy hh:mm:ss' , ISO8601ToDate( aGame.Lastplayed ) )
   else Edt_LastPlayed.Text:= '';
   Edt_Crc32.Text:= aGame.Crc32;
   Edt_Md5.Text:= aGame.Md5;
   Edt_Sha1.Text:= aGame.Sha1;

   //affichage en modal de la fenêtre
   ShowModal;
end;

procedure TFrm_MoreInfos.FormCreate(Sender: TObject);
begin
   TranslateComponent( Self );
end;

procedure TFrm_MoreInfos.Btn_CloseClick(Sender: TObject);
begin
   //Ferme la fenêtre
   Close;
end;

end.
