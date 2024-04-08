object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Form1'
  ClientHeight = 731
  ClientWidth = 1032
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 784
    Top = 589
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 784
    Top = 494
    Width = 121
    Height = 23
    TabOrder = 1
    Text = '100'
  end
  object Edit2: TEdit
    Left = 784
    Top = 523
    Width = 121
    Height = 23
    TabOrder = 2
    Text = '100'
  end
  object Edit3: TEdit
    Left = 784
    Top = 552
    Width = 121
    Height = 23
    TabOrder = 3
    Text = '10'
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 832
    Top = 216
  end
end
