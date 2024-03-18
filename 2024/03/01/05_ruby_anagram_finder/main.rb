# 辞書ファイルを読み込む
dictionary = File.readlines('dictionary.txt').map(&:chomp)

# ユーザーから単語を入力してもらう
print "Enter a word: "
input_word = gets.chomp.downcase

# 入力された単語の文字をソートする
sorted_input = input_word.chars.sort.join.downcase

# アナグラムを見つける
anagrams = []
dictionary.each do |word|
  sorted_word = word.downcase.chars.sort.join
  anagrams << word if sorted_word == sorted_input
end

# 結果を出力する
if anagrams.empty?
  puts "No anagrams found for '#{input_word}'."
else
  puts "Anagrams for '#{input_word}':"
  puts "founds: #{anagrams.size}"
  anagrams.each { |anagram| puts anagram }
end
