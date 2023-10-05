import requests
import json
import logging
import os

class OHGautoIdenifier():
    def __init__(self):
        self.username = None
        self.password = None

    def read_config(self):

        logging.basicConfig(filename="ohg-authorizer.log", encoding="utf-8", filemode="w", level=logging.DEBUG)
        
        logging.info("Init the OHG Wifi Identifier!")

        print(os.getcwd())

        path = str(os.getcwd()) + "\config.json"
        with open(path, "r") as f:
            content = json.loads(f.read())
        
        self.username = content[0]["username"]
        self.password = content[0]["password"]

    def authorize(self):

        print("Executing OHG Script")
        logging.info("Starting authentication process!")
        post_data = {
            "user": self.username,
            "password": self.password
        }

        url = "https://10.80.0.1/api/captiveportal/access/logon/0/"
        
        try:
            request = requests.post(url, post_data, verify=False)
            response = json.loads(request.text)

            if response["clientState"] == "NOT_AUTHORIZED":
                logging.error("Authentication failed by ohg_login.py")

            if response["clientState"] == "AUTHORIZED":
                logging.info("Authentication was successful!")      
        except Exception as e:
            logging.error(e) 