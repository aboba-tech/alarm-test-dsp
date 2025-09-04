# Выполнять скрипт или нет в данный запуск
$rnd = Get-Random -Minimum 1 -Maximum 2
if ($rnd -eq 1) {

# Настройки отправки сообщений
$email_From = 'noreply@dataspace.ru'
$email_To = 'service@dataspace.ru'
$email_Bcc = 'logim@dataspace.ru'
$email_SMTP_Server = '192.168.150.55'



# Получение текущей даты и времени.
$data = Get-Date -Format "dd.MM.yyyy"
$time = Get-Date -Format "HH:mm:ss"


# Список клиентов
$Client_list = @('DSD', 'DSH', 'DSP', 'DSS')

# Список машинных залов
$DH_list = @('502', '804', '504')

# Список оборудования
$Equipment_list = @('СХД NetApp FAS2650', 'СХД NetApp E2860', 'СХД NetApp AFF A250', 'Cisco Catalyst 9500', 'Cisco Catalyst 9300', 'Cisco Catalyst 9500', 'Eltex MES1124M')

# Список стоек
$Rack_list = @(
    [pscustomobject]@{Name='502.B11'; Rack='B11'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B13'; Rack='B13'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B14'; Rack='B14'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B15'; Rack='B15'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B16'; Rack='B16'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B18'; Rack='B18'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B21'; Rack='B21'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B22'; Rack='B22'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B23'; Rack='B23'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B24'; Rack='B24'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B25'; Rack='B25'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B26'; Rack='B26'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B27'; Rack='B27'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B28'; Rack='B28'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B31'; Rack='B31'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B32'; Rack='B32'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B34'; Rack='B34'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B35'; Rack='B35'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B36'; Rack='B36'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B37'; Rack='B37'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B41'; Rack='B41'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B42'; Rack='B42'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B44'; Rack='B44'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B45'; Rack='B45'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B46'; Rack='B46'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B47'; Rack='B47'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B48'; Rack='B48'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='502.B49'; Rack='B49'; DH='502'; L1='E'; L2='A'; Client='DSD'},
    [pscustomobject]@{Name='702.E11'; Rack='E11'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.E10'; Rack='E10'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.E9'; Rack='E9'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.E7'; Rack='E7'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.G3'; Rack='G3'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.H7'; Rack='H7'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.F11'; Rack='F11'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.F10'; Rack='F10'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.F8'; Rack='F8'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.F6'; Rack='F6'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.F5'; Rack='F5'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.F4'; Rack='F4'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.F3'; Rack='F3'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.F2'; Rack='F2'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.F1'; Rack='F1'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.G11'; Rack='G11'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.G10'; Rack='G10'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.G8'; Rack='G8'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.G7'; Rack='G7'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.G6'; Rack='G6'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.G5'; Rack='G5'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.G2'; Rack='G2'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.G1'; Rack='G1'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.H10'; Rack='H10'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.H9'; Rack='H9'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.H6'; Rack='H6'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.H5'; Rack='H5'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.H4'; Rack='H4'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.H3'; Rack='H3'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.H1'; Rack='H1'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.F7'; Rack='F7'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='702.H2'; Rack='H2'; DH='702'; L1='E'; L2='С'; Client='DSH'},
    [pscustomobject]@{Name='701.D9'; Rack='D9'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.D7'; Rack='D7'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.D6'; Rack='D6'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.D5'; Rack='D5'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.D4'; Rack='D4'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.D3'; Rack='D3'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.D2'; Rack='D2'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.D1'; Rack='D1'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.C9'; Rack='C9'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.C8'; Rack='C8'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.C7'; Rack='C7'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.C6'; Rack='C6'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.C5'; Rack='C5'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.C4'; Rack='C4'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.C3'; Rack='C3'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.C2'; Rack='C2'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.C1'; Rack='C1'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.B7'; Rack='B7'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.B6'; Rack='B6'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.B5'; Rack='B5'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.B4'; Rack='B4'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.B3'; Rack='B3'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.B2'; Rack='B2'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.B1'; Rack='B1'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.A8'; Rack='A8'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.A7'; Rack='A7'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.A6'; Rack='A6'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.A5'; Rack='A5'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.A4'; Rack='A4'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.A3'; Rack='A3'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.A1'; Rack='A1'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.H3'; Rack='H3'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.H2'; Rack='H2'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='701.A2'; Rack='A2'; DH='701'; L1='C'; L2='B'; Client='DSP'},
    [pscustomobject]@{Name='804.A1'; Rack='A1'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.A3'; Rack='A3'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.A4'; Rack='A4'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.A5'; Rack='A5'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.A6'; Rack='A6'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.A7'; Rack='A7'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.A8'; Rack='A8'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.A9'; Rack='A9'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.A10'; Rack='A10'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.A11'; Rack='A11'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.B1'; Rack='B1'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.B2'; Rack='B2'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.B3'; Rack='B3'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.B4'; Rack='B4'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.B5'; Rack='B5'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.B6'; Rack='B6'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.B7'; Rack='B7'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.B8'; Rack='B8'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.B10'; Rack='B10'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.B11'; Rack='B11'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.C1'; Rack='C1'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.C3'; Rack='C3'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.C6'; Rack='C6'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.C7'; Rack='C7'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.C8'; Rack='C8'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.C9'; Rack='C9'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.C10'; Rack='C10'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.C11'; Rack='C11'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.D1'; Rack='D1'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.D2'; Rack='D2'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.D3'; Rack='D3'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.D4'; Rack='D4'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.D5'; Rack='D5'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.D6'; Rack='D6'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.D7'; Rack='D7'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.D8'; Rack='D8'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.D9'; Rack='D9'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.D10'; Rack='D10'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.D11'; Rack='D11'; DH='804'; L1='E'; L2='D'; Client='DSS'},
    [pscustomobject]@{Name='804.D12'; Rack='D12'; DH='804'; L1='E'; L2='D'; Client='DSS'}
)


# Список PDPM
$PDPM_list = @(
    [pscustomobject]@{Name='PDU-5/1/1-C'; DH='501'; Rack='A1'; Circuit='1/1'; L1='С'; L2='D'},
    [pscustomobject]@{Name='PDU-5/1/5-D'; DH='501'; Rack='B2'; Circuit='4/2'; L1='C'; L2='D'},
    [pscustomobject]@{Name='PDU-5/1/3-C'; DH='501'; Rack='E6'; Circuit='2/3'; L1='C'; L2='D'},
    [pscustomobject]@{Name='PDU-5/1/4-D'; DH='501'; Rack='F2'; Circuit='4/2'; L1='C'; L2='D'},
    [pscustomobject]@{Name='PDU-5/5/1-E'; DH='505'; Rack='B21'; Circuit='3/3'; L1='E'; L2='A'},
    [pscustomobject]@{Name='PDU-5/5/5-A'; DH='505'; Rack='В47'; Circuit='11/1'; L1='E'; L2='A'},
    [pscustomobject]@{Name='PDU-5/5/3-E'; DH='505'; Rack='B71'; Circuit='6/3'; L1='E'; L2='A'},
    [pscustomobject]@{Name='PDU-5/5/4-A'; DH='505'; Rack='B85'; Circuit='10/3'; L1='E'; L2='A'},
    [pscustomobject]@{Name='PDU-5/3/1-F'; DH='503'; Rack='C62'; Circuit='4/1'; L1='F'; L2='B'},
    [pscustomobject]@{Name='PDU-5/3/2-B'; DH='503'; Rack='C66'; Circuit='5/2'; L1='B'; L2='F'},
    [pscustomobject]@{Name='PDU-5/3/3-F'; DH='503'; Rack='C28'; Circuit='6/2'; L1='F'; L2='B'},
    [pscustomobject]@{Name='PDU-5/3/4-B'; DH='503'; Rack='C41'; Circuit='9/3'; L1='B'; L2='F'},
    [pscustomobject]@{Name='PDU-5/4/1-A'; DH='504'; Rack='A1'; Circuit='1/1'; L1='A'; L2='D'},
    [pscustomobject]@{Name='PDU-5/4/1-A'; DH='504'; Rack='A1'; Circuit='1/2'; L1='A'; L2='D'},
    [pscustomobject]@{Name='PDU-5/4/1-A'; DH='504'; Rack='A1'; Circuit='1/3'; L1='A'; L2='D'},
    [pscustomobject]@{Name='PDU-5/4/2-D'; DH='504'; Rack='B2'; Circuit='10/1'; L1='A'; L2='D'},
    [pscustomobject]@{Name='PDU-5/4/2-D'; DH='504'; Rack='B2'; Circuit='10/2'; L1='A'; L2='D'},
    [pscustomobject]@{Name='PDU-5/4/2-D'; DH='504'; Rack='B2'; Circuit='10/3'; L1='A'; L2='D'},
    [pscustomobject]@{Name='PDU-5/4/3-F'; DH='504'; Rack='C1'; Circuit='1/1'; L1='F'; L2='A'},
    [pscustomobject]@{Name='PDU-5/4/3-F'; DH='504'; Rack='C1'; Circuit='1/2'; L1='F'; L2='A'},
    [pscustomobject]@{Name='PDU-5/4/3-F'; DH='504'; Rack='C1'; Circuit='1/3'; L1='F'; L2='A'},
    [pscustomobject]@{Name='PDU-5/4/4-A'; DH='504'; Rack='D2'; Circuit='12/1'; L1='F'; L2='A'},
    [pscustomobject]@{Name='PDU-5/4/4-A'; DH='504'; Rack='D2'; Circuit='12/2'; L1='F'; L2='A'},
    [pscustomobject]@{Name='PDU-5/4/4-A'; DH='504'; Rack='D2'; Circuit='12/3'; L1='F'; L2='A'},
    [pscustomobject]@{Name='PDU-5/4/5-F'; DH='504'; Rack='E1'; Circuit='1/1'; L1='F'; L2='A'},
    [pscustomobject]@{Name='PDU-5/4/5-F'; DH='504'; Rack='E1'; Circuit='1/2'; L1='F'; L2='A'},
    [pscustomobject]@{Name='PDU-5/4/5-F'; DH='504'; Rack='E1'; Circuit='1/3'; L1='F'; L2='A'},
    [pscustomobject]@{Name='PDU-5/4/6-A'; DH='504'; Rack='F2'; Circuit='12/1'; L1='F'; L2='A'},
    [pscustomobject]@{Name='PDU-5/4/6-A'; DH='504'; Rack='F2'; Circuit='12/2'; L1='F'; L2='A'},
    [pscustomobject]@{Name='PDU-5/4/6-A'; DH='504'; Rack='F2'; Circuit='12/3'; L1='F'; L2='A'},
    [pscustomobject]@{Name='PDU-5/4/7-D'; DH='504'; Rack='G1'; Circuit='1/1'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-5/4/7-D'; DH='504'; Rack='G1'; Circuit='1/2'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-5/4/7-D'; DH='504'; Rack='G1'; Circuit='1/3'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-5/4/8-E'; DH='504'; Rack='H3'; Circuit='9/1'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-5/4/8-E'; DH='504'; Rack='H3'; Circuit='9/2'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-5/4/8-E'; DH='504'; Rack='H3'; Circuit='9/3'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-7/1/1-B'; DH='701'; Rack='A1'; Circuit='12/1'; L1='B'; L2='C'},
    [pscustomobject]@{Name='PDU-7/1/1-B'; DH='701'; Rack='A1'; Circuit='12/2'; L1='B'; L2='C'},
    [pscustomobject]@{Name='PDU-7/1/1-B'; DH='701'; Rack='A1'; Circuit='12/3'; L1='B'; L2='C'},
    [pscustomobject]@{Name='PDU-7/1/2-C'; DH='701'; Rack='B2'; Circuit='2/1'; L1='C'; L2='B'},
    [pscustomobject]@{Name='PDU-7/1/2-C'; DH='701'; Rack='B2'; Circuit='2/2'; L1='C'; L2='B'},
    [pscustomobject]@{Name='PDU-7/1/2-C'; DH='701'; Rack='B2'; Circuit='2/3'; L1='C'; L2='B'},
    [pscustomobject]@{Name='PDU-7/1/3-B'; DH='701'; Rack='E1'; Circuit='1/1'; L1='B'; L2='C'},
    [pscustomobject]@{Name='PDU-7/1/3-B'; DH='701'; Rack='F2'; Circuit='7/2'; L1='C'; L2='B'},
    [pscustomobject]@{Name='PDU-7/1/3-B'; DH='701'; Rack='A1'; Circuit='3/1'; L1='C'; L2='E'},
    [pscustomobject]@{Name='PDU-7/1/3-B'; DH='701'; Rack='E3'; Circuit='17/1'; L1='E'; L2='C'},
    [pscustomobject]@{Name='PDU-7/1/3-B'; DH='701'; Rack='H5'; Circuit='12/3'; L1='C'; L2='E'},
    [pscustomobject]@{Name='PDU-7/1/3-B'; DH='701'; Rack='I2'; Circuit='17/2'; L1='E'; L2='C'},
    [pscustomobject]@{Name='PDU-7/1/3-B'; DH='701'; Rack='F10'; Circuit='5/1'; L1='F'; L2='D'},
    [pscustomobject]@{Name='PDU-7/1/3-B'; DH='701'; Rack='F10'; Circuit='5/2'; L1='F'; L2='D'},
    [pscustomobject]@{Name='PDU-7/1/3-B'; DH='701'; Rack='F10'; Circuit='5/3'; L1='F'; L2='D'},
    [pscustomobject]@{Name='PDU-7/1/3-B'; DH='701'; Rack='I7'; Circuit='19/3'; L1='D'; L2='F'},
    [pscustomobject]@{Name='PDU-7/1/3-B'; DH='701'; Rack='A2'; Circuit='1/1'; L1='F'; L2='D'},
    [pscustomobject]@{Name='PDU-7/1/3-B'; DH='701'; Rack='A2'; Circuit='1/2'; L1='F'; L2='D'},
    [pscustomobject]@{Name='PDU-7/1/3-B'; DH='701'; Rack='A2'; Circuit='1/3'; L1='F'; L2='D'},
    [pscustomobject]@{Name='PDU-7/1/3-B'; DH='701'; Rack='B10'; Circuit='8/1'; L1='D'; L2='F'},
    [pscustomobject]@{Name='PDU-7/1/3-B'; DH='701'; Rack='B10'; Circuit='8/2'; L1='D'; L2='F'},
    [pscustomobject]@{Name='PDU-7/1/3-B'; DH='701'; Rack='B10'; Circuit='8/3'; L1='D'; L2='F'},
    [pscustomobject]@{Name='PDU-7/1/3-B'; DH='701'; Rack='G7'; Circuit='13/1'; L1='E'; L2='F'},
    [pscustomobject]@{Name='PDU-7/1/3-B'; DH='701'; Rack='G7'; Circuit='13/2'; L1='E'; L2='F'},
    [pscustomobject]@{Name='PDU-7/1/3-B'; DH='701'; Rack='G7'; Circuit='13/3'; L1='E'; L2='F'},
    [pscustomobject]@{Name='PDU-7/4/2-F'; DH='704'; Rack='E5'; Circuit='19/1'; L1='F'; L2='E'},
    [pscustomobject]@{Name='PDU-7/4/3-E'; DH='704'; Rack='C1'; Circuit='22/1'; L1='E'; L2='F'},
    [pscustomobject]@{Name='PDU-7/4/3-E'; DH='704'; Rack='C1'; Circuit='22/2'; L1='E'; L2='F'},
    [pscustomobject]@{Name='PDU-7/4/3-E'; DH='704'; Rack='C1'; Circuit='22/3'; L1='E'; L2='F'},
    [pscustomobject]@{Name='PDU-7/4/4-F'; DH='704'; Rack='D8'; Circuit='24/1'; L1='F'; L2='E'},
    [pscustomobject]@{Name='PDU-7/4/4-F'; DH='704'; Rack='D8'; Circuit='24/2'; L1='F'; L2='E'},
    [pscustomobject]@{Name='PDU-7/4/4-F'; DH='704'; Rack='D8'; Circuit='24/3'; L1='F'; L2='E'},
    [pscustomobject]@{Name='PDU-7/2/3-A'; DH='702'; Rack='E1'; Circuit='2/1'; L1='A'; L2='C'},
    [pscustomobject]@{Name='PDU-7/2/3-A'; DH='702'; Rack='E1'; Circuit='2/2'; L1='A'; L2='C'},
    [pscustomobject]@{Name='PDU-7/2/3-A'; DH='702'; Rack='E1'; Circuit='2/3'; L1='A'; L2='C'},
    [pscustomobject]@{Name='PDU-8/2/4-C'; DH='802'; Rack='E8'; Circuit='9/1'; L1='C'; L2='A'},
    [pscustomobject]@{Name='PDU-8/2/4-C'; DH='802'; Rack='E8'; Circuit='9/2'; L1='C'; L2='A'},
    [pscustomobject]@{Name='PDU-8/2/4-C'; DH='802'; Rack='E8'; Circuit='9/3'; L1='C'; L2='A'},
    [pscustomobject]@{Name='PDU-8/2/5-A'; DH='802'; Rack='G5'; Circuit='5/1'; L1='A'; L2='C'},
    [pscustomobject]@{Name='PDU-8/2/5-A'; DH='802'; Rack='G5'; Circuit='5/2'; L1='A'; L2='C'},
    [pscustomobject]@{Name='PDU-8/2/5-A'; DH='802'; Rack='G5'; Circuit='5/3'; L1='A'; L2='C'},
    [pscustomobject]@{Name='PDU-8/2/6-C'; DH='802'; Rack='H1'; Circuit='10/1'; L1='C'; L2='A'},
    [pscustomobject]@{Name='PDU-8/2/6-C'; DH='802'; Rack='H1'; Circuit='10/2'; L1='C'; L2='A'},
    [pscustomobject]@{Name='PDU-8/2/6-C'; DH='802'; Rack='H1'; Circuit='10/3'; L1='C'; L2='A'},
    [pscustomobject]@{Name='PDU-8/3/1-B'; DH='803'; Rack='F5'; Circuit='3/1'; L1='B'; L2='D'},
    [pscustomobject]@{Name='PDU-8/3/1-B'; DH='803'; Rack='F5'; Circuit='3/2'; L1='B'; L2='D'},
    [pscustomobject]@{Name='PDU-8/3/1-B'; DH='803'; Rack='F5'; Circuit='3/3'; L1='B'; L2='D'},
    [pscustomobject]@{Name='PDU-8/3/2-D'; DH='803'; Rack='H10'; Circuit='23/3'; L1='D'; L2='B'},
    [pscustomobject]@{Name='PDU-8/3/3-B'; DH='803'; Rack='D6'; Circuit='14/1'; L1='B'; L2='D'},
    [pscustomobject]@{Name='PDU-8/3/4-D'; DH='803'; Rack='E3'; Circuit='8/1'; L1='D'; L2='B'},
    [pscustomobject]@{Name='PDU-8/3/4-D'; DH='803'; Rack='E3'; Circuit='8/2'; L1='D'; L2='B'},
    [pscustomobject]@{Name='PDU-8/3/4-D'; DH='803'; Rack='E3'; Circuit='8/3'; L1='D'; L2='B'},
    [pscustomobject]@{Name='PDU-8/3/5-B'; DH='803'; Rack='B6'; Circuit='1/1'; L1='B'; L2='D'},
    [pscustomobject]@{Name='PDU-8/3/5-B'; DH='803'; Rack='B6'; Circuit='1/2'; L1='B'; L2='D'},
    [pscustomobject]@{Name='PDU-8/3/5-B'; DH='803'; Rack='B6'; Circuit='1/3'; L1='B'; L2='D'},
    [pscustomobject]@{Name='PDU-8/3/6-D'; DH='803'; Rack='A7'; Circuit='20/3'; L1='D'; L2='B'},
    [pscustomobject]@{Name='PDU-8/4/1-D'; DH='804'; Rack='A3'; Circuit='3/1'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-8/4/1-D'; DH='804'; Rack='A3'; Circuit='3/2'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-8/4/1-D'; DH='804'; Rack='A3'; Circuit='3/3'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-8/4/2-E'; DH='804'; Rack='B6'; Circuit='17/1'; L1='E'; L2='D'},
    [pscustomobject]@{Name='PDU-8/4/2-E'; DH='804'; Rack='B6'; Circuit='17/2'; L1='E'; L2='D'},
    [pscustomobject]@{Name='PDU-8/4/2-E'; DH='804'; Rack='B6'; Circuit='17/3'; L1='E'; L2='D'},
    [pscustomobject]@{Name='PDU-8/4/3-D'; DH='804'; Rack='C9'; Circuit='8/1'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-8/4/3-D'; DH='804'; Rack='C9'; Circuit='8/2'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-8/4/3-D'; DH='804'; Rack='C9'; Circuit='8/3'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-8/4/4-E'; DH='804'; Rack='D11'; Circuit='21/1'; L1='E'; L2='D'},
    [pscustomobject]@{Name='PDU-8/4/4-E'; DH='804'; Rack='D11'; Circuit='21/2'; L1='E'; L2='D'},
    [pscustomobject]@{Name='PDU-8/4/4-E'; DH='804'; Rack='D11'; Circuit='21/3'; L1='E'; L2='D'},
    [pscustomobject]@{Name='PDU-8/4/5-D'; DH='804'; Rack='F9'; Circuit='19/1'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-8/4/5-D'; DH='804'; Rack='F9'; Circuit='19/2'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-8/4/5-D'; DH='804'; Rack='F9'; Circuit='19/3'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-8/4/6-E'; DH='804'; Rack='E6'; Circuit='5/1'; L1='E'; L2='D'},
    [pscustomobject]@{Name='PDU-8/4/6-E'; DH='804'; Rack='E6'; Circuit='5/2'; L1='E'; L2='D'},
    [pscustomobject]@{Name='PDU-8/4/6-E'; DH='804'; Rack='E6'; Circuit='5/3'; L1='E'; L2='D'},
    [pscustomobject]@{Name='PDU-8/4/7-D'; DH='804'; Rack='G1'; Circuit='1/1'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-8/4/7-D'; DH='804'; Rack='G1'; Circuit='1/2'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-8/4/7-D'; DH='804'; Rack='G1'; Circuit='1/3'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-8/4/8-E'; DH='804'; Rack='H10'; Circuit='20/1'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-8/4/8-E'; DH='804'; Rack='H10'; Circuit='20/2'; L1='D'; L2='E'},
    [pscustomobject]@{Name='PDU-8/4/8-E'; DH='804'; Rack='H10'; Circuit='20/3'; L1='D'; L2='E'}
)


# Выбор типа письма случайным образом
$test_type = Get-Random -Minimum 1 -Maximum 101


if ($test_type -le 30) {

  # Тема письма
  $email_subject = "Отключение электропитания (PDPM)"

  # Выбор PDPM и автомата случайным образом
  $PDPM = $PDPM_list[$(Get-Random -Minimum 0 -Maximum $($PDPM_list.Count))]

  # Выбор клиента случайным образом
  $Client = $Client_list[$(Get-Random -Minimum 0 -Maximum $($Client_list.Count))]

  # Формаирование тела письма
  $email_body = "Тестирование!!!

Коллеги, информируем вас о том, что " + $data + " в " + $time + " на станцию BMS поступило сообщение о падении мощности " + $PDPM.Name + ", автомат " + $PDPM.Circuit + ", " + $PDPM.DH + "." + $PDPM.Rack + " до 0 кВт. 
Статус автоматического выключателя - «OPEN» (линия разомкнута).
Сообщено главному инженеру Колоскову Тимофею и дежурному CS.
Направлены дежурные инженеры для осмотра оборудования.
Клиент - " + $Client

}


elseif ($test_type -le 60) {

  # Тема письма
  $email_subject = "Отключение электропитания (PDU)"

  # Выбор стойки случайным образом
  $Rack = $Rack_list[$(Get-Random -Minimum 0 -Maximum $($Rack_list.Count))]

  # Выбор луча случайным образом
  $L_number = Get-Random -Minimum 1 -Maximum 3
  if ($test_type -eq 1) {
    $L = $Rack.L1
  }
  else {
    $L = $Rack.L2
  }

  # Формаирование тела письма
  $email_body = "Тестирование!!!

Коллеги, информируем вас о том, что " + $data + " в " + $time + " в " + $Rack.Name + " системами мониторинга было зафисировано отключение " + $Rack.Name + ".PDU-" + $L + ". 
Клиент - " + $Rack.Client

}


elseif ($test_type -le 74) {

  # Тема письма
  $email_subject = "Отключение электропитания оборудования во время обслуживание инфраструктуры"

  # Выбор стойки случайным образом
  $Rack = $Rack_list[$(Get-Random -Minimum 0 -Maximum $($Rack_list.Count))]

  # Выбор луча случайным образом
  $L_number = Get-Random -Minimum 1 -Maximum 3
  if ($test_type -eq 1) {
    $L = $Rack.L1
  }
  else {
    $L = $Rack.L2
  }

  # Формаирование тела письма
  $email_body = "Тестирование!!!

Коллеги, информируем вас о том, что " + $data + " в " + $time + " при проведении планового обслуживания луча питания " + $L + ", 
инженерами ДатаСпейс зафиксировано отключение " + $Rack.Name + ".PDU-" + $L + ".
В настоящее время стойка обесточена. 
Также напоминаем вам, что работы по обслуживанию луча питания " + $L + " не могут быть отменены, либо приостановлены.
Клиент - " + $Rack.Client
}


elseif ($test_type -le 87) {

  # Тема письма
  $email_subject = "Отключение электропитания оборудования во время обслуживание инфраструктуры"

  # Выбор стойки случайным образом
  $Rack = $Rack_list[$(Get-Random -Minimum 0 -Maximum $($Rack_list.Count))]

  # Выбор луча случайным образом
  $L_number = Get-Random -Minimum 1 -Maximum 3
  if ($test_type -eq 1) {
    $L = $Rack.L1
  }
  else {
    $L = $Rack.L2
  }

  # Формаирование тела письма
  $email_body = "Тестирование!!!

Коллеги, информируем вас о том, что " + $data + " в " + $time + " при проведении планового обслуживания луча питания " + $L + ", 
инженерами ДатаСпейс зафиксировано отключение питания на оборудовании клиента c двумя блоками питания, расположенного в машинном зале " + $Rack.DH + " в стойке " + $Rack.Name +  ".PDU-" + $L + ",
юните " +$(Get-Random -Minimum 1 -Maximum 49) + ". В настоящее время указанный луч питания полностью обесточен. 
Также напоминаем вам, что работы по обслуживанию луча питания " + $L + " не могут быть отменены, либо приостановлены.
Клиент - " + $Rack.Client
}


elseif ($test_type -le 100) {

  # Тема письма
  $email_subject = "Отключение электропитания оборудования во время обслуживание инфраструктуры"

  # Выбор стойки случайным образом
  $Rack = $Rack_list[$(Get-Random -Minimum 0 -Maximum $($Rack_list.Count))]

  # Выбор луча случайным образом
  $L_number = Get-Random -Minimum 1 -Maximum 3
  if ($test_type -eq 1) {
    $L = $Rack.L1
  }
  else {
    $L = $Rack.L2
  }

  # Формаирование тела письма
  $email_body = "Тестирование!!!

Коллеги, информируем вас о том, что " + $data + " в " + $time + " при проведении планового обслуживания луча питания " + $L + ", 
инженерами ДатаСпейс зафиксировано отключение питания на оборудовании клиента c одним блоком питания, расположенного в машинном зале " + $Rack.DH + " в стойке " + $Rack.Name +  ".PDU-" + $L + ",
юните " +$(Get-Random -Minimum 1 -Maximum 49) + ". В настоящее время указанный луч питания полностью обесточен. 
Также напоминаем вам, что работы по обслуживанию луча питания " + $L + " не могут быть отменены, либо приостановлены.
Клиент - " + $Rack.Client
}


elseif ($test_type -le 101) {

  # Тема письма
  $email_subject = "Изменение мироклимата стойки"

  # Выбор стойки случайным образом
  $Rack = $Rack_list[$(Get-Random -Minimum 0 -Maximum $($Rack_list.Count))]

  # Формаирование тела письма
  $email_body = "Тестирование!!!

Информируем вас о том, что сегодня " + $data + " в " + $time + " поступил аварийный сигнал с датчика температуры стойки " + $Rack.Name + " машинного зала " + $Rack.DH + ".
Необходим доступ в машинный зал для диагностики и устранения возможной аварии.
Просим согласовать незамедлительный доступ в машинный зал " + $DH + " для проведения осмотра и диостики!
Клиент - " + $Rack.Client

}



elseif ($test_type -le 101) {

  # Тема письма
  $email_subject = "Аварийное сообщение инфраструктурного оборудования ДХ"

  # Выбор машинного зала случайным образом
  $DH = $DH_list[$(Get-Random -Minimum 0 -Maximum $($DH_list.Count))]

  # Формаирование тела письма
  $email_body = "Тестирование!!!

Информируем вас о том, что сегодня " + $data + " в " + $time + " поступил аварийный сигнал с устройства раннего обнаружения задымления VESDA машинного зала " + $DH + ".
Необходим доступ в машинный зал для диагностики и устранения возможной аварии.
Просим согласовать незамедлительный доступ в машинный зал " + $DH + " для проведения осмотра и диостики!"

}


elseif ($test_type -le 101) {

  # Тема письма
  $email_subject = "Аварийное сообщение инфраструктурного оборудования ДХ"

  # Выбор машинного зала случайным образом
  $DH = $DH_list[$(Get-Random -Minimum 0 -Maximum $($DH_list.Count))]

  # Формаирование тела письма
  $email_body = "Тестирование!!!

Информируем вас о том, что сегодня " + $data + " в " + $time + " поступил аварийный сигнал с прецизионного кондиционера CRAC машинного зала " + $DH + ".
Необходим доступ в машинный зал для осмотра и диагностики.
Просим согласовать незамедлительный доступ в машинный зал " + $DH + " для проведения осмотра и диостики!"

}


elseif ($test_type -le 101) {

  # Тема письма
  $email_subject = "Снижение мощности в стойке"

  # Выбор PDPM и автомата случайным образом
  $PDPM = $PDPM_list[$(Get-Random -Minimum 0 -Maximum $($PDPM_list.Count))]

  # Выбор клиента случайным образом
  $Client = $Client_list[$(Get-Random -Minimum 0 -Maximum $($Client_list.Count))]

  # Формаирование тела письма
  $email_body = "Тестирование!!!

Информируем вас о том, что сегодня " + $data + " в " + $time + " на станцию BMS поступило сообщение о падении мощности на " + $PDPM.Name + " " + $PDPM.Circuit + ", " + $PDPM.DH + "." + $PDPM.Rack + " до 0.0 kW.
Согласно данным CBAS статус автомата CLOSED (включен).
Клиент - " + $Rack.Client

}


else {

  # Тема письма
  $email_subject = "Подключение KVM"

  # Выбор оборудования случайным образом
  $Equipment = $Equipment_list[$(Get-Random -Minimum 0 -Maximum $($Equipment_list.Count))]

  # Выбор клиента случайным образом
  $Client = $Client_list[$(Get-Random -Minimum 0 -Maximum $($Client_list.Count))]

  # Формаирование тела письма
  $email_body = "Тестирование!!!

Добрый день!
Подключите пожалуйста kvm к " + $Equipment + " в стойке 303.С1. Подключить нужно к консольному порту.
Клиент - " + $Rack.Client

}


# Отправка сообщения
Send-MailMessage -From $email_From -Subject $email_subject  -To $email_To -Bcc $email_Bcc  -SmtpServer $email_SMTP_Server -Body $email_body -Encoding ([System.Text.Encoding]::UTF8)

}


exit 