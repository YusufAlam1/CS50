import re

url = input("URL: ").strip()
if matches := re.search(r"^(https?://)?(?:www\.)?twitter\.com/([a-z0-9_])", url, re.IGNORECASE):
    print(f"Usrname: {matches.group(1)}")