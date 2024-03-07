import pandas as pd

cdata = pd.read_csv("./data.csv", converters={u'人口（総数）': lambda x: pd.to_numeric(x, errors='coerce')})

# print(cdata.head())
# print(cdata.tail())
# print(cdata.describe())

hiroshima_records = cdata['都道府県名'] == '広島県'

print(int(cdata[hiroshima_records]['人口（総数）'].mean()))

cdata[hiroshima_records].to_csv("hiroshima_data.csv")
