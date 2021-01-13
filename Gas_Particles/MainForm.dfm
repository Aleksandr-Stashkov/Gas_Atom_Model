object MainForm1: TMainForm1
  Left = 172
  Top = 90
  Width = 809
  Height = 634
  Caption = 'Atoms'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    801
    600)
  PixelsPerInch = 96
  TextHeight = 13
  object LblR: TLabel
    Left = 630
    Top = 40
    Width = 16
    Height = 20
    Anchors = [akTop, akRight]
    Caption = 'R:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LblN: TLabel
    Left = 630
    Top = 8
    Width = 15
    Height = 20
    Anchors = [akTop, akRight]
    Caption = 'N:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LblX: TLabel
    Left = 598
    Top = 136
    Width = 44
    Height = 20
    Anchors = [akTop, akRight]
    Caption = 'MaxX:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LblY: TLabel
    Left = 598
    Top = 168
    Width = 44
    Height = 20
    Anchors = [akTop, akRight]
    Caption = 'MaxY:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object PntBox1: TPaintBox
    Left = 0
    Top = 0
    Width = 576
    Height = 600
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
  object LblE: TLabel
    Left = 625
    Top = 72
    Width = 15
    Height = 20
    Anchors = [akTop, akRight]
    Caption = #1045':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LblEb: TLabel
    Left = 593
    Top = 104
    Width = 52
    Height = 20
    Anchors = [akTop, akRight]
    Caption = #1045#1087#1088#1080#1083':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 724
    Top = 168
    Width = 51
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1088#1077#1079#1091#1083#1100#1090#1072#1090
  end
  object btnInit: TButton
    Left = 708
    Top = 8
    Width = 81
    Height = 41
    Anchors = [akTop, akRight]
    Caption = #1047#1072#1076#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnInitClick
  end
  object btnStart: TButton
    Left = 708
    Top = 48
    Width = 81
    Height = 41
    Anchors = [akTop, akRight]
    Caption = #1057#1090#1072#1088#1090
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnStartClick
  end
  object TxtN: TEdit
    Left = 647
    Top = 8
    Width = 57
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 0
    Text = '1000'
  end
  object TxtR: TEdit
    Left = 647
    Top = 40
    Width = 57
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 1
    Text = '5'
  end
  object TxtE: TEdit
    Left = 647
    Top = 72
    Width = 57
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 2
    Text = '150'
  end
  object TxtX: TEdit
    Left = 647
    Top = 136
    Width = 57
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 4
    Text = '1000'
  end
  object TxtY: TEdit
    Left = 647
    Top = 168
    Width = 57
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 5
    Text = '1000'
  end
  object checkT: TCheckBox
    Left = 588
    Top = 200
    Width = 49
    Height = 41
    Anchors = [akTop, akRight]
    Caption = 'dT'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object btnPause: TButton
    Left = 708
    Top = 88
    Width = 81
    Height = 41
    Anchors = [akTop, akRight]
    Caption = #1055#1072#1091#1079#1072
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = btnPauseClick
  end
  object btnGraph: TButton
    Left = 628
    Top = 368
    Width = 155
    Height = 41
    Anchors = [akTop, akRight]
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1075#1088#1072#1092#1080#1082
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = btnGraphClick
  end
  object RdgGraph: TRadioGroup
    Left = 628
    Top = 240
    Width = 155
    Height = 129
    Anchors = [akTop, akRight]
    Caption = #1043#1088#1072#1092#1080#1082#1080':'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 2
    Items.Strings = (
      #1088#1072#1079#1084#1077#1088#1085#1086#1089#1090#1100
      #1088#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1080#1077
      #1101#1083#1077#1084' '#1074' '#1082#1083#1072#1089#1090#1077#1088#1077)
    ParentFont = False
    TabOrder = 11
    OnClick = RdgGraphClick
  end
  object Chart: TChart
    Left = -8
    Top = 0
    Width = 584
    Height = 600
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      #1075#1088#1072#1092#1080#1082)
    View3D = False
    TabOrder = 13
    Visible = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    object Series1: TBarSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = #1082#1086#1083'-'#1074#1086' '#1101#1083#1077#1084
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series2: TBarSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Title = #1088#1072#1089#1087#1088#1077#1076#1077#1083
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series3: TPointSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clYellow
      Title = #1088#1072#1079#1084#1077#1088#1085#1086#1089#1090#1100
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Style = psCircle
      Pointer.VertSize = 2
      Pointer.Visible = True
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object btnticks: TButton
    Left = 708
    Top = 128
    Width = 81
    Height = 41
    Anchors = [akTop, akRight]
    Caption = #1055#1086#1076#1089#1095#1105#1090
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object TxtEb: TEdit
    Left = 649
    Top = 104
    Width = 57
    Height = 21
    Anchors = [akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = '400'
  end
  object Tmr1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Tmr1Timer
    Left = 592
    Top = 24
  end
end
