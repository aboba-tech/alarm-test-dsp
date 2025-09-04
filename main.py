
from time import gmtime, mktime
from datetime import datetime
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.header import Header
import smtplib
from random import randint
from random import choice as ch
import mails


email_from = 'noreply@dataspace.ru'
email_to = 'maxim.nazarenko@dataspace.ru'
# email_blind_carbon_copy = 'maxim.nazarenko@dataspace.ru'
email_smtp_server = '192.168.150.55'


choice = ch(mails.temp_list)
text = str(list(choice.values())[1])
header = str(list(choice.values())[0])

msg = MIMEMultipart()
msg['From'] = email_from
msg['To'] = email_to
msg['Subject'] = Header(header, 'utf-8')



msg.attach(MIMEText(text, 'plain', 'utf-8'))

# Add the From: and To: headers at the start!
# lines = [f"From: {email_from}", f"To: {', '.join(email_to)}", ""]

# lines.append(text)
# lines.append('mesg')

# msg = "\r\n".join(lines)
print(text, type(text))


try:
    server = smtplib.SMTP(email_smtp_server)
    server.set_debuglevel(1)
    server.sendmail(email_from, email_to, msg.as_string())

# except Exception as e:
#     print(f'Возникла ошибка {e}')

finally:
    if 'server' in locals() and server:
        server.quit()