from random import choice as ch
from random import randint
from datetime import datetime
from time import mktime, gmtime


def mail():
    current_time = datetime.fromtimestamp(mktime(gmtime())+10800)

    eq_list = ['СХД NetApp FAS2650', 'СХД NetApp E2860', 'СХД NetApp AFF A250', 'Cisco Catalyst 9500',
                        'Cisco Catalyst 9300', 'Cisco Catalyst 9500', 'Eltex MES1124M']



    Rack_unique = [
        'A1', 'A10', 'A11', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'B1', 'B10', 
        'B11', 'B13', 'B14', 'B15', 'B16', 'B18', 'B2', 'B21', 'B22', 'B23', 'B24', 'B25', 
        'B26', 'B27', 'B28', 'B3', 'B31', 'B32', 'B34', 'B35', 'B36', 'B37', 'B4', 'B41', 
        'B42', 'B44', 'B45', 'B46', 'B47', 'B48', 'B49', 'B5', 'B6', 'B7', 'B8', 'C1', 'C10', 
        'C11', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9', 'D1', 'D10', 'D11', 'D12', 
        'D2', 'D3', 'D4', 'D5', 'D6', 'D7', 'D8', 'D9', 'E10', 'E11', 'E7', 'E9', 'F1', 
        'F10', 'F11', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'G1', 'G10', 'G11', 'G2', 
        'G3', 'G5', 'G6', 'G7', 'G8', 'H1', 'H10', 'H2', 'H3', 'H4', 'H5', 'H6', 'H7', 'H9'
    ]

    DH_unique = [
        {'504':["C", "E"]}, {'604':["D", "F"]}, {'704':["B", "F"]}, {'804':["E", "D"]}
    ]

    Client_unique = [
        {'DSD':DH_unique[2]}, {'DSH':DH_unique[3]}, {'DSP':DH_unique[1]}, {'DSS':DH_unique[1]}
    ]


    Name_pdpm_unique = [
        'PDU-5/1/1', 'PDU-5/1/3', 'PDU-5/1/4', 'PDU-5/1/5', 'PDU-5/3/1',
        'PDU-5/3/2', 'PDU-5/3/3', 'PDU-5/3/4', 'PDU-5/4/1', 'PDU-5/4/2',
        'PDU-5/4/3', 'PDU-5/4/4', 'PDU-5/4/5', 'PDU-5/4/6', 'PDU-5/4/7',
        'PDU-5/4/8', 'PDU-5/5/1', 'PDU-5/5/3', 'PDU-5/5/4', 'PDU-5/5/5',
        'PDU-7/1/1', 'PDU-7/1/2', 'PDU-7/1/3', 'PDU-7/2/3', 'PDU-7/4/2',
        'PDU-7/4/3', 'PDU-7/4/4', 'PDU-8/2/4', 'PDU-8/2/5', 'PDU-8/2/6',
        'PDU-8/3/1', 'PDU-8/3/2', 'PDU-8/3/3', 'PDU-8/3/4', 'PDU-8/3/5',
        'PDU-8/3/6', 'PDU-8/4/1', 'PDU-8/4/2', 'PDU-8/4/3', 'PDU-8/4/4',
        'PDU-8/4/5', 'PDU-8/4/6', 'PDU-8/4/7', 'PDU-8/4/8'
    ]

    Rack_pdpm_unique = [
        'A1', 'A2', 'A3', 'A7', 'B10', 'B2', 'B21', 'B6', 'B71', 'B85', 'C1', 'C28',
        'C41', 'C62', 'C66', 'C9', 'D11', 'D2', 'D6', 'D8', 'E1', 'E3', 'E5', 'E6',
        'E8', 'F10', 'F2', 'F5', 'F9', 'G1', 'G5', 'G7', 'H1', 'H10', 'H3', 'H5',
        'I2', 'I7', 'В47'
    ]

    Circuit_pdpm_unique = [
        '1/1', '1/2', '1/3', '10/1', '10/2', '10/3', '11/1', '12/1', '12/2', '12/3',
        '13/1', '13/2', '13/3', '14/1', '17/1', '17/2', '17/3', '19/1', '19/2',
        '19/3', '2/1', '2/2', '2/3', '20/1', '20/2', '20/3', '21/1', '21/2', '21/3',
        '22/1', '22/2', '22/3', '23/3', '24/1', '24/2', '24/3', '3/1', '3/2', '3/3',
        '4/1', '4/2', '5/1', '5/2', '5/3', '6/2', '6/3', '7/2', '8/1', '8/2', '8/3',
        '9/1', '9/2', '9/3'
    ]


    rack = ch(Rack_unique)
    client = ch(Client_unique)
    pdu = ch(Name_pdpm_unique)
    rack_pdpm = ch(Rack_pdpm_unique)
    circuit_pdpm= ch(Circuit_pdpm_unique)
    equipment = ch(eq_list)


    electicity_turnoff_pdpm = {"email_subject": "Отключение электропитания (PDPM)",
                            'email_body':
    f"""Тестирование!!!Коллеги, информируем вас о том, что {current_time} на станцию BMS поступило сообщение о падении мощности {pdu}-{list(list(client.values())[0].values())[0][0]}, автомат {circuit_pdpm},{list(client[list(client.keys())[0]].keys())[0]}.{rack_pdpm} до 0 кВт.
Статус автоматического выключателя - «OPEN» (линия разомкнута).
Сообщено главному инженеру Колоскову Тимофею и дежурному CS. Направлены дежурные инженеры для осмотра оборудования.
Клиент - {list(client.keys())[0]}""" }

    text_2 = {'email_subject':
            "Отключение электропитания (PDU)", 'email_body': 
    f"""Тестирование!!!
Коллеги, информируем вас о том, что {current_time} в {list(client[list(client.keys())[0]].keys())[0]}.{rack} системами мониторинга было зафисировано отключение {rack}.PDU-{list(list(client.values())[0].values())[0][int(randint(0, 1))]}.
Клиент - {list(client.keys())[0]}"""}

    text_3 = {'email_subject':"Отключение электропитания оборудования во время обслуживание инфраструктуры",
            'email_body': 
    f"""Тестирование!!!
Коллеги, информируем вас о том, что {current_time} при проведении планового обслуживания луча питания {list(list(client.values())[0].values())[0][0]}, инженерами ДатаСпейс зафиксировано отключение {list(client[list(client.keys())[0]].keys())[0]}.{rack}.PDU-{list(list(client.values())[0].values())[0][1]}.
В настоящее время стойка обесточена.
Также напоминаем вам, что работы по обслуживанию луча питания {list(list(client.values())[0].values())[0][0]} не могут быть отменены, либо приостановлены.
Клиент - {list(client.keys())[0]}"""}

    text_3p1 = {'email_subject':"Отключение электропитания оборудования во время обслуживание инфраструктуры",
            'email_body': 
    f"""Тестирование!!!
Коллеги, информируем вас о том, что {current_time} при проведении планового обслуживания луча питания {list(list(client.values())[0].values())[0][0]}, 
инженерами ДатаСпейс зафиксировано отключение питания на оборудовании клиента c двумя блоками питания, расположенного в машинном зале {list(client[list(client.keys())[0]].keys())[0]} в стойке {list(client[list(client.keys())[0]].keys())[0]}.{rack}.PDU-{list(list(client.values())[0].values())[0][1]},
юните {randint(1, 49)}. В настоящее время указанный луч питания полностью обесточен. 
Также напоминаем вам, что работы по обслуживанию луча питания {list(list(client.values())[0].values())[0][0]} не могут быть отменены, либо приостановлены.
Клиент - {list(client.keys())[0]}"""}

    text_4 = {'email_subject':"Изменение мироклимата стойки", 
            'email_body': 
    f"""Тестирование!!!
Информируем вас о том, что сегодня {current_time} поступил аварийный сигнал с датчика температуры стойки {rack} машинного зала {list(client[list(client.keys())[0]].keys())[0]}.
Необходим доступ в машинный зал для диагностики и устранения возможной аварии.
Просим согласовать незамедлительный доступ в машинный зал {list(client[list(client.keys())[0]].keys())[0]} для проведения осмотра и диагностики!
Клиент - {list(client.keys())[0]}"""}

    text_5 = {'email_subject':"Аварийное сообщение инфраструктурного оборудования ДХ",
            'email_body': 
    f"""Тестирование!!!
Информируем вас о том, что сегодня {current_time} поступил аварийный сигнал с устройства раннего обнаружения задымления VESDA машинного зала {list(client[list(client.keys())[0]].keys())[0]}.
Необходим доступ в машинный зал для диагностики и устранения возможной аварии.
Просим согласовать незамедлительный доступ в машинный зал {list(client[list(client.keys())[0]].keys())[0]} для проведения осмотра и диагностики!"""}

    text_6 = {'email_subject':"Снижение мощности в стойке",
            'email_body': 
    f"""Тестирование!!!
Информируем вас о том, что сегодня {current_time} на станцию BMS поступило сообщение о падении мощности на {pdu} {circuit_pdpm}, {list(client[list(client.keys())[0]].keys())[0]}.{rack_pdpm} до 0.0 kW.
Согласно данным CBAS статус автомата CLOSED (включен).
Клиент - {list(client.keys())[0]}"""}

    text_7 = {'email_subject':"Подключение KVM",
            'email_body': 
    f"""Тестирование!!!
Добрый день!
Подключите пожалуйста kvm к {equipment} в стойке {list(client[list(client.keys())[0]].keys())[0]}. Подключить нужно к консольному порту.
Клиент - {list(client.keys())[0]}"""}

    temp_list = [electicity_turnoff_pdpm, text_2, text_3, text_3p1 , text_4, text_5, text_7]
    result = ch(temp_list)

    return result