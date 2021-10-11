{
        24.1.2003
      ______          _        __      _ ______                  _
     /  _   \ ___   / /____   / /_   (_)/ ___  \ ____   ____   / /
     / /  / // _ \ / // __ \ / __ \ / // /   |_|/ __ \ / __ \ / /
   _/ /_ / //  __ / // /_/ // / / // // /_____ / /_/ // /_/ // /
  /______ / \___//_// ____//_/ /_//_/ \______/ \____/ \____//_/
                   /_/http://delphicool.developpez.com

      delphicool@ifrance.com
   NE M'ENVOYER PAS DE QUESTIONS
    DE PROGRAMMATION PAR MAIL


ииииииииииииииииииииииииииииииииииииииииииииииииииииииииииии    
Uses ShellApi

WINSHELLAPI DWORD WINAPI SHGetFileInfo(
                                       LPCTSTR pszPath,                //
                                       DWORD dwFileAttributes,         // Attributs du fichier
                                       SHFILEINFO FAR *psfi,           // Adresse de SHFILEINFO
                                       UINT cbFileInfo,                // Taille de SHFILEINFO
                                       UINT uFlags                     // Flags, information р retrouver (voir l'aide)
                                      );
ииииииииииииииииииииииииииииииииииииииииииииииииииииииииииии                                      
}
unit Main_Form;

 interface

 uses
   ShellApi,
   Windows, SysUtils, Classes, Controls, Forms, StdCtrls, Graphics,
   ExtCtrls, ImgList ;

 type
   TMainForm = class(TForm)
    Image1: TImage;
    SysIco_Small: TImageList;
    SysIco_Big: TImageList;
    Extension: TEdit;
    Button1: TButton;
    Label3: TLabel;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);


   private
   public
   end;

 var
   MainForm: TMainForm;

 implementation

 {$R *.dfm}
 {$R res.res}  

procedure TMainForm.Image1Click(Sender: TObject);
begin
 ShellExecute(handle, nil, 'http://delphicool.developpez.com', nil, nil,sw_maximize);
end;

function GetIconIndex(Extension: String; Attribus: DWORD; var TypeFichier :string):Integer;
var SHFileInfo: TSHFileInfo;
  begin
   if Extension[1] <> '.' then Extension := '.' + Extension;   //Il faut le "." avant
   
{On rщcolte les info pour l'extension}
   SHGetFileInfo(PChar(Extension), Attribus, SHFileInfo, SizeOf(TSHFileInfo),
                 SHGFI_SYSICONINDEX or SHGFI_USEFILEATTRIBUTES or SHGFI_TYPENAME);

   TypeFichier := SHFileInfo.szTypeName; //Quel est le type de fichier
   Result := SHFileInfo.iIcon; //index de l'icone dans l'image list du systeme
  end;
  

procedure TMainForm.FormCreate(Sender: TObject);
 var SHFileInfo :TSHFileINfo;
  begin
// On met les grandes icones du system dans notre ImageList 32x32    
    SysIco_Big.Handle := SHGetFileInfo('', 0, SHFileInfo, SizeOF(SHFileInfo), SHGFI_SYSICONINDEX or SHGFI_LARGEICON);
// On met les petites icones du system dans notre ImageList 16x16
    SysIco_Small.Handle := SHGetFileInfo('', 0, SHFileInfo, SizeOF(SHFileInfo), SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
  end;



{ииииииииииии  ииииииииииииииииииииииииииииииииииииииииииииииии}
procedure TMainForm.Button1Click(Sender: TObject);
 var TypeFichier :string;
  begin
//on recupere l'icone grace р l'index de l'image list system, et au passage on recupere le type de fichier
   SysIco_Big.GetIcon(GetIconIndex(Extension.Text,0,TypeFichier),Image2.Picture.Icon.Create);
   SysIco_Small.GetIcon(GetIconIndex(Extension.Text,0,TypeFichier),Image3.Picture.Icon.Create);

    Label1.Caption := TypeFichier;

    Extension.SelectAll;
  end;

end.





