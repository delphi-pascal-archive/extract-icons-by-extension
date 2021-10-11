{     ______          _        __      _ ______                  _
     /  _   \ ___   / /____   / /_   (_)/ ___  \ ____   ____   / /
     / /  / // _ \ / // __ \ / __ \ / // /   |_|/ __ \ / __ \ / /
   _/ /_ / //  __ / // /_/ // / / // // /_____ / /_/ // /_/ // /
  /______ / \___//_// ____//_/ /_//_/ \______/ \____/ \____//_/
                   /_/http://delphicool.developpez.com

      delphicool@ifrance.com
}

program DelphiCool;

uses
  Forms,
  Main_Form in 'Main_Form.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'DelphiCool app - http://delphicool.developpez.com';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
