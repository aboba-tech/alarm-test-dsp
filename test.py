import smtplib

from_addr = 'noreply@dataspace.ru'
to_addrs  = 'maxim.nazarenko@dataspace.ru'.split()
print(to_addrs)
print("Enter message, end with ^D (Unix) or ^Z (Windows):")

# Add the From: and To: headers at the start!
lines = [f"From: {from_addr}", f"To: {', '.join(to_addrs)}", ""]
while True:
    try:
        line = input()
    except EOFError:
        break
    else:
        lines.append(line)

msg = "\r\n".join(lines)
print("Message length is", len(msg))
print(msg)
server = smtplib.SMTP("192.168.150.55")
server.set_debuglevel(1)
server.sendmail(from_addr, to_addrs, msg)
server.quit()