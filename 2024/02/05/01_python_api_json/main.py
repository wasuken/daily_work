import requests
import json

resp = requests.get("https://api.openbd.jp/v1/get?isbn=9784774196077")
# print(resp.json())

with open("data.json", "w") as f:
    json.dump(resp.json(), f)
