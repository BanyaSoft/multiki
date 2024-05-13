object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
<<<<<<< Updated upstream
  Caption = 'Form1'
  ClientHeight = 1100
  ClientWidth = 2000
=======
  Caption = 'MainForm'
  ClientHeight = 1033
  ClientWidth = 1902
>>>>>>> Stashed changes
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCreate = FormCreate
  TextHeight = 15
  object btnSpawnStick: TButton
    Left = 1080
    Top = 205
    Width = 75
    Height = 25
    Caption = 'Spawn Stick'
    TabOrder = 0
    OnClick = btnSpawnStickClick
  end
  object Edit1: TEdit
    Left = 296
    Top = 40
    Width = 121
    Height = 23
    TabOrder = 1
    Text = '1000'
  end
  object Edit2: TEdit
    Left = 432
    Top = 40
    Width = 121
    Height = 23
    TabOrder = 2
    Text = '200'
  end
  object Edit3: TEdit
    Left = 568
    Top = 40
    Width = 121
    Height = 23
    TabOrder = 3
    Text = '20'
  end
<<<<<<< Updated upstream
  object btnBackgroundTrack: TButton
    Left = 1080
    Top = 245
=======
  object Button1: TButton
    Left = 704
    Top = 39
>>>>>>> Stashed changes
    Width = 75
    Height = 25
    Caption = 'Background'
    DisabledImageName = 'btnBackgroundTrack'
    TabOrder = 4
    OnClick = btnBackgroundTrackClick
  end
  object btnPedestal: TButton
    Left = 1080
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Pedestal'
    DisabledImageName = 'btnPedestal'
    TabOrder = 5
    OnClick = btnPedestalClick
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 1080
    Top = 336
  end
<<<<<<< Updated upstream
=======
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
    Left = 1168
    Top = 336
  end
>>>>>>> Stashed changes
end
