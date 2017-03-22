require 'minitest/autorun'
require_relative 'hangman.rb'

class TestHangman < MiniTest::Test 

	 def test_length
	 	word = KeywordClass.new('keyword')
	 	assert_equal(7, word.secret_word.length)
	 end

	 def test_valid_characters
	 	word = KeywordClass.new('keyword')
	 	assert_equal(true, word.valid_characters?)
	 end

	 def test_valid_char_with_dash
	 	word = KeywordClass.new('keywor-d')
	 	assert_equal(false, word.valid_characters?)
	 end

	 def test_valid_char_with_number
	 	word = KeywordClass.new('k3yw0rd')
	 	assert_equal(false, word.valid_characters?)
	 end

	 def test_valid_char_with_capital_letters
	 	word = KeywordClass.new('KEYWORD')
	 	assert_equal(true, word.valid_characters?)
	 end 
end
