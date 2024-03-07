require 'json'
require 'yaml'

# JSONファイルを読み込む
json_data = File.read('../01_python_api_json/data.json')

# JSONデータをRubyのデータ構造に変換
data = JSON.parse(json_data)

# データをYAML形式で保存
File.open('data_from_json.yaml', 'w') do |file|
  file.write(YAML.dump(data))
end
