require 'test/unit'
require "fileutils"
require './main.rb'

class TestMyCSV < Test::Unit::TestCase
  def setup
    csv_columns = ['name', 'price', 'nums']
    csv_filepath = "./data.csv"

    @clz = MyCSV.new(csv_filepath, csv_columns)
    FileUtils.rm(csv_filepath) if File.exist?(csv_filepath)
  end
  def test_write_generate_data_check_size
    @clz.write_generate_data(100, [:text, :int, :int])
    assert_equal(File.readlines("data.csv").size, 101)
    @clz.write_generate_data(300, [:text, :int, :int])
    assert_equal(File.readlines("data.csv").size, 301)
  end
  def test_write_generate_data_exists
    @clz.write_generate_data(100, [:text, :int, :int])
    assert_true(File.exist?("data.csv"))
  end
  def test_write_data_exists
    csv_data = [
      [
        "test1", 100, 10,
      ],
      [
        "test2", 400, 12,
      ],
      [
        "test3", 200, 33,
      ],
      [
        "test4", 140, 38,
      ]
    ]
    @clz.write_data(csv_data)
    assert_true(File.exist?("data.csv"))
  end
end
