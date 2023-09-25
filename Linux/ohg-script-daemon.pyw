import asyncio
import requests
import logging
import ohg_login
import subprocess
from requests.exceptions import ConnectionError


async def pinger():
    logging.basicConfig(filename="ohg-daemon.log", filemode="w", encoding="utf-8", level=logging.DEBUG)
    logging.info("Initiate the base pinger script to ensure an internet connection!")

    # Get current WIFI SSID
    output = subprocess.check_output(['sudo', 'iwgetid']).decode()
    ssid = output.split('"')[1]

    while True:
        if ssid == "ohg":
            try:
                test_url = "https://www.google.com"
                requests.get(test_url)
                logging.info("Connection to the internet is stable!")
            except ConnectionError:
                logging.warning("Connection to the internet lost!")
                logging.info("Executing ohg_login.py to ensure internet connection!")

                # Execute the ohg_login script!
                id = ohg_login.OHGautoIdenifier()
                id.read_config()
                id.authorize()
        else:
            logging.info("Not connected to OHG Wifi. Not executing the authentication process!")
        
        await asyncio.sleep(30)

asyncio.run(pinger())
