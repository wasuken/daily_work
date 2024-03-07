require 'json'
require 'yaml'

# JSONファイルを読み込む
json_data = File.read('path/to/your/file.json')

# JSONデータをRubyのデータ構造に変換
data = JSON.parse(json_data)

# データをYAML形式で保存
File.open('path/to/your/output_file.yaml', 'w') do |file|
  file.write(YAML.dump(data))
end
