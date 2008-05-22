unit frmPreferences;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxLabel, ExtCtrls, ComCtrls, StdCtrls, cxButtons, cxTreeView;

type
  TPreferencesFrm = class(TForm)
    Panel1: TPanel;
    pc: TPageControl;
    Panel2: TPanel;
    btnCancel: TcxButton;
    btnOK: TcxButton;
    tsVisiual: TTabSheet;
    Panel3: TPanel;
    imgToolBar: TImage;
    imgObject: TImage;
    lblObjectName: TcxLabel;
    cxTreeView1: TcxTreeView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PreferencesFrm: TPreferencesFrm;

implementation

{$R *.dfm}

end.
