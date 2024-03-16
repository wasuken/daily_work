# 行チェック: 先頭になにかある
# 行中チェック: 特定のパターンがある
def line_parse(line)
  parsed_str = line
  case line
  when /^# /
    n = line.match(/^#+/)[0].length
    s = line.gsub(/^#+/, '')
    parsed_str = "<h#{n}>#{s}</h#{n}>"
  end
  parsed_str
end
def strong(line)
  mt = line.match(/\*\*(.*)\*\*/)
  if mt
    v = mt[1]
    "<strong>#{v}</strong>"
  else
    line
  end
end
def strike(line)
  mt = line.match(/~~(.*)~~/)
  if mt
    v = mt[1]
    "<strike>#{v}</strike>"
  else
    line
  end
end
def in_line_parse(line)
  strike(strong(line))
end
# 行ごとの配列に分割し、行チェックを行う
def main_stream(fp)
  rst = ""
  File.readlines(fp).each do |l|
    rst += in_line_parse(line_parse(l))
  end
  rst
end

puts main_stream("sample.md")
