# 06
import numpy as np
import pandas as pd

# データの読み込み
# データの探索とクリーニング
# データの分析
# データの視覚化


# データの読み込み
df = pd.read_csv('./data.csv')
# 商品ごとの売れた数量順
print(df.groupby('ProductName')['Quantity'].sum().sort_values(ascending=False))
# チャレンジ: 季節別
