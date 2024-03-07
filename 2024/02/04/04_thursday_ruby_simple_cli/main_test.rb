require 'test/unit'
require 'open3'

class TestCLI < Test::Unit::TestCase
  def test_cli_output
    # CLIコマンドを実行し、標準出力と終了ステータスを取得
    output, status = Open3.capture2e('ruby', './main.rb', './')

    expected = <<~EOF
README.md
main.rb
main_test.rb
EOF
    # 出力の検証
    assert_match expected, output

    # 終了ステータスの検証
    assert_true status.success?
  end
  def test_cli_output_failed
    dirpath = "./kjfadskfjdas"
    # CLIコマンドを実行し、標準出力と終了ステータスを取得
    output, status = Open3.capture2e('ruby', './main.rb', "#{dirpath}")

    expected = <<~EOF
指定パスはディレクトリではない: #{dirpath}
EOF
    # 出力の検証
    assert_match expected, output

    # 終了ステータスの検証
    assert_true status.success?
  end
  def test_cli_output_help
    # CLIコマンドを実行し、標準出力と終了ステータスを取得
    output, status = Open3.capture2e('ruby', './main.rb', "-h")

    expected = <<~EOF
Usage: main.rb [OPTION]... [PATH]
EOF
    # 出力の検証
    assert_match expected, output

    # 終了ステータスの検証
    assert_true status.success?

    # CLIコマンドを実行し、標準出力と終了ステータスを取得
    output, status = Open3.capture2e('ruby', './main.rb', "--help")

    expected = <<~EOF
Usage: main.rb [OPTION]... [PATH]
EOF
    # 出力の検証
    assert_match expected, output

    # 終了ステータスの検証
    assert_true status.success?
  end
end
