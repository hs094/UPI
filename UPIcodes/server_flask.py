from flask import Flask, json, request, jsonify
import os

from sqlalchemy import false
from createJson import makeJson

api = Flask(__name__)

@api.route('/appServer', methods=['POST'])
def predictor():
    print("got data")
    msg = request.data.decode("utf-8") 
    msg = msg.split("/")
    print(msg)
    makeJson(msg[1], msg[2])
    if msg[0]=='0':
        os.system("xcrun simctl push booted blindPolaroid.Page.SMS /Users/hardiksoni/Downloads/UPIcodes/notification.json")
    else:
        os.system("xcrun simctl push booted blindPolaroid.Page.UPI-Pay /Users/hardiksoni/Downloads/UPIcodes/notification.json")
    return "got data"


if __name__ == '__main__':
    api.run(debug=false, host='0.0.0.0') 
