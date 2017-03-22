class KeywordClass


	attr_accessor :secret_word, :store_word, :wrong

	def initialize(word)
		@secret_word = word
		@store_word = store_word
		@wrong_guess = 6

	end

	def store_word
		store_word = Array.new(secret_word.length, '_ ')
	end

	def valid_characters?
		secret_word[/[A-Za-z]+$/] == secret_word
		
	end

	# def guess_letter(guess)
	# 	secret_word.include?(guess)

	# end

	# def wrong_guess
	# 	wrong_guess.count +=1

	# end

	# def guess(character)
	# 	if character.nil? or /[^A-Za-z]/.match(character) != nil or character == ''
	# 		raise ArgumentError.new("Not a valid letter")
	# 	end

	# 	if @guesses.include? character or @wrong_guess.include? character
	# 		return false
	# 	end

	# 	if @word.include? character
	# 		@guesses == @guesses + character
	# 		return true
	# 	else
	# 		@wrong_guess = @wrong_guess + character
	# 		return true
	# 	end
	# end

	# def word_with_guesses
	# 	@word.gsub(/[^#{@guesses}]/, '_')
	# end

	# def check_win_or_lose
	# 	if @wrong_guess.length >=7
	# 		return :lose
	# 	end

	# 	if word_with_guesses == @word 
	# 		return :win
	# 	end

	# 	:play
	
end
