# 03
import requests
from bs4 import BeautifulSoup

if __name__ == '__main__':
    response = requests.get('https://tenki.jp/forecast/2/5/3110/2201/')
    soup = BeautifulSoup(response.content, 'html.parser')

    today_weather = soup.find('div', 'weather-wrap').text.split()[0]

    today_high_temperature = soup\
        .find('div', class_='weather-wrap')\
        .select('.high-temp.temp')[0].text

    today_low_temperature = soup\
        .find('div', class_='weather-wrap')\
        .select('.low-temp.temp')[0].text

    print(f"温度: high::{today_high_temperature}, low::{today_low_temperature}")
    print(f"天候の状態: {today_weather}")
