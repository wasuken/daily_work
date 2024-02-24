require 'test/unit'
require './main.rb'

class TestRegularExpressions < Test::Unit::TestCase
  def setup
    @myv = MyValidator.new
  end
  def test_email_pattern
    actual = "test@test.com"
    assert_true(@myv.valid_email(actual))
  end
  def test_email_illegal_pattern
    actual = "test@@@@@@test......com"
    assert_false(@myv.valid_email(actual))
  end

  def test_phone_number_pattern
    actual = "080-1237-7888"
    assert_true(@myv.valid_phone_number(actual))
  end
  def test_phone_number_illegal_pattern
    actual = "080------9900-12377888"
    assert_false(@myv.valid_phone_number(actual))
  end

  def test_url_pattern
    actual = "http://localhost:3000"
    assert_true(@myv.valid_url(actual))
  end
  def test_url_illegal_pattern
    actual = "dsajflkdsafdajflkdsa"
    assert_false(@myv.valid_url(actual))
  end
  def test_log_file_lines
    contents = <<EOF
[2023-02-20 10:30:45] [INFO] [system] System startup
[2023-02-20 10:32:10] [ERROR] [user] Error occurred: Unable to access the database
[2023-02-20 10:33:30] [INFO] [user] User logged in
EOF
    lines = contents.split("\n")
    expected = [
      "[2023-02-20 10:32:10] Unable to access the database"
    ]
    assert_equal(@myv.valid_log_file_lines(lines), expected)
  end
end
