# 06
import numpy as np
import pandas as pd
import random

# 検証データを生成するスクリプト

'''
# header
Date: 販売が行われた日付。
SalesID: 販売トランザクションの一意のID。
ProductID: 商品の一意のID。
ProductName: 商品名。
Quantity: 販売された商品の数量。
UnitPrice: 商品の単価。
CustomerID: 購入した顧客のID。
'''

CSV_PATH = "./data.csv"

def generate_random_integers(num_rows, min_value, max_value):
    return np.random.randint(min_value, max_value+1, size=num_rows)

def generate_random_id(num_rows, min_value, max_value, digits):
    return [f"{id}".zfill(digits) for id in np.random.randint(min_value, max_value+1, size=num_rows)]

electronic_products = ['スマートフォン', 'タブレット', 'ノートPC', 'イヤホン', 'スマートウォッチ']
clothing_products = ['Tシャツ', 'ジーンズ', 'スニーカー', 'ジャケット', 'ハット']
food_products = ['チョコレート', 'クッキー', 'ジュース', 'パスタ', 'チーズ']
all_products = electronic_products + clothing_products + food_products

def generate_product_names(num_rows):
    return [random.choice(all_products) for _ in range(num_rows)]

if __name__ == '__main__':
    # 100個のランダムな数値を生成
    data = np.random.randn(100)
    header_contents = 'Date,SalesID,ProductID,Quantity,UnitPrice,CustomerID'
    num_rows = 10000
    id_min_value = 0
    id_max_value = 99
    df = pd.DataFrame({
        'Date': pd.date_range(start='2023-01-01', periods=num_rows),
        'SalesID': generate_random_id(num_rows, id_min_value, id_max_value, 5),
        'ProductID': generate_random_id(num_rows, id_min_value, id_max_value, 7),
        'ProductName': generate_product_names(num_rows),
        'Quantity': generate_random_integers(num_rows, 5, 300),
        'UnitPrice': generate_random_integers(num_rows, 100, 100000),
        'CustomerID': generate_random_id(num_rows, id_min_value, id_max_value, 5),
    })
    df.to_csv(CSV_PATH, index=False)
