from socket import socket, AF_INET, SOCK_DGRAM

SERVER_IP = '127.0.0.1'; PORT_NUMBER = 3200
s = socket( AF_INET, SOCK_DGRAM )
s.connect((SERVER_IP,PORT_NUMBER))
# s.connect(('localhost', port))

while True:

    app = input("enter app to send notif to(0=sms, 1=upi, 2=pay request): ")

    z=""
    if app == "0" or app=="1":
        notificationTitle = input("enter notif title: ")
        notificationSubTitle = input("enter notif sub title: ")
        z= app+"/"+notificationTitle+"/"+notificationSubTitle
    elif app == "2":
        #NOTE: notificationTitle needs to match that of string in app delegate 
        # to identify it is a payment request
        notificationTitle = "Payment Request"
        notificationSubTitle = input("enter notif sub title: ")
        z= app+"/"+notificationTitle+"/"+notificationSubTitle
    s.sendall(z.encode())    

s.close()
