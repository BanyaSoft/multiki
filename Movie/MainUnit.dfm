object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'MainForm'
  ClientHeight = 585
  ClientWidth = 1202
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 15
  object imgMain: TImage
    Left = 0
    Top = 0
    Width = 1202
    Height = 585
    Align = alClient
    ExplicitLeft = -8
  end
  object Edit1: TEdit
    Left = 152
    Top = 40
    Width = 121
    Height = 23
    TabOrder = 0
    Text = '1000'
  end
  object Edit2: TEdit
    Left = 296
    Top = 40
    Width = 121
    Height = 23
    TabOrder = 1
    Text = '200'
  end
  object Edit3: TEdit
    Left = 440
    Top = 40
    Width = 121
    Height = 23
    TabOrder = 2
    Text = '20'
  end
  object Button1: TButton
    Left = 600
    Top = 39
    Width = 75
    Height = 25
    Caption = 'MVP'
    TabOrder = 3
    OnClick = ButtonClear
  end
  object MediaPlayer1: TMediaPlayer
    Left = 941
    Top = 40
    Width = 253
    Height = 30
    DoubleBuffered = True
    Visible = False
    ParentDoubleBuffered = False
    TabOrder = 4
  end
  object mpVictoryMusic: TMediaPlayer
    Left = 936
    Top = 76
    Width = 253
    Height = 30
    DoubleBuffered = True
    Visible = False
    ParentDoubleBuffered = False
    TabOrder = 5
  end
  object mpClap: TMediaPlayer
    Left = 936
    Top = 112
    Width = 253
    Height = 30
    DoubleBuffered = True
    Visible = False
    ParentDoubleBuffered = False
    TabOrder = 6
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
  object Trash: TTimer
    Enabled = False
    Interval = 80
    OnTimer = TrashTimer
    Left = 1080
    Top = 528
  end
  object timeStarter3: TTimer
    Enabled = False
    OnTimer = timeStarter3Timer
    Left = 1112
    Top = 336
  end
  object timeAnimation3: TTimer
    Enabled = False
    OnTimer = timeAnimation3Timer
    Left = 1112
    Top = 384
  end
  object timeDebug: TTimer
    Enabled = False
    OnTimer = timeDebugTimer
    Left = 1112
    Top = 432
  end
  object timeStarter4: TTimer
    Enabled = False
    OnTimer = timeStarter4Timer
    Left = 1112
    Top = 480
  end
  object timeAnimation4: TTimer
    Enabled = False
    OnTimer = timeAnimation4Timer
    Left = 1112
    Top = 528
  end
  object FirstPersonHU: TTimer
    OnTimer = FirstPersonHUTimer
    Left = 1000
    Top = 336
  end
  object FirstPersonHD: TTimer
    OnTimer = FirstPersonHDTimer
    Left = 1000
    Top = 376
  end
  object SecondPersonHU: TTimer
    OnTimer = SecondPersonHUTimer
    Left = 928
    Top = 336
  end
  object SecondPersonHD: TTimer
    OnTimer = SecondPersonHDTimer
    Left = 928
    Top = 376
  end
end
