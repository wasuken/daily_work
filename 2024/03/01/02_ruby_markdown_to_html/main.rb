HEADER_PATTERN = /^(#+)\s*(.*)/
STRONG_PATTERN = /\*\*(.*?)\*\*/
STRIKE_PATTERN = /~~(.*?)~~/

def process_inline(line)
  line = line.gsub(STRONG_PATTERN, '<strong>\1</strong>')
  line.gsub(STRIKE_PATTERN, '<strike>\1</strike>')
end

def process_header(line)
  if match = line.match(HEADER_PATTERN)
    level, text = match.captures
    "<h#{level.length}>#{text}</h#{level.length}>"
  else
    line
  end
end

def process_list_common(lines, c = '-')
  listing = false
  rst = []
  for line in lines
    rst << "</ul>" if listing && line[0] != c
    rst << "<ul>" if !listing && line[0] == c

    if line[0] == c
      rst << "<li>#{line[2,line.length]}</li>"
    else
      rst << line
    end
    listing = line[0] == c
  end
  rst
end

def process_list(lines)
  process_list_common(process_list_common(lines, '*'), '-')
    .join
    .gsub(/(?:\n\n|\A)(.*?)(?:\n\n|\z)/m, '<div>\1</div>')
end

def main_stream(file_path)
  lines = File.readlines(file_path).map { |line|
    process_inline(process_header(line))
  }
  contents_html = process_list(lines)
  <<"EOT"
<html>
<head></head>
<body>
#{contents_html}
</body>
</html>
EOT
end

puts main_stream("sample.md")
