require 'csv'

class MyCSV
  def initialize(filepath="data.csv", columns=[])
    @csv_filepath = filepath
    @csv_columns = columns
  end
  def generate_value_from_type(coltype)
    case coltype
    when :int
      rand(1...100)
    when :text
      ('a'..'z').to_a.shuffle[0..30].join
    end
  end
  # 指定サイズでデータを生成する
  def write_generate_data(row_size, columns)
    # columnsを一つずつ確認 -> column
    # column == :int -> ランダムな数値をrow_siez分だけ生成
    # column == :text -> ランダムな文字列をrow_siez分だけ生成
    data = []
    row_size.times do
      row = []
      columns.each do |coltype|
        row << generate_value_from_type(coltype)
      end
      data << row
    end
    write_data(data)
  end
  def write_data(csv_data)
    CSV.open(@csv_filepath, 'w') do |csv|
      csv << @csv_columns
      csv_data.each do |row|
        csv << row
      end
    end
  rescue StandardError => e
    puts "CSVファイルの書き込み中にエラーが発生しました: #{e.message}"
  end
end
