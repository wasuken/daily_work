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
  def valid_log_file_line(lines)
  end
end
