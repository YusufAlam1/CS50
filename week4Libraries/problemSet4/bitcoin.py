import sys
import json
import requests

if len(sys.argv) < 2:
    sys.exit("Missing command-line argument")

try:
    amount = int(sys.argv[1])
except ValueError:
    sys.exit("Command-line argument is not a number")

response = requests.get("https://api.coindesk.com/v1/bpi/currentprice.json")
o = response.json()

for currency, details in o["bpi"].items():
    if currency == "USD":
        usd_rate = details['rate_float']  # Use 'rate_float' for numerical value
        converted_amount = amount * usd_rate
        print(f"${converted_amount:,.4f}")