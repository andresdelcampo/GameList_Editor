object Frm_Help: TFrm_Help
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Help'
  ClientHeight = 516
  ClientWidth = 869
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Btn_Close: TButton
    Left = 384
    Top = 483
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = Btn_CloseClick
  end
  object Chk_ShowTips: TCheckBox
    Left = 8
    Top = 483
    Width = 105
    Height = 17
    Caption = 'Don'#39't show again'
    TabOrder = 1
  end
  object Red_Help: TRichEdit
    Left = 8
    Top = 8
    Width = 853
    Height = 469
    Alignment = taCenter
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
    Zoom = 100
  end
end
