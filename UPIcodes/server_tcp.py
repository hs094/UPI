import socket
import sys
import os
from createJson import makeJson

# Define the path where the notification.json file should be saved
json_file_path = "/Users/hardiksoni/Downloads/UPIcodes/notification.json"

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
port = 3200
s.bind(('127.0.0.1', port))
print('Socket binded to port', port)
s.listen(3)
print('Socket is listening')

c, addr = s.accept()
print('Got connection from', addr)
while True:
    msg = c.recv(1024).decode()
    msg = msg.split("/")
    print(msg)

    # Create the JSON file
    makeJson(msg[1], msg[2])

    # Verify if the JSON file was created
    if os.path.exists(json_file_path):
        if msg[0] == '0':
            os.system(f"xcrun simctl push booted blindPolaroid.Page.SMS {json_file_path}")
        else:
            os.system(f"xcrun simctl push booted blindPolaroid.Page.UPI-Pay {json_file_path}")
    else:
        print(f"Error: The file {json_file_path} does not exist.")
