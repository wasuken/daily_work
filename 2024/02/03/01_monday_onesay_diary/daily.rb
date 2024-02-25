# 01

require 'date'
puts "1: 今日の一言を記録する"
puts "2: 過去の記録を見る"
choice = gets.chomp.to_i

def loop_input_date(msg)
  date = nil
  loop do
    puts msg
    input = gets.chomp
    begin
      _date = Date.parse(input)
      date = input
      break
    rescue
      puts "[日付エラー]"
    end
  end
  date
end

case choice
when 1
  date = loop_input_date("日付を入力してください（例：2023-01-01）:")
  puts "今日の一言を入力してください:"
  message = gets.chomp
  File.open("diary.txt", "a") do |file|
    file.puts "#{date}: #{message}"
  end
  puts "logged."
when 2
  puts "過去の記録："
  if File.exist?("diary.txt")
    File.foreach("diary.txt") do |line|
      puts line
    end
  else
    puts "記録が見つかりません。"
  end
else
  puts "無効な選択です。"
end
