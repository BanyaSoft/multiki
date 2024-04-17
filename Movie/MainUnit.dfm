object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'MainForm'
  ClientHeight = 1056
  ClientWidth = 1982
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object btnSpawnStick: TButton
    Left = 1080
    Top = 189
    Width = 75
    Height = 25
    Caption = 'Spawn Stick'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 1080
    Top = 102
    Width = 121
    Height = 23
    TabOrder = 1
    Text = '1000'
  end
  object Edit2: TEdit
    Left = 1080
    Top = 131
    Width = 121
    Height = 23
    TabOrder = 2
    Text = '200'
  end
  object Edit3: TEdit
    Left = 1080
    Top = 160
    Width = 121
    Height = 23
    TabOrder = 3
    Text = '20'
  end
  object btnBackgroundTrack: TButton
    Left = 1080
    Top = 220
    Width = 75
    Height = 25
    Caption = 'Background'
    DisabledImageName = 'btnBackgroundTrack'
    TabOrder = 4
    OnClick = btnBackgroundTrackClick
  end
  object btnPedestal: TButton
    Left = 1080
    Top = 251
    Width = 75
    Height = 25
    Caption = 'Pedestal'
    DisabledImageName = 'btnPedestal'
    TabOrder = 5
    OnClick = btnPedestalClick
  end
<<<<<<< HEAD
  object Button1: TButton
    Left = 1080
    Top = 408
    Width = 75
    Height = 25
    Caption = 'MVP'
    TabOrder = 6
    OnClick = ButtonClear
=======
  object btnFinishFence: TButton
    Left = 1080
    Top = 282
    Width = 75
    Height = 25
    Caption = 'Fence'
    TabOrder = 6
    OnClick = btnFinishFenceClick
>>>>>>> main
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 1080
    Top = 336
  end
end
