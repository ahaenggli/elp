object Form2: TForm2
  Left = 1
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'cadac'
  ClientHeight = 362
  ClientWidth = 434
  Color = clBtnFace
  Constraints.MaxHeight = 400
  Constraints.MaxWidth = 450
  Constraints.MinHeight = 400
  Constraints.MinWidth = 450
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = -15
    Top = -28
    Width = 464
    Height = 400
    Center = True
    Enabled = False
    Stretch = True
  end
  object Label1: TLabel
    Left = 145
    Top = 197
    Width = 105
    Height = 13
    Caption = '                                   '
  end
  object Label2: TLabel
    Left = 381
    Top = 62
    Width = 6
    Height = 13
    Caption = '3'
    Visible = False
  end
  object Label3: TLabel
    Left = 381
    Top = 126
    Width = 6
    Height = 13
    Caption = '2'
    Visible = False
  end
  object Label6: TLabel
    Left = 286
    Top = 283
    Width = 52
    Height = 13
    Caption = 'Abbrechen'
  end
  object Label5: TLabel
    Left = 364
    Top = 19
    Width = 7
    Height = 13
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 280
    Top = 19
    Width = 78
    Height = 13
    Caption = 'Fehlerpunkte:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 280
    Top = 112
    Width = 96
    Height = 13
    Caption = '                                '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Memo2: TMemo
    Left = 24
    Top = 246
    Width = 241
    Height = 62
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    HideSelection = False
    Lines.Strings = (
      'Memo2')
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 24
    Top = 170
    Width = 241
    Height = 21
    TabOrder = 1
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 381
    Top = 81
    Width = 31
    Height = 21
    Enabled = False
    TabOrder = 2
    Text = '0'
    Visible = False
  end
  object Button1: TBitBtn
    Left = 316
    Top = 161
    Width = 40
    Height = 40
    TabOrder = 4
    OnClick = Button1Click
    Glyph.Data = {
      FE0A0000424DFE0A00000000000036000000280000001E0000001E0000000100
      180000000000C80A0000C40E0000C40E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002778BB1C75BA
      808AA0B8A3A300000000000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000002679BC129BF046BAF757AADB9B
      B2C9000000000000FFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000003081C31095EA4ABEFA8CDFFEB1F1FC4DB0E30000
      0000000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000002779BD0F95EA42B9F98DDFFFB7F6FF7CE4FE38ADEC000000000000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002779
      BD129BF04ABDFA8DDFFFB9F7FF71DDFC37AEED00000000000000000097FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000003081C31095EA4ABDFA
      8CDFFEB7F5FF70DDFC45B5EE000000000000000000000000ABFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000002679BC1095EA42B9F98DDFFFB7F5FF7B
      E4FE39AEED00000000000000000000000000000000FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000001298ED4ABEFA8DDFFFB9F7FF70DDFC39AEED0000
      0000000000000000000000000000000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000003992CE83D6F9B7F6FF71DDFC45B5EE000000000000000000
      000000000000000000000000F6FF000000000000000000000000000000000000
      A68D8D9F83839F8484A38888A88E8EAF9797B5A0A0BDA9A90000000000000000
      00AB92928C9EB56DB8E076DFFC37AEED00000000000000000000000000000000
      0000000000000000ABFF000000000000000000000000A88F8F917373A38783B8
      A299D1C2B9E4DAD5E3DAD6D6C9C3C5B3ADC3B0ADBCA7A7AB9191B59F9FD8CBCB
      BFABAB0000000000000000000000000000000000000000000000000000000000
      0000000000FF0000000000000000009C8080967674B49487EAD9C1FBF6E0FFFE
      EFFFFFFAFFFFFDFFFFF7FBF9E8EDE2CFCEB9AEC8B6B5BFABABCDBDBD00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF000000000000A89090937372C19A87F9DBBBFFF0D3FFFAE2FFFEEDFFFFF6
      FFFFF9FFFFF4FFFDEAFFF7DDFCE8CBD3B9ABCFBEBDCAB9B90000000000000000
      00000000000000000000000000000000000000000000000000000000C1FF0000
      00000000917171B88B77FACCA7FFDDBAFFEACCFFF4DAFFFCE5FFFDEBFFFEEDFF
      FDEAFFFAE2FFF1D5FFE6C6FCD7B3D8BBABCFC0C0000000000000000000000000
      000000000000000000000000000000000000000000000000A3FF0000009F8484
      99736DEFB48BFDCCA3FFD7B2FFE3C1FFECCFFFF4D9FFF9E0FFF9E1FFF7DEFFF1
      D5FFE9CAFFDFBDFFD3ADF0C1A0DAC8C3D2C4C400000000000000000000000000
      000000000000000000000000000000000000000000FF000000987B7BB6826CFA
      BA8CFCC59AFECFA8FFDAB6FFE2C1FFE9CAFFEDD0FFEED1FFEDCFFFE7C7FFDFBD
      FFD7B2FDCCA3F9C096DBB7A5D8CCCC0000000000000000000000000000000000
      0000000000000000000000000000000000FF0000009D7D7AD18E69F9B281FBBB
      8EFCC59BFECFA8FFD6B1FFDBB8FFDFBDFFE0BEFFDEBBFFDAB5FFD3AEFECCA3FC
      C297FBB988E4AD8BDCD1D1000000000000000000000000000000000000000000
      00000000000000000000000087FF000000A3817BDA8F65F7A976F9B382FBBB8E
      FCC49AFDCBA2FED0A8FFD2ACFFD3ADFED2ABFDCDA6FDC99FFDC598FEC18DFEBB
      81EDAD81DCD1D100000000000000000000000000000000000000000000000000
      0000000000000000B5FF000000A78580DC8F64F7A26CF8AB77FCBB87FEC895FE
      D09DFFD4A4FFD6A8FED3A7FDD0A5FED0A2FED1A1FFD09CFFCB93FFC289EEAE81
      DDD3D30000000000000000000000000000000000000000000000000000000000
      0000000000FF000000AA8D8AD58E67FAAD75FEC188FFCD96FFD5A1FFDBAAFFE1
      B1FFE5B6FFE6B8FFE6B8FFE5B5FFE0B0FFDBA9FFD39EFFCA93E8B28DE1D7D700
      0000000000000000000000000000000000000000000000000000000000000000
      00FF000000AB9191C68D72FFC187FFCC95FFD49FFFDCABFFE4B5FFE9BCFFEDC2
      FFEEC4FFEEC4FFECC1FFE8BCFFE4B5FFDCAAFDCE9AE3BBA4E0D7D70000000000
      0000000000000000000000000000000000000000000000000000000085FF0000
      00AF9797B28F87F7BA85FFD19DFFDBA9FFE5B5FFEBBFFFEFC6FFF1CBFFF2CEFF
      F2CEFFF1CBFFEFC6FFEBBFFFE4B5F6CA9EE5D1C9DCD2D2000000000000000000
      000000000000000000000000000000000000000000000000D8FF000000000000
      B69F9FCB9A7FFBD09FFFE2B3FFEBC0FFF0C9FFF2CFFFF4D5FFF5D8FFF5D8FFF4
      D4FFF2CFFFF0C9FDE1B4E5C5B0E0D6D600000000000000000000000000000000
      0000000000000000000000000000000000000000D5FF000000000000BBA7A7C0
      A8A4DBB090FBDFB2FFEFC6FFF2CEFFF5D6FFF7DEFFF8E2FFF8E2FFF7DDFFF4D6
      FDEBC8EAC8AFE3D6D3DFD5D50000000000000000000000000000000000000000
      0000000000000000000000000000000000FF000000000000000000B7A3A3C7B0
      ADD5AE96FBE2BBFFF3D2FFF7DCFFF9E5FFFAEAFFFAEAFFF8E3FAE5CAE5C6B2E5
      DAD9DDD2D2000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF000000000000000000000000C5B4B4CBBBBB
      CEB5ADDEBEABE9D0BAEFDCCAEFDED0ECD7CAE5CBBCE0CEC9E2D9D9DDD3D30000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000BAFF000000000000000000000000000000000000CAB9B9D3
      C4C4DBCBC9DECDC9E0D0CDE1D4D1DDD3D3DCD0D0000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF}
  end
  object BitBtn2: TBitBtn
    Left = 344
    Top = 274
    Width = 75
    Height = 34
    TabOrder = 14
    OnClick = BitBtn2Click
    Glyph.Data = {
      36090000424D3609000000000000360000002800000020000000180000000100
      18000000000000090000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9E1E1E1
      E8E8E8F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFEFEFEEDEDEDE1E1E1F2F2F2FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0B7ACB28850
      9B876DABA8A6D3D3D3EDEDEDFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFF0F0F0B7A46AA6935B9E978AC0C0C0E2E2E2F6F6F6FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAAC73FFCA27
      FFBB25E5A42AB28D4A9F927DB3B2B2DBDBDBF2F2F2FDFDFDFFFFFFFFFFFFFFFF
      FFFFFFFFE0DFDAFFF238FFF83BFDD932CBA93FA28F65A59F98C9C9C9E8E8E8F8
      F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4B080FFC129
      FFB61EFFC223FFCC29FFC729DCA932AB90569F9789BDBDBDE1E1E1F5F5F5FFFF
      FFFFFFFFE6E5E3F6DB3DFFE935FFE831FFEB35FFE434F3C42EBF9A439D8C6EAB
      A8A5D2D2D2EDEDEDFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6BA9FFFDE7C
      FFCB6BFFC345FFBE2AFFC222FFCC27FFD52DFFC72AD0A53AA48E60A39D95C7C7
      C7EAEAEAEDEDEDEBD371FFF088FFE563FFDD40FFD72DFFD82BFFDA2EFFD02CE7
      AE2CB38C489C8F7AB2B0B0D9D9D9F0F0F0FDFDFDFFFFFFFFFFFFD7D3CAFFBE33
      FFBF55FFD07AFFD580FFD169FFC946FFC52BFFC925FFD32AFFD62DF7BF2BC39D
      409F8D6BB0ACA9C5AC59FFE452FFE275FFE587FFE27DFFD95CFFCD38FFC625FF
      C523FFC626FFB724DA962AA982509D9286BBBBBBE0E0E0F7F7F7F4F4F4F0B242
      FFB441FFB73DFFBF4AFFCB66FFD67FFFD981FFD56AFFCC45FFC82BFFCC26FFD4
      2AFFD12CE8AF2DE1AD32FFD647FFD44AFFD24AFFD55EFFDA78FFDC84FFD879FF
      CA55FFBB2FFFB21DFFB11BFFAB1DF3911AC0752B997559C2C0C0FFFFFFD2AC69
      FFBC5DFAB757FEBD50FFBD48FFBE42FFC34AFFCD62FFD77EFFDB83FFD56AFFCC
      43FFC62AFFC924FFC623FFCE4FFFD667FFD25CFFCE52FFC948FFC546FFC755FF
      CE6FFFD282FFCC75FCB64CF39925EA8312EC7D11FB8516AD9783FFFFFFC6B599
      FFBE5FF3B266F8B960FDBE5CFFC158FFC152FFBF43FFBB32FFBF39FFCD63FFD8
      83FFDA83FFD166FFC239FFC544FFD473FFD16AFFCD64FFCA5EFFC657FFC04BFF
      B637FDAC2BF8AD46F4B66EF3BC7FF0B16EEC9A44F18520AC9079FFFFFFD7D3CD
      FAB156EFB278F3B46EF7B96AFABD66FDC161FFC25EFFC359FFBC41FFB21DFFB5
      21FFBF3DFFCC66FFDC83FFCB53FFD178FFD179FFCE71FFCA6BFFC665FEC15FFB
      BA5AF5AC4BEE9123EA830EEB8B22EA9848EEAC72FDA564BDA797FFFFFFF6F6F6
      DFA158F1B889EEB37DF1B679F4B974F7BB6FF9BD6AFDC366FFC766FFC151FFB2
      25FFB51DFFB71CD7AE64D1B177FFD47CFFD389FECE80FDC979FBC373F7BB6CF3
      B266F2AD61F1AA5BE98F2FE47711E8710ED57025C2A18CF5F5F5FFFFFFFFFFFF
      C69B70F7BC91EBB48DEDB487EFB682F2BA7EF9C27AFDC978FECB78FFCC6EFFB7
      35DAAD5ED4CDC0FFFFFFDCD9D5FFC86EFCD39BF9CB8EF7C588F5BF82F3BA7BF2
      B776F1B474F2B070F3994ED7782EC4A58FECEBEBFFFFFFFFFFFFFFFFFFFFFFFF
      C2AD9AF8B98DE9B89FEBB996F1C092F6C892FACD93FFCA83FFB456D7A867D7CF
      C5FFFFFFFFFFFFFFFFFFF6F6F6E4AB64FCD5ABF4C99CF3C596F3C391F3C391F6
      BF8BF6AA6AD88A4DC4A690F0EEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      D9D3D1EBA87AF0CBB7F3CDACF7D3AEFECB99F3A95FC79C6DD6CFC8FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFC69F75FFD9B5F5D0AEF5D1AEF9CDA7F9B47DD4
      8B55BFA896F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      F9F9F9D19672FEE9D8FCCFB0EA9F68C2926CD5CECAFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFC1AD9CFFDBB9FCE0C9F9BB8FD38D5CC0A796F2
      F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC19683E69D77BF8D71D8D2D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFDCD7D4ECA170D18E65C3AA9BF6F6F6FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFE1CBC1DAA993E8E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5EDB593D1BFB6FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  end
  object BitBtn1: TBitBtn
    Left = 184
    Top = 283
    Width = 81
    Height = 25
    Caption = 'Als Eingabe'
    TabOrder = 15
    OnClick = BitBtn1Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFD3956FCB8257C87545C97B4DCA7B4DC97B4DC97B
      4DCA7A4DCA8054CC865CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCA8255FC
      F3ECFAF1E8FAF0E7FBF1E9FBF2EAFBF2EAFBF2EBFDF4EECB8258FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFCF8253EFF1E7FFE9D9FFEADBFFE9D9FFE7D7FFE5
      D2FFE2CBEFF2E8CE8156FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC8454FB
      F5EEFFE9D9FFEADBFFE9D9FFE7D7FFE5D2FFE2CBFBF6EFCC8355D69D7BD2926D
      CF875DD08C64D18C64D08C64CA8452FFF7F1FFE9D9FFEADBFFE9D9FFE7D7FFE5
      D2FFE2CBFFF7F1CB8555D1926CFCF4EEFAF2EAFAF1EAFBF2EBFBF3ECE4BA91FF
      F7F0FFE7D5FDE7D6FDE6D4FCE4D0FBE3CBFADCC2FEF3E8CC8656D59269F1F2EA
      FFEBDDFFECDFFFEBDDFFEADCE4BB91FFF7F2FEE7D5FEE7D5FDE5D1FAE0CAF9DE
      C4F7D9BCFDF2E7CC8757D3946AFBF6F0FFEBDDFFECDFFFEBDDFFEADCE4BB92FE
      F7F1FCE5D2FCE4D1FBE2CCF9DDC4F6D7BBF3D1AFFAEFE4CC8758D1956AFFF8F2
      FFEBDDFFECDFFFEBDDFFEADCE4BB92FEF6F0FCE2CDFCE3CDFADFC8F7D9BCF5E9
      DDFAF3EBFBF8F3CA8353D2966BFFF8F1FFEADAFDEADBFDE9D9FCE7D6E4BB93FE
      F5EDFCDEC5FBE0C7F9DCC2F5D3B4FEF9F3FAE2C4ECC193DCB495D2976CFFF8F3
      FEEADAFEEADAFDE8D6FAE4D0E5BE96FFFFFEFDF3E9FDF3EAFCF2E8FAEFE3FAF2
      E7EABB88DDA987FBF7F5D2976DFEF8F2FCE8D7FCE7D6FBE5D2F9E1CBEAC39DE6
      BF96E4BB92E4BB92D2A371D1A172D3A576E1BCA1FCF9F8FFFFFFD2976DFEF7F1
      FCE5D3FCE6D3FAE3CFF8DDC4F6EBE1FAF4EDFBF8F4D3A37AFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFD2976EFEF6EFFCE2CCFBE4CEF9E0C9F6D8BDFEF9F4FA
      E5CBEEC9A0E0BDA3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD39B73FFFFFF
      FDF4EBFDF4ECFCF3EAFAF1E6FAF3EAECC397E1B497FCF9F7FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFD9A584D59D75D2976CD2986DD3986DD2976ED39970E5
      C5ADFCFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  end
  object Memo1: TMemo
    Left = 24
    Top = 56
    Width = 241
    Height = 62
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    WantReturns = False
    WordWrap = False
  end
  object StaticText1: TStaticText
    Left = 24
    Top = 33
    Width = 53
    Height = 20
    Caption = 'Abfrage'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object StaticText2: TStaticText
    Left = 24
    Top = 147
    Width = 57
    Height = 20
    Caption = 'Eingabe'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object StaticText3: TStaticText
    Left = 24
    Top = 220
    Width = 52
    Height = 20
    Caption = 'L'#246'sung'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object StaticText4: TStaticText
    Left = 280
    Top = 38
    Width = 79
    Height = 17
    Caption = 'W'#246'rter '#252'brig:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object StaticText5: TStaticText
    Left = 280
    Top = 62
    Width = 68
    Height = 17
    Caption = 'Durchgang:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  object StaticText6: TStaticText
    Left = 280
    Top = 85
    Width = 42
    Height = 17
    Caption = 'Fehler:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
  end
  object StaticText7: TStaticText
    Left = 364
    Top = 38
    Width = 11
    Height = 17
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
  end
  object StaticText8: TStaticText
    Left = 350
    Top = 62
    Width = 11
    Height = 17
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
  end
  object StaticText9: TStaticText
    Left = 350
    Top = 85
    Width = 11
    Height = 17
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
  end
  object Button2: TButton
    Left = 351
    Top = 342
    Width = 75
    Height = 18
    Caption = 'Fehler melden'
    TabOrder = 16
    OnClick = Button2Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 384
    Top = 30
  end
  object ActionList1: TActionList
    Left = 264
    Top = 320
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 112
      OnExecute = Action1Execute
    end
  end
end
