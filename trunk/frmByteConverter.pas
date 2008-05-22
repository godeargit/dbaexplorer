unit frmByteConverter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxTextEdit, ExtCtrls, StdCtrls,
  cxMaskEdit, cxSpinEdit, cxButtons, cxControls, cxContainer, cxEdit,
  cxGroupBox;

type
  TByteConverterFrm = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxSpinEdit1: TcxSpinEdit;
    Label1: TLabel;
    cxSpinEdit2: TcxSpinEdit;
    Label2: TLabel;
    cxSpinEdit3: TcxSpinEdit;
    Label3: TLabel;
    cxSpinEdit4: TcxSpinEdit;
    Label4: TLabel;
    Shape1: TShape;
    Label5: TLabel;
    cxTextEdit1: TcxTextEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ByteConverterFrm: TByteConverterFrm;

implementation

{$R *.dfm}


{
1024 byte = 1 kilobyte
1024 kilobyte = 1 megabyte

1073741824 byte = 1 gigabyte

1 gigabyte = 1024 megabyte
}
end.
