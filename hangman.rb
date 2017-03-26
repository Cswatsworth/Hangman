class KeywordClass


	attr_accessor :secret_word, :correct_guess, :wrong_guess 

	def initialize(word)
		@secret_word = word
		@correct_guess = store_word
		@wrong_guess = 6

	end

	def store_word
		store_word = Array.new(secret_word.length, '_ ')
	end

	def valid_characters?
		secret_word[/[A-Za-z]+/] == secret_word
		
	end

	def guess_include(guess)
		secret_word.include?(guess)

	end

	def win?(guesses)
		guesses.each do |guess|
			count_correct_guesses = 0
			results = false 
			if guess_letter(guess)
				count_correct_guesses += 1
				if count_correct_guesses = secret_word.length
					results true
			else
				false
				end
			end
		end
		results
	end

	def lose?(guesses)
		guesses.each do |guess|
			count_incorrect_guesses = 0
			results = false

			counter = 0
				if letter_guess(guess) == false 
					count_incorrect_guesses += 1

				if count_incorrect_guesses == 6 
					results = true 
				end
				end
		end
		results 

	end

	def guess_letter(letter)

		if secret_word.include?(letter)
			secret_word.each_char.with_index do |value, position|
				if value == letter 
					@correct_guess[position] = value
				end
			end
		else
			@wrong_guess -= 1
		end

		
	end

	def position(guess)
		word_array = secret_word.chars
		index_array = word_array.each_index.select{|i| word_array[i] == guess}
	end
end






# 	def guess(character)
# 		if character.nil? or /[A-Za-z]/.match(character) != nil or character == ''
# 			raise ArgumentError.new("Not a valid letter")
# 		end

# 		if @guesses.include? character or @wrong_guess.include? character
# 			return false
# 		end

# 		if @word.include? character
# 			@guesses == @guesses + character
# 			return true
# 		else
# 			@wrong_guess = @wrong_guess + character
# 			return true
# 		end
# 	end

# 	def word_with_guesses
# 		@word.gsub(/[^#{@guesses}]/, '_')
# 	end

# 	def check_win_or_lose
# 		if @wrong_guess.length == 7 
# 			return :lose
# 		end

# 		if word_with_guesses == @word 
# 			return :win
# 		end
	
# end
