class MyValidator
  def valid_email(v)
    pattern = /\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b/
    !(pattern =~ v).nil?
  end
  def valid_phone_number(v)
    pattern = /\b\d{2,4}-\d{2,4}-\d{4}\b/
    !(pattern =~ v).nil?
  end
  def valid_url(v)
    pattern =  /\bhttps?:\/\/[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|\/))\b/
    !(pattern =~ v).nil?
  end
  def valid_log_file_lines(lines)
    pattern = /\[(\d{4,4}-\d{2,2}-\d{2,2}) (\d{2,2}:\d{2,2}:\d{2,2})\] \[(.*?)\] \[(.*?)\] (.*)/
    target_lines = []
    lines.each do |line|
      if match_data = line.match(pattern)
        dt = match_data[1]
        tm = match_data[2]
        level = match_data[3]
        msg = match_data[5]
        if level == "ERROR"
          coremsg = msg.split(": ").last
          target_lines.push("[#{dt} #{tm}] #{coremsg}")
        end
      else
        puts "no match"
      end
    end
    target_lines
  end
end
