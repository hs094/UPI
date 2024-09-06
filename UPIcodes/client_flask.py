import requests
import json

while True:
    app = input("Enter app to send notif to (0=sms, 1=upi, 2=pay req(show), 3=pay req(hide)): ")

    z = ""
    if app == "0" or app == "1":
        notificationTitle = input("Enter notif title: ")
        notificationSubTitle = input("Enter notif sub title: ")
        z = f"{app}/{notificationTitle}/{notificationSubTitle}"
    elif app == "2":
        notificationTitle = "Payment Request"
        notificationSubTitle = "Raj"
        z = f"{app}/{notificationTitle}/{notificationSubTitle}"
    elif app == "3":
        notificationTitle = "Payment Request"
        notificationSubTitle = "Charul"
        z = f"{app}/{notificationTitle}/{notificationSubTitle}"
    elif app == "4":
        notificationTitle = "Payment Request"
        notificationSubTitle = "Payment Request From Geet - Rs. 5000"
        z = f"{app}/{notificationTitle}/{notificationSubTitle}"
    elif app == "5":
        notificationTitle = "Payment Request"
        notificationSubTitle = "Payment Request From Flipkart - Rs. 2500"
        z = f"{app}/{notificationTitle}/{notificationSubTitle}"
    elif app == "6":
        notificationTitle = "Payment Request"
        notificationSubTitle = "Payment Request From UPI Pay - Rs. 5000"
        z = f"{app}/{notificationTitle}/{notificationSubTitle}"
    elif app == "7":
        notificationTitle = "Payment Request"
        notificationSubTitle = "Payment Request From Jasbeer - Rs. 1500"
        z = f"{app}/{notificationTitle}/{notificationSubTitle}"

    # Sending data as JSON payload
    response = requests.post('http://10.117.16.131:5000/appServer', json={"data": z})
    print(response.text)
