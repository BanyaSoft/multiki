object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'MainForm'
  ClientHeight = 615
  ClientWidth = 1224
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Edit1: TEdit
    Left = 1080
    Top = 102
    Width = 121
    Height = 23
    TabOrder = 0
    Text = '1000'
  end
  object Edit2: TEdit
    Left = 1080
    Top = 131
    Width = 121
    Height = 23
    TabOrder = 1
    Text = '200'
  end
  object Edit3: TEdit
    Left = 1080
    Top = 160
    Width = 121
    Height = 23
    TabOrder = 2
    Text = '20'
  end
  object Button1: TButton
    Left = 1080
    Top = 211
    Width = 75
    Height = 25
    Caption = 'MVP'
    TabOrder = 3
    OnClick = ButtonClear
  end
  object timeStarter1: TTimer
    Enabled = False
    OnTimer = timeStarter1Timer
    Left = 1080
    Top = 336
  end
  object timeAnimation1: TTimer
    Enabled = False
    OnTimer = timeAnimation1Timer
    Left = 1080
    Top = 384
  end
  object timeAnimation2: TTimer
    Enabled = False
    OnTimer = timeAnimation2Timer
    Left = 1080
    Top = 480
  end
  object timeStarter2: TTimer
    Enabled = False
    OnTimer = timeStarter2Timer
    Left = 1080
    Top = 432
  end
end
