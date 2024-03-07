require "pathname"



def list(dirpath)
  unless File.directory?(dirpath)
    raise "指定パスはディレクトリではない: #{dirpath}"
  end
  Dir.glob("#{dirpath}/*").each do |fp|
    puts File.basename(fp)
  end
rescue => e
  puts e
  # puts "パスが不正です。"
end

def help
  puts "Usage: main.rb [OPTION]... [PATH]"
end

opts = ARGV.select{|s| s.match(/^-/)}
args = ARGV.select{|s| !s.match(/^-/)}

opts.each do |o|
  if o == "-h" || o == "--help"
    help
    exit
  end
end

if args.size > 0
  param_filepath = args[0]
  list(param_filepath)
else
  list(".")
end
