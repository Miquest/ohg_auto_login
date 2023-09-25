import asyncio
import requests
import logging
import ohg_login
from requests.exceptions import ConnectionError


async def pinger():
    logging.basicConfig(filename="ohg-authorizer.log", filemode="w", encoding="utf-8")
    logging.info("Initiate the base pinger script to ensure an internet connection!")

    while True:
        try:
            test_url = "https://www.google.com"
            requests.get(test_url)
            print("Connected to the internet!")
            logging.info("Connection to the internet is stable!")
        except ConnectionError:
            logging.warning("Connection to the internet lost!")
            logging.info("Executing ohg_login.py to ensure internet connection!")

            # Execute the ohg_login script!
            id = ohg_login.OHGautoIdenifier()
            id.read_config()
            id.authorize()
        
        await asyncio.sleep(30)

asyncio.run(pinger())