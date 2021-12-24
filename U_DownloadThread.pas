unit U_DownloadThread;

interface

uses
   System.Classes, System.SysUtils,
   Vcl.ExtCtrls, Vcl.Graphics, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage,
   U_Resources, System.Net.HttpClientComponent, System.Net.URLClient,
   System.Net.HttpClient;

type
   TDOwnThread = class( TThread )
   private
      Net_HTTPClient: TNetHTTPClient;
      Img: TImage;
      Graph: TGraphic;
      procedure AddPicture;
   protected
      procedure Execute; override;
   public
      Url: string;
      Ext: string;
      constructor Create; reintroduce;
      destructor Destroy; override;
   end;

implementation

uses
   F_Main;

constructor TDOwnThread.Create;
begin
   inherited Create( True );
   Net_HTTPClient:= TNetHTTPClient.Create(Net_HTTPClient);
   if Frm_Editor.FProxyUse then begin
      Net_HTTPClient.ProxySettings := TProxySettings.Create(
                                          Frm_Editor.FProxyServer,
                                          StrToInt( Frm_Editor.FProxyPort ),
                                          Frm_Editor.FProxyUser,
                                          Frm_Editor.FProxyPwd);
   end else begin
      Net_HTTPClient.ProxySettings := TProxySettings.Create('', 0, '', '');
   end;

   Img:= TImage.Create( nil );
   Img.AutoSize:= True;
   Img.Center:= True;
   Img.Proportional:= True;
   Img.Visible:= False;

   FreeOnTerminate:= True;
end;

destructor TDOwnThread.Destroy;
begin
   Net_HTTPClient.Free;
   inherited;
end;

procedure TDOwnThread.Execute;
var
   Stream: TBytesStream;
begin
   Stream:= TBytesStream.Create;
   try
      try
         Net_HTTPClient.Get( Url, Stream );
         if ( Stream.Size = 0 ) then begin
            Frm_Editor.WarnUser( Rst_StreamError );
            Exit;
         end;
         Stream.Position:= 0;
         //on crée le graphic qui va bien en fonction de l'extension
         if ( Ext = Cst_PngExt ) then Graph:= TPngImage.Create
         else Graph:= TJPEGImage.create;
         Graph.LoadFromStream( Stream );
         Img.Picture.Graphic:= Graph;
      except
         //gestion des erreurs de connexion

         //   case E.ErrorCode of
         //      400: Frm_Editor.WarnUser( Rst_ServerError1 );
         //      401: Frm_Editor.WarnUser( Rst_ServerError2 );
         //      403: Frm_Editor.WarnUser( Rst_ServerError3 );
         //      404: Frm_Editor.WarnUser( Rst_ServerError4 );
         //      423: Frm_Editor.WarnUser( Rst_ServerError5 );
         //      426: Frm_Editor.WarnUser( Rst_ServerError6 );
         //      429: Frm_Editor.WarnUser( Rst_ServerError7 );
         //   end;
         Frm_Editor.WarnUser( Rst_ServerError8 );
         Exit;
      end;
   finally
      Stream.Free;
   end;
   Synchronize( AddPicture );
end;

procedure TDOwnThread.AddPicture;
begin
   Frm_Editor.FImgList.Add( Img );
end;

end.
