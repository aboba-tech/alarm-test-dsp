
from time import gmtime, mktime
from datetime import datetime
import smtplib
from random import randint
from random import choice as ch
import mails



email_from = 'noreply@dataspace.ru'
email_to = 'maxim.nazarenko@dataspace.ru'.split()
# email_blind_carbon_copy = 'maxim.nazarenko@dataspace.ru'
email_smtp_server = '192.168.150.55'


choice = ch(mails.temp_list)
text = list(choice.values())[1]

# from_addr = prompt("From: ")
# to_addrs  = prompt("To: ").split()
print("Enter message, end with ^D (Unix) or ^Z (Windows):")

# Add the From: and To: headers at the start!
lines = [f"From: {email_from}", f"To: {', '.join(email_to)}", ""]

lines.append(text)

msg = "\r\n".join(lines)
print("Message length is", len(msg))
print(msg)
server = smtplib.SMTP(email_smtp_server)
server.set_debuglevel(1)
server.sendmail(email_from, email_to, msg)
server.quit()